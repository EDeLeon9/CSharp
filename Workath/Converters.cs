using System;
using System.Diagnostics;
using System.Globalization;
using System.Windows.Data;

namespace Workath
{
    //Usar DateTimeConverter solo con DataGrids ya que ellos hacen las conversiones solo al salir de la fila (y no al escribir cada caracter como en un TextBox separado)
    //Convierte los DateTime con Ticks en 0 a un string vacío
    public class DateTimeConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            //DebugWriteLine("Convert: DATETIME " + (value != null ? ((DateTime)value).ToString() : "" ));
            if (value != null)
            {
                DateTime dateTime = (DateTime)value;
                if (dateTime.Ticks == 0)
                    return "";
                else
                    return dateTime.ToString(App.DATETIME_FORMAT, CultureInfo.InvariantCulture);
            }
            else return "";
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            //DebugWriteLine("ConvertBack: "+(string)value);
            if (!string.IsNullOrWhiteSpace((string)value) && DateTime.TryParseExact((string)value, App.DATETIME_FORMAT, CultureInfo.InvariantCulture, DateTimeStyles.None, out DateTime dateTime))
                return dateTime;
            else
                return new DateTime();  //Evita error para no asignar null a un DateTime que no es nullable (que no es DateTime?), pero este new DateTime() devolverá los Ticks en 0 y es lo que hay que validar luego si se quiere nulls
        }
    }


    //Creé este converter ya que no puedo darle StringFormat al TimeSpan para que no muestre el día en 0 si no tiene días
    public class TimeSpanConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value != null)
            {
                //El código se pudo hacer que se anexara los días si TimeSpan.Days > 0, pero dejar el código tal cual para recordar que en el 
                //formato de string para TimeSpan se usa \ si se quiere agregar otros caracteres.
                string stringValue = ((TimeSpan)value).ToString(@"d\.hh\:mm");
                if (stringValue.StartsWith("0."))
                    stringValue = stringValue.Split(".")[1];
                return stringValue;
            }
            else return "";
        }

        //No se usa pero lo programé de todas maneras
        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            //int days = 0, hours = 0, minutes = 0;
            //try
            //{
            //    string stringValue = (string)value;
            //    string[] substrings;

            //    if (stringValue.Contains("."))
            //    {
            //        substrings = stringValue.Split(".");
            //        days = int.Parse(substrings[0]);
            //        stringValue = substrings[1];
            //    }

            //    substrings = stringValue.Split(":");
            //    hours = int.Parse(substrings[0]);
            //    minutes = int.Parse(substrings[1]);
            //}
            //catch 
            //{
            //    days = 0; 
            //    hours = 0; 
            //    minutes = 0;
            //}
            //return new TimeSpan(days, hours, minutes, 0);
            throw new NotImplementedException();
        }
    }


    public class HeaderConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value != null)
            {
                string stringValue = (string)value;
                if (parameter != null && (bool)parameter == true)
                {
                    if (stringValue.Contains(";"))
                        return $"[ {stringValue.Split(";")[1]} ]";
                    else
                        return "";
                }
                else
                {
                    if (stringValue.Contains(";"))
                        return stringValue.Split(";")[0];
                    else
                        return stringValue;
                }
            }
            else return "";
        }

        //No se usa pero lo programé de todas maneras
        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            //return (string)value ?? "";  //Si es null devuelve ""
            throw new NotImplementedException();
        }
    }


    public class ZeroIsTrueConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture) => !(value != null && (int)value > 0);
        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture) => throw new NotImplementedException();
    }
}
