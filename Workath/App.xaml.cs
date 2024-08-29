using SingleInstanceManager;
using System;
using System.Data;
using System.Windows;

namespace Workath
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        public const string DATETIME_FORMAT = "dd/MM/yyyy h:mm tt";

        public App()
        {
            SingleInstanceApplicationManager.Validate("Workath");
        }
    }
}
