using System;
using System.ComponentModel;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Shapes;
using System.Windows.Threading;

namespace Workath.Controls
{
    public partial class WindowButtons : UserControl
    {
        private Window currentWindow;

        public WindowButtons()
        {
            InitializeComponent();
            if (!DesignerProperties.GetIsInDesignMode(this))
                this.Dispatcher.BeginInvoke(this.GetWindows, DispatcherPriority.Background);  //Background asegura que esté todo cargado ya que es un nivel bajo de priority suficiente para que se ejecute bien y no tenga tanto delay
        }

        private void GetWindows()
        {
            currentWindow = Window.GetWindow(this);
            currentWindow.StateChanged += WindowButtons_StateChanged;
        }

        private void WindowButtons_StateChanged(object sender, EventArgs e)
        {
            Window window = (Window)sender;
            Path path = (Path)btnMaximize.Content;
            if (window.WindowState == WindowState.Maximized)
                path.Data = (PathGeometry)btnMaximize.FindResource("RestorePathGeometry");
            else if (window.WindowState == WindowState.Normal)
                path.Data = (PathGeometry)btnMaximize.FindResource("MaximizePathGeometry");
        }

        private void btnMinimize_Click(object sender, RoutedEventArgs e)
        {
            SystemCommands.MinimizeWindow(Window.GetWindow(this));
        }

        private void btnMaximize_Click(object sender, RoutedEventArgs e)
        {
            Window window = Window.GetWindow(this);
            if (window.WindowState != WindowState.Maximized)
                SystemCommands.MaximizeWindow(window);
            else
                SystemCommands.RestoreWindow(window);
        }

        private void btnClose_Click(object sender, RoutedEventArgs e)
        {
            SystemCommands.CloseWindow(Window.GetWindow(this));
        }
    }
}
