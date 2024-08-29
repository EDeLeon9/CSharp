using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Channels;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace TablaAzar
{
    /// <summary>
    /// Lógica de interacción para ListadoXml.xaml
    /// </summary>
    public partial class ListadoXml : Page
    {
        private DataCapitulos data;
        private ObservableCollection<RegistroCap> observableItemSource;
        private bool agregandoRegistro = false;
        private string _nombreArchivo;

        public ListadoXml(string nombreArchivo)
        {
            InitializeComponent();
            _nombreArchivo = nombreArchivo;
            data = new DataCapitulos();
            switch (_nombreArchivo)
            {
                case DataCapitulos.NombreCapitulosAgregados:
                    observableItemSource = data.CapitulosAgregados;
                    break;
                case DataCapitulos.NombreCapitulosOmitidos:
                    observableItemSource = data.CapitulosOmitidos;
                    break;
                case DataCapitulos.NombreTemporadasConMaxCap:
                    observableItemSource = data.TemporadasConMaxCap;
                    break;
            }
            dgrTabla1.ItemsSource = observableItemSource;
        }


        private void btnGuardar_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("¿Los cambios son correctos?", "Guardando cambios...", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                data.Serializar(_nombreArchivo, observableItemSource);
                this.NavigationService.GoBack();
            }
        }

        private void btnCancelar_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.GoBack();
        }


        private void dgrTabla1_RowEditEnding(object sender, DataGridRowEditEndingEventArgs e)
        {
            RegistroCap regCap = (RegistroCap)dgrTabla1.SelectedValue;
            if (regCap.Temporada > 0 && regCap.Capitulo > 0)
            {
                if (agregandoRegistro)
                {
                    data.AgregarRegistroCapitulo(regCap, _nombreArchivo);
                }
            }
            agregandoRegistro = false;
        }


        private void dgrTabla1_AddingNewItem(object sender, AddingNewItemEventArgs e)
        {
            agregandoRegistro = true;
        }

        private void btnBorrar_Click(object sender, RoutedEventArgs e)
        {
            if (dgrTabla1.SelectedValue is RegistroCap)
                observableItemSource.Remove((RegistroCap)dgrTabla1.SelectedValue);
        }
    }
}
