using System.ComponentModel;
using System.Windows.Navigation;

namespace TablaAzar
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : NavigationWindow
    {
        Principal page;

        public MainWindow()
        {
            InitializeComponent();
            page = new Principal(true);
            this.NavigationService.Navigate(page);
        }

        private void NavigationWindow_Closing(object sender, CancelEventArgs e)
        {
            page.CerrandoVentana();
        }
    }
}
