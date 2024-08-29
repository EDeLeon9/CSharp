using System;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Input;
using System.Windows.Media;
using DBConnections;
using Hardcodet.Wpf.TaskbarNotification;

namespace Workath
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            dtcMainViewModel.UpdateGridLayout += () => grdWorkStamps.UpdateLayout();  //Se usa para actualizar con anticipación lo visual del DataGrid
            dtcMainViewModel.ScrollToWorkStamp += (obj) => {
                if (obj != null)
                {
                    grdWorkStamps.UpdateLayout();
                    grdWorkStamps.ScrollIntoView(obj);
                    grdWorkStamps.Focus();
                } 
            };
            dtcMainViewModel.BeginEditWorkStampDescription += BeginEditWorkStampDescription;
            DBConnection.GlobalConnections.Add(new DBConnection("127.0.0.1", "workath_db", "root", "4533"));
            DBConnection.GlobalConnections[0].ManualConnection = true;
            DBConnection.GlobalConnections[0].Connect();
            dtcMainViewModel.InitStaticUiCollections();  //Se carga antes de mostrar la ventana para que no salgan los encabezados de columna vacíos

            //tbiTaskbarIcon.Icon = Properties.Resources.OpenWorkStampIcon //Para usar un recurso con Properties.Resources se hace usa agregando el recurso con clic derecho en el proyecto -> Propiedades -> Recursos
        }

        private void Window_ContentRendered(object sender, EventArgs e)
        {
            dtcMainViewModel.InitInteractiveUiCollections();
            dtcMainViewModel.LoadWorkStamps(true);
            DBConnection.GlobalConnections[0].Disconnect();
            DBConnection.GlobalConnections[0].ManualConnection = false;
        }

        //Permite mover la ventana con el fondo de la ventana
        private void Window_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            this.DragMove();
        }

        private void Window_Closing(object sender, CancelEventArgs e)
        {
            int idOpenWorkStamp = 0;
            WorkStamp.SelectOpenWorkStamp(ref idOpenWorkStamp);
            if (idOpenWorkStamp > 0)
            {
                if (MessageBox.Show("There is an open work stamp. Do you want to exit the application anyway?", Application.Current.MainWindow.Title, MessageBoxButton.YesNo, MessageBoxImage.Exclamation) == MessageBoxResult.No)
                    e.Cancel = true;
            }
        }

        private void grdWorkStamps_PreparingCellForEdit(object sender, DataGridPreparingCellForEditEventArgs e)
        {
            dtcMainViewModel.EditingSelectedWorkStamp = true;

            if (e != null && e.EditingElement.GetType() == typeof(ComboBox))
                ((ComboBox)e.EditingElement).IsDropDownOpen = true;
        }

        private void BeginEditWorkStampDescription()
        {
            ((DataGridCell)grdWorkStamps.Columns.Where(x => (string)x.Header == "Description").FirstOrDefault()?.GetCellContent(grdWorkStamps.SelectedItem)?.Parent)?.Focus();
            grdWorkStamps.BeginEdit();
        }

        private void DataGridCell_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            if (sender != null && e.KeyboardDevice.Modifiers == ModifierKeys.Control)
            {
                DataGridCell cell = (DataGridCell)sender;  //No almacenar cell.Content ya que el Content cambia si entra en modo edición (con BeginEdit() dentro el if de Key.V) y hay que volver a obtener Content

                if (e.Key == Key.C)
                {
                    //Para poder hacer el copy al Clipboard se tuvo que colocar ClipboardCopyMode="None" al DataGrid

                    if (cell.Content.GetType() == typeof(TextBlock))
                    {
                        Clipboard.SetText(((TextBlock)cell.Content).Text);
                    }
                    else if (cell.Content.GetType() == typeof(ContentPresenter))
                    {
                        DependencyObject child = VisualTreeHelper.GetChild((ContentPresenter)cell.Content, 0);
                        if (child.GetType() == typeof(TextBlock))
                        {
                            Clipboard.SetText(((TextBlock)child).Text);
                        }
                    }
                    else if (cell.Content.GetType().Name == "TextBlockComboBox" || cell.Content.GetType() == typeof(ComboBox))
                    {
                        Clipboard.SetText(((ComboBox)cell.Content).Text);
                    }
                }
                else if (e.Key == Key.V)
                {
                    if (grdWorkStamps.BeginEdit())
                    {
                        if (cell.Content.GetType() == typeof(TextBox))
                        {
                            ((TextBox)cell.Content).Text = Clipboard.GetText();
                        }
                        else if (cell.Content.GetType() == typeof(ContentPresenter))
                        {
                            DependencyObject child = VisualTreeHelper.GetChild((ContentPresenter)cell.Content, 0);  //Se obtiene el child luego de hacer BeginEdit() ya que cambia de TextBlock a DateTimeTextBoxCell
                            if (child.GetType() == typeof(DateTimeTextBoxCell))
                            {
                                ((DateTimeTextBoxCell)child).Text = Clipboard.GetText();
                            }
                        }
                    }
                }
            }
        }

        //No se usa este método para el evento del CopyingRowClipboardContent del DataGrid para copiar una sola celda ya que deja un salto de línea al final
        //private void grdWorkStamps_CopyingRowClipboardContent(object sender, DataGridRowClipboardEventArgs e)
        //{
        //    //DataGridClipboardCellContent selectedValue = e.ClipboardRowContent[((DataGrid)sender).CurrentCell.Column.DisplayIndex];
        //    DataGridClipboardCellContent selectedContent = e.ClipboardRowContent.Where(x => x.Column == ((DataGrid)sender).CurrentCell.Column).FirstOrDefault();
        //    DataGridClipboardCellContent resultContent = new DataGridClipboardCellContent(selectedContent.Item, selectedContent.Column, selectedContent.Content);
        //    e.ClipboardRowContent.Clear();
        //    e.ClipboardRowContent.Add(resultContent);
        //    foreach (DataGridClipboardCellContent x in e.ClipboardRowContent)
        //        Debug.WriteLine("x.Content: " + x.Content);
        //}
    }
}
