using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Text;
using System.Windows.Input;

namespace Workath
{
    public class RelayCommand : ICommand
    {
        public event EventHandler CanExecuteChanged;
        private Action<object> RelayExecute;

        public RelayCommand(Action<object> executeMethod) => RelayExecute = executeMethod;

        //Se crea un método que ejecuta el Func del constructor, retorna bool pero no se asigna a nada
        public RelayCommand(Func<object, bool> executeMethod) => RelayExecute = (o) => executeMethod(o);

        //Se crea un método que ejecuta el Func del constructor con el segundo parámetro en null, retorna bool pero no se asigna a nada
        public RelayCommand(Func<object, object, bool> executeMethod) => RelayExecute = (o) => executeMethod(o, null);

        public bool CanExecute(object parameter) => true;  //Siempre true ya que no manejo inhabilitación de botones

        public void Execute(object parameter) => RelayExecute(parameter);
    }
}
