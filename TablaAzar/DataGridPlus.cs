using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Diagnostics;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Threading;

namespace TablaAzar
{
    public class DataGridTextColumnPlus : DataGridTextColumn
    {
        public double WidthRatio { get; set; }
        public double InitialWidth { get; set; }

        public DataGridTextColumnPlus() : base()
        {
            WidthRatio = 0;
            this.Dispatcher.BeginInvoke(SetPixelWidth, DispatcherPriority.Background);  //Background asegura que esté todo cargado ya que es un nivel bajo de priority suficiente para que se ejecute bien y no tenga tanto delay
        }

        private void SetPixelWidth()
        {
            InitialWidth = this.ActualWidth;
            if (this.Width.UnitType == DataGridLengthUnitType.Star)
            {
                WidthRatio = this.Width.Value;
                this.Width = new DataGridLength(this.ActualWidth, DataGridLengthUnitType.Pixel);
            }
        }
    }



    public class DataGridPlus : DataGrid
    {
        public double? NoColumnWidth { get; set; }  //Con ? se le puede asignar null
        public double TotalColumnWidthRatio { get; set; }
        public double InitialGridWidth { get; set; }
        public double InitialTotalColWidth { get; set; }
        private double? previousGridWith;  //Con ? se le puede asignar null

        private DependencyPropertyDescriptor dependencyPropertyDescriptor;

        //No se usa esto para asignar el evento solamente al objeto creado:
        //static DataGridPlus()
        //{
        //    DataGrid.ActualWidthProperty.OverrideMetadata(typeof(DataGridPlus), new FrameworkPropertyMetadata() { PropertyChangedCallback = OnActualWidthChanged });
        //}
        //ya que el tipo de Metadata de ActualWidth no es FrameworkPropertyMetadata sino ReadOnlyFrameworkPropertyMetadata, pero esa clase es interna
        //El tipo de metadata se obtuvo con:
        //DependencyPropertyDescriptor.FromProperty(DataGrid.ActualWidthProperty, typeof(DataGridPlus)).Metadata.GetType()

        public DataGridPlus() : base()
        {
            TotalColumnWidthRatio = 0;
            InitialGridWidth = 0;
            InitialTotalColWidth = 0;

            // Se ejecutará OnActualWidthChanged() cuando el ActualWidth del DataGrid cambie. Esto es gracias a al DependencyProperty ActualWidthProperty del DataGrid
            dependencyPropertyDescriptor = DependencyPropertyDescriptor.FromProperty(DataGrid.ActualWidthProperty, typeof(DataGridPlus));
            dependencyPropertyDescriptor.AddValueChanged(this, OnActualWidthChanged);
            //Recordar: No usar DependencyPropertyDescriptor.DesignerCoerceValueCallback para asignar un evento a CoerceValueCallback. En su lugar usar DependencyProperty.OverrideMetadata()
            this.Unloaded += (sender, e) => dependencyPropertyDescriptor.RemoveValueChanged(this, OnActualWidthChanged);  //Se usa para evitar "Memory Leak" por usar AddValueChanged()

            this.Dispatcher.BeginInvoke(() => InitialGridWidth = this.ActualWidth, DispatcherPriority.Background);  //Background asegura que esté todo cargado ya que es un nivel bajo de priority suficiente para que se ejecute bien y no tenga tanto delay
        }

        private void OnActualWidthChanged(object sender, EventArgs e)
        {
            DataGridPlus dataGrid = (DataGridPlus)sender;
            ObservableCollection<DataGridColumn> columnsCollection = dataGrid.Columns;
            if (columnsCollection != null)
            {
                double previousTotalColWidth = 0;
                if (dataGrid.previousGridWith == null)
                    dataGrid.previousGridWith = dataGrid.InitialGridWidth;

                foreach (DataGridTextColumnPlus column in columnsCollection)
                {
                    //Lo calcula una sola vez
                    if (dataGrid.NoColumnWidth == null)
                    {
                        dataGrid.InitialTotalColWidth += column.InitialWidth;
                        if (column.WidthRatio > 0)
                            dataGrid.TotalColumnWidthRatio += column.WidthRatio;
                    }
                    previousTotalColWidth += column.ActualWidth;
                }

                if (dataGrid.NoColumnWidth == null && dataGrid.TotalColumnWidthRatio > 0)  //Lo calcula una sola vez cuando NoColumnWidth == null
                    dataGrid.NoColumnWidth = dataGrid.InitialGridWidth - dataGrid.InitialTotalColWidth;

                if (dataGrid.NoColumnWidth != null)  //Si no hay columnas NonContainerWidth sigue siendo null
                {
                    double previousContainerWidth = dataGrid.previousGridWith.GetValueOrDefault(0) - dataGrid.NoColumnWidth.GetValueOrDefault(0);
                    double actualContainerWidth = dataGrid.ActualWidth - dataGrid.NoColumnWidth.GetValueOrDefault(0);

                    //Se usan estas variables redondeadas ya que al mover manualmente las columnas queda una microscópica diferencia
                    double rPreviousTotalColWidth = Math.Round(previousTotalColWidth, 6);
                    double rPreviousContainerWidth = Math.Round(previousContainerWidth, 6);
                    double rActualContainerWidth = Math.Round(actualContainerWidth, 6);

                    if ((dataGrid.ActualWidth > dataGrid.previousGridWith && rPreviousTotalColWidth <= rActualContainerWidth && rPreviousTotalColWidth >= rPreviousContainerWidth)
                        || (dataGrid.ActualWidth < dataGrid.previousGridWith && rPreviousTotalColWidth >= rActualContainerWidth && rPreviousTotalColWidth <= rPreviousContainerWidth))
                    {
                        double newTotalColWidth = 0;
                        DataGridTextColumnPlus biggestRatioColumn = null;
                        foreach (DataGridTextColumnPlus column in columnsCollection)
                        {
                            if (column.WidthRatio > 0)
                            {
                                column.Width = column.Width.Value + ((actualContainerWidth - previousTotalColWidth) * (column.WidthRatio / dataGrid.TotalColumnWidthRatio));  //Se puede asignar directamente column.Width porque DataGridLength tiene un "static implicit operator" que permite usar el operador "="
                                if (biggestRatioColumn == null || column.WidthRatio >= biggestRatioColumn.WidthRatio)
                                    biggestRatioColumn = column;
                            }
                            newTotalColWidth += column.Width.Value;  //No usar ActualWidth porque por defecto ActualWidth no puede ser menor a cierto valor y no se hará correctamente el ajuste
                        }
                        //Ajusta el tamaño de la última columna que tiene el WidthRatio más grande ya que aveces quedan microdiferencias al dar el tamaño de las columnas
                        if (actualContainerWidth - newTotalColWidth != 0)
                            biggestRatioColumn.Width = new DataGridLength(actualContainerWidth - (newTotalColWidth - biggestRatioColumn.Width.Value));  //No se usa el parámetro DataGridLengthUnitType ya que por defecto son pixeles
                    }
                }
            }
            if (dataGrid.ActualWidth > 0)
                dataGrid.previousGridWith = dataGrid.ActualWidth;
        }
    }
}
