using System;
using System.Data;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using SingleInstanceManager;

namespace TablaAzar
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        public App()
        {
            SingleInstanceApplicationManager.Validate("TablaAzar");
        }

        private string textoEditandoAnterior = "";

        private void TextBox_GotFocus(object sender, RoutedEventArgs e)
        {
            TextBox box = (TextBox)sender;
            textoEditandoAnterior = box.Text;
        }

        private void TextBox_GotFocus_AutoPaste(object sender, RoutedEventArgs e)
        {
            TextBox box = (TextBox)sender;
            textoEditandoAnterior = box.Text;
            if (String.IsNullOrWhiteSpace(box.Text))
            {
                string clipboard = Clipboard.GetText();
                if (clipboard.Length > 150)
                    clipboard = clipboard.Substring(0, 150);
                box.Text = clipboard;
            }
        }

        private void TextBox_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Escape)
            {
                TextBox box = (TextBox)sender;
                box.Text = textoEditandoAnterior;
            }
        }
    }
}
