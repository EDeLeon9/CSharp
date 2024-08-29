using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Globalization;
using System.Media;
using System.Text;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace Workath
{
    public class DateTimeTextBoxCell : TextBox
    {
        private string lastGoodText;
        private string startingText;

        static DateTimeTextBoxCell()  //Se ejecuta solo una vez durante el programa
        {
            //DependencyPropertyDescriptor descriptor = DependencyPropertyDescriptor.FromProperty(TextBox.TextProperty, typeof(DateTimeTextBoxCell));
            //descriptor.AddValueChanged(this, OnTextChanged);
            //descriptor.DesignerCoerceValueCallback = CoerceText;  //OJO: NO USAR DesignerCoerceValueCallback PORQUE APLICA A TODOS LOS CONTROLES INCLUYENDO LAS BASES (ej. a los TextBox normales)
            TextBox.TextProperty.OverrideMetadata(typeof(DateTimeTextBoxCell), new FrameworkPropertyMetadata() { PropertyChangedCallback = OnTextChanged });
        }

        public DateTimeTextBoxCell() : base()
        {
            this.LostFocus += OnLostFocus;
            this.GotFocus += OnGotFocus;
            this.KeyDown += OnKeyDown;
            this.Loaded += OnLoaded;  //Cuando se entra en modo edición se construye el DateTimeTextBoxCell, pero falta que haga focus por eso se fuerza con Focus()
        }

        private void OnLoaded(object sender, RoutedEventArgs e)
        {
            this.Focus();
            this.SelectionStart = 0;
            this.SelectionLength = this.Text.Length;
        }

        //No se usa CoerceValueCallback ya que no funciona bien si hay otro control haciendo el mismo binding a un mismo objeto. Se usa en lugar PropertyChangedCallback
        //private static object CoerceText(DependencyObject d, object baseValue)
        //{
        //    DateTimeTextBoxCell box = (DateTimeTextBoxCell)d;
        //    string current = (string)baseValue;
        //    string previous = box.Text;

        //    //El pattern [^AaPpMm\d/: ] indica que IsMatch() es true si encuentra algún ([]) caracter que no (^) sea A, a, P, p, M, m, número (\d), /, : ni espacio ( )
        //    //El pipe (|) es un OR entre las dos expresiones
        //    //El pattern [/:]{2,} indica que IsMatch() es true si encuentra una combinación entre los caracteres / y : unidos 2 o más veces ({2,})
        //    //docs.microsoft.com/en-us/dotnet/standard/base-types/regular-expression-language-quick-reference
        //    if (!string.IsNullOrWhiteSpace(current) && Regex.IsMatch(current, @"[^AaPpMm\d/: ]|[/:]{2,}"))
        //    {
        //        SystemSounds.Beep.Play();
        //        return previous;  //Texto antes de lo nuevo que se va a ingresar
        //    }
        //    return current?.Trim();
        //}

        private static void OnTextChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            DateTimeTextBoxCell box = (DateTimeTextBoxCell)d;
            //DebugWriteLine("TextChanged: " + box?.Text);
            string current = ((string)e.NewValue).Trim();
            string previous = (string)e.OldValue;

            //El pattern [^AaPpMm\d/: ] indica que IsMatch() es true si encuentra algún ([]) caracter que no (^) sea A, a, P, p, M, m, número (\d), /, : ni espacio ( )
            //El pipe (|) es un OR entre las dos expresiones
            //El pattern [/:]{2,} indica que IsMatch() es true si encuentra una combinación entre los caracteres / y : unidos 2 o más veces ({2,})
            //docs.microsoft.com/en-us/dotnet/standard/base-types/regular-expression-language-quick-reference
            if (!string.IsNullOrWhiteSpace(current) && Regex.IsMatch(current, @"[^AaPpMm\d/: ]|[/:]{2,}"))
            {
                SystemSounds.Beep.Play();
                box.Text = previous;  //Hace que entre de nuevo a OnTextChanged();
            }
            //Primero se inserta un espacio antes de AM/PM para asegurar que esté el espacio,
            //luego con Regex.Replace() se indica que reemplace todo lo que tenga el pattern [ ]{2,} (que es el caracter espacio 2 o más veces) por un solo espacio
            else if (box != null && current.Length > 10 && DateTime.TryParseExact(Regex.Replace(current.Insert(current.Length - 2, " "), "[ ]{2,}", " "), App.DATETIME_FORMAT, CultureInfo.InvariantCulture, DateTimeStyles.None, out DateTime parsedDateTime))
                box.lastGoodText = parsedDateTime.ToString(App.DATETIME_FORMAT, CultureInfo.InvariantCulture);
        }

        private void OnGotFocus(object sender, RoutedEventArgs e)
        {
            //DebugWriteLine("OnGotFocus: "+ this.Text);
            startingText = this.Text;
            lastGoodText = this.Text;
        }

        private void OnLostFocus(object sender, RoutedEventArgs e)
        {
            //DebugWriteLine("OnLostFocus: "+ this.Text);
            if (!string.IsNullOrWhiteSpace(this.Text))
            {
                //Primero se inserta un espacio antes de AM/PM para asegurar que esté el espacio,
                //luego con Regex.Replace() se indica que reemplace todo lo que tenga el pattern [ ]{2,} (que es el caracter espacio 2 o más veces) por un solo espacio
                string trimmedText = this.Text.Trim();
                if (trimmedText.Length > 10 && DateTime.TryParseExact(Regex.Replace(trimmedText.Insert(trimmedText.Length - 2, " "), "[ ]{2,}", " "), App.DATETIME_FORMAT, CultureInfo.InvariantCulture, DateTimeStyles.None, out DateTime parsedDateTime))
                    this.Text = parsedDateTime.ToString(App.DATETIME_FORMAT, CultureInfo.InvariantCulture);
                else
                {
                    SystemSounds.Beep.Play();
                    this.Text = lastGoodText;
                }
            }
            else this.Text = "";
        }

        private void OnKeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Escape)
            {
                DateTimeTextBoxCell box = (DateTimeTextBoxCell)sender;
                box.Text = startingText;
            }
        }
    }
}
