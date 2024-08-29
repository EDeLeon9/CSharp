using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
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
    /// Lógica de interacción para Principal.xaml
    /// </summary>
    public partial class Principal : Page
    {
        private bool iniciando = false;
        private DataCapitulos data;
        private bool agregandoRegistro = false;

        public Principal(bool inicio = false)
        {
            InitializeComponent();
            iniciando = true;
            btnRutaArchivos.Content = Directory.GetCurrentDirectory() + @"\RutaArchivos.txt";
            Generar();
            chkAbrirConEdge.IsChecked = data.Variables[0].EndsWith(DataCapitulos.V_BrowserVar_MicrosoftEdge);
            iniciando = false;
        }


        private void Generar()
        {
            data = new DataCapitulos();
            data.FormatearTitulo = FormatearTitulo;
            data.FormatearDireccion = FormatearDireccion;
            if (iniciando)
            {
                txtDesde.Text = data.Desde;
                txtIndice.Text = data.IndiceCapitulosExpress.ToString();
                data.BackupArchivos();
            }
            else
            {
                data.Desde = txtDesde.Text;
				data.ModificarVariable(DataCapitulos.V_From, txtDesde.Text);
			}
			data.GenerarCapitulos(iniciando);
            data.BarajarLista();
            dgrTabla1.ItemsSource = data.DataMostrar;
        }


		private void btnRutaArchivos_Click(object sender, EventArgs e)
        {
            Process proc = new Process();
            proc.StartInfo.UseShellExecute = true;
            proc.StartInfo.FileName = Directory.GetCurrentDirectory();
            proc.Start();
        }


        private void dgrTabla1_DataGridRow_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
            {
				RegistroCap registroCap = (RegistroCap)dgrTabla1.SelectedValue;
				if (registroCap != null)
				{
					if (rdoSitioWeb1.IsChecked == true)
						data.AbrirWeb(registroCap,
							string.IsNullOrWhiteSpace(registroCap.Direccion) 
							? AccionAbrirWeb.TemporadasWeb1
							: AccionAbrirWeb.CapituloWeb1);
					else if (rdoSitioWeb2.IsChecked == true)
						data.AbrirWeb(registroCap,
							string.IsNullOrWhiteSpace(registroCap.Direccion)
							? AccionAbrirWeb.TemporadasWeb2
							: AccionAbrirWeb.CapituloWeb2);
					else if (rdoSitioWeb3.IsChecked == true)
						data.AbrirWeb(registroCap,
							string.IsNullOrWhiteSpace(registroCap.Direccion)
							? AccionAbrirWeb.TemporadasWeb3
							: AccionAbrirWeb.CapituloWeb3);
					txtTitulo.Focus();
				}
			}
		}


		private void DataGridContextMenuOpt1_Click(object sender, RoutedEventArgs e)
        {
            if (rdoSitioWeb1.IsChecked == true)
                data.AbrirWeb((RegistroCap)dgrTabla1.SelectedValue, AccionAbrirWeb.TemporadasWeb1);
            else if (rdoSitioWeb2.IsChecked == true)
                data.AbrirWeb((RegistroCap)dgrTabla1.SelectedValue, AccionAbrirWeb.TemporadasWeb2);
            else if (rdoSitioWeb3.IsChecked == true)
                data.AbrirWeb((RegistroCap)dgrTabla1.SelectedValue, AccionAbrirWeb.TemporadasWeb3);
        }


        private void DataGridContextMenuOpt2_Click(object sender, RoutedEventArgs e)
        {
            if (data.AgregarRegistroCapitulo((RegistroCap)dgrTabla1.SelectedValue, DataCapitulos.NombreCapitulosOmitidos))
            {
                data.DataMostrar.Remove((RegistroCap)dgrTabla1.SelectedValue);  // Si los valores son repetidos el Equals() y/o el GetHashCode() de la clase juega un papel importante en el Remove()
            }
        }


        private void chkAbrirConEdge_CheckChanged(object sender, RoutedEventArgs e)
        {
            if (!iniciando)
                data.ModificarVariable(DataCapitulos.V_BrowserVar, chkAbrirConEdge.IsChecked == true ? DataCapitulos.V_BrowserVar_MicrosoftEdge : DataCapitulos.V_BrowserVar_Default);
        }


        private void btnGenerar_Click(object sender, RoutedEventArgs e)
        {
            Generar();
        }


		private void btnGenerar_Express_Click(object sender, RoutedEventArgs e)
		{
            if (!btnGenerarExpress.Content.ToString().StartsWith("S"))
			{
				if (int.TryParse(txtIndice.Text, out int indice))
				{
					data.IndiceCapitulosExpress = indice;
					data.ModificarVariable(DataCapitulos.V_Express, data.IndiceCapitulosExpress.ToString());

					var temporadasConMaxCap_Express = data.TemporadasConMaxCap_Express.Where(x => x.CapituloExpress_Indice == data.IndiceCapitulosExpress);
					if (temporadasConMaxCap_Express.Count() > 0)
					{
						List<Tuple<int, int>> noVistos = new List<Tuple<int, int>>();
                        for (int t = 1; t <= temporadasConMaxCap_Express.Max(x => x.Temporada); t++)
                        {
							for (int c = 1; c <= temporadasConMaxCap_Express.Where(x => x.Temporada == t).First().Capitulo; c++)
							{
                                if (!data.ExpressVistos.Any(x => x.Temporada == t && x.Capitulo == c))
                                    noVistos.Add(new Tuple<int, int>(t, c));
							}
						}
                        if (noVistos.Count > 0)
						{
							Random random = new Random();
							Tuple<int, int> capitulo = noVistos.OrderBy(x => random.Next(1000)).First();
                            if (MessageBox.Show($"{string.Format("S{0}E{1}", capitulo.Item1, capitulo.Item2)}\n¿Agregar?", "Generar Express", MessageBoxButton.YesNo, MessageBoxImage.Question)
                                == MessageBoxResult.Yes)
                            {
								data.AgregarRegistroCapitulo(new RegistroCap()
								{
									Temporada = capitulo.Item1,
									Capitulo = capitulo.Item2,
									CapituloExpress_Indice = data.IndiceCapitulosExpress
								}, DataCapitulos.NombreExpressVistos);
								btnGenerarExpress.Content = string.Format("S{0}E{1}", capitulo.Item1, capitulo.Item2);
							}
						}
                        else MessageBox.Show("No hay más capítulos no vistos.", "Generar Express", MessageBoxButton.OK, MessageBoxImage.Exclamation);
					}
					else btnGenerarExpress.Content = "Índice inválido";
				}
				else btnGenerarExpress.Content = "Índice no num.";
			}
            else MessageBox.Show("Capítulo ya generado y agregado al listado de vistos.", "Generar Express", MessageBoxButton.OK, MessageBoxImage.Exclamation);
		}


		private void btnAgregados_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.Navigate(new ListadoXml(DataCapitulos.NombreCapitulosAgregados));
        }


        private void btnOmitidos_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.Navigate(new ListadoXml(DataCapitulos.NombreCapitulosOmitidos));
        }


        private void btnTemporadasConMaxCap_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.Navigate(new ListadoXml(DataCapitulos.NombreTemporadasConMaxCap));
        }

        private void btnConfigWeb_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.Navigate(new ConfigWeb(data));
        }


        private void dgrTabla1_RowEditEnding(object sender, DataGridRowEditEndingEventArgs e)
        {
            return; //Se deshabilitó agregar nuevas filas en el DataGrid (CanUserAddRows="False")

			RegistroCap regCap = (RegistroCap)dgrTabla1.SelectedValue;
            if (regCap != null && regCap.Temporada > 0 && regCap.Capitulo > 0)
            {
                if (agregandoRegistro)
                {
                    data.AgregarRegistroCapitulo(regCap, DataCapitulos.NombreCapitulosAgregados);
                }
                data.ModificarTituloDireccion(regCap);
            }
            agregandoRegistro = false;
        }


        private string FormatearDireccion(string direccion)
        {
            string nuevaDireccion = direccion;
            if (nuevaDireccion.EndsWith("/"))
                nuevaDireccion = nuevaDireccion[..(nuevaDireccion.Length - 1)];
            if (nuevaDireccion.Contains("/"))
                nuevaDireccion = nuevaDireccion[(nuevaDireccion.LastIndexOf("/") + 1)..];
            return nuevaDireccion;
        }


        private string FormatearTitulo(string titulo)
        {
            string nuevoTitulo = FormatearDireccion(titulo);
            if (!string.IsNullOrWhiteSpace(nuevoTitulo) && nuevoTitulo.Contains("-") && char.IsNumber(nuevoTitulo[0]))
            {
                nuevoTitulo = nuevoTitulo[(nuevoTitulo.IndexOf("-") + 1)..];
                nuevoTitulo = nuevoTitulo.Replace("-", " ");
                nuevoTitulo = char.ToUpper(nuevoTitulo[0]) + nuevoTitulo.Substring(1);
            }
            return nuevoTitulo.Trim();
        }
        

        private void dgrTabla1_AddingNewItem(object sender, AddingNewItemEventArgs e)
        {
            agregandoRegistro = true;
        }


        public void CerrandoVentana()
        {
            dgrTabla1_RowEditEnding(null, null);
        }
    }
}
