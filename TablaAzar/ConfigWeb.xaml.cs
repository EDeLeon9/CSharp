using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;

namespace TablaAzar
{
    /// <summary>
    /// Interaction logic for ConfigWeb.xaml
    /// </summary>
    public partial class ConfigWeb : Page
    {
        private DataCapitulos data;
        private bool inicializado = false;
        public ConfigWeb(DataCapitulos dataCapitulos)
        {
            InitializeComponent();
            data = dataCapitulos;
            string variableConfigWeb1 = data.Variables.Where(x => x.StartsWith(DataCapitulos.V_ConfigWeb1)).First().Split(':')[1];
            string variableConfigWeb2 = data.Variables.Where(x => x.StartsWith(DataCapitulos.V_ConfigWeb2)).First().Split(':')[1];
            string variableConfigWeb3 = data.Variables.Where(x => x.StartsWith(DataCapitulos.V_ConfigWeb3)).First().Split(':')[1];
            rdoDireccionWeb1.IsChecked = variableConfigWeb1 == "1";
            rdoDireccionDosCifrasWeb1.IsChecked = variableConfigWeb1 == "2";
            rdoTemporadaXCapituloWeb1.IsChecked = variableConfigWeb1 == "3";
            rdoDireccionWeb2.IsChecked = variableConfigWeb2 == "1";
            rdoDireccionDosCifrasWeb2.IsChecked = variableConfigWeb2 == "2";
            rdoTemporadaXCapituloWeb2.IsChecked = variableConfigWeb2 == "3";
            rdoDireccionWeb3.IsChecked = variableConfigWeb3 == "1";
            rdoDireccionDosCifrasWeb3.IsChecked = variableConfigWeb3 == "2";
            rdoTemporadaXCapituloWeb3.IsChecked = variableConfigWeb3 == "3";
            inicializado = true;
        }

        private void btnRegresar_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.GoBack();
        }

        private void RadioButtonChecked(object sender, RoutedEventArgs e)
        {
            if (inicializado)
            {
                RadioButton radioButton = (RadioButton)sender;

                string variableAModificar;
                if (radioButton.GroupName == "OpcionConfigWeb1")
                    variableAModificar = DataCapitulos.V_ConfigWeb1;
                else if (radioButton.GroupName == "OpcionConfigWeb2")
                    variableAModificar = DataCapitulos.V_ConfigWeb2;
                else if (radioButton.GroupName == "OpcionConfigWeb3")
                    variableAModificar = DataCapitulos.V_ConfigWeb3;
                else
                    throw new Exception("GroupName de RadioButton no válido");

                string valor;
                if (radioButton.Name.StartsWith("rdoTemporadaXCapitulo"))
                    valor = "3";
                else if (radioButton.Name.StartsWith("rdoDireccionDosCifras"))
                    valor = "2";
                else if (radioButton.Name.StartsWith("rdoDireccion"))
                    valor = "1";
                else
                    throw new Exception("Name de RadioButton no válido");

                data.ModificarVariable(variableAModificar, valor);
            }
        }
    }
}
