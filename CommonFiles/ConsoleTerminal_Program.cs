using System;
using System.IO;
using System.IO.Pipes;

public class Program
{
    static void Main(string[] args)
    {
        if (args.Length > 0)
        {
            bool cancelKeyPressed = false;
            Console.CancelKeyPress += (s, e) => { cancelKeyPressed = true; };

            while (!cancelKeyPressed)
            {
                using (NamedPipeClientStream pipeClient =
                    new NamedPipeClientStream(".", args[0], PipeDirection.In))
                {
                    try
                    {
                        pipeClient.Connect(1000);
                    }
                    catch (Exception)
                    {
                    }
                    if (pipeClient.IsConnected)
                    {
                        using (StreamReader sr = new StreamReader(pipeClient))
                        {
                            string temp;
                            while ((temp = sr.ReadLine()) != null)
                            {
                                Console.WriteLine(temp);
                            }
                        }
                    }
                }
                Thread.Sleep(100);
            }
        }
        else
        {
            Console.WriteLine("ERROR: Please provide a connection name to ConsoleTerminal by argument.");
            Console.ReadKey();
        }
    }
}
