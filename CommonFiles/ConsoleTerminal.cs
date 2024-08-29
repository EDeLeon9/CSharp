using System;
using System.Diagnostics;
using System.IO;
using System.IO.Pipes;
using System.Threading.Tasks;

namespace ConsoleTerminalComponent
{
    public static class ConsoleTerminal
    {
        private static Process _Process;
        private static string _PipeName;

        public static void WriteLine(string message)
        {
            if (_Process == null || _Process.HasExited)
            {
                _PipeName = DateTime.Now.ToString("yyyyMMddHHmmss");
                _Process = Process.Start("ConsoleTerminal.exe", _PipeName);
            }

            if (_Process != null && Process.GetProcessById(_Process.Id) != null)
            {
                using (NamedPipeServerStream pipeServer =
                    new NamedPipeServerStream(_PipeName, PipeDirection.Out))
                {
                    pipeServer.WaitForConnection();
                    try
                    {
                        using (StreamWriter sw = new StreamWriter(pipeServer))
                        {
                            sw.AutoFlush = true;
                            sw.WriteLine(message);
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine($"ERROR: {ex.Message}");
                    }
                }
            }
        }
    }
}