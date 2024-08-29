using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Documents;
using System.Xml;
using System.Xml.Serialization;
using ToastMessageNotification;

namespace TablaAzar
{
    public class DataCapitulos
    {
        public const string V_BrowserVar = "browser";
        public const string V_BrowserVar_Default = "default";
        public const string V_BrowserVar_MicrosoftEdge = "microsoft-edge";
        public const string V_From = "from";
        public const string V_Express = "express";
        public const string V_ConfigWeb1 = "configweb1";
        public const string V_ConfigWeb2 = "configweb2";
        public const string V_ConfigWeb3 = "configweb3";
        public const string V_MainWeb1 = "mainweb1";
        public const string V_SubWeb1 = "subweb1";
        public const string V_MainWeb2 = "mainweb2";
        public const string V_SubWeb2 = "subweb2";
        public const string V_MainWeb3 = "mainweb3";
        public const string V_SubWeb3 = "subweb3";

        public const string NombreVariables = "Variables";
        public const string NombreTemporadasConMaxCap = "TemporadasConMaxCap";
        public const string NombreCapitulosOmitidos = "CapitulosOmitidos";
        public const string NombreCapitulosAgregados = "CapitulosAgregados";
        public const string NombreTitulosDirecciones = "TitulosDirecciones";
        public const string NombreTemporadasConMaxCap_Express = "TemporadasConMaxCap_Express";
        public const string NombreExpressVistos = "ExpressVistos";

        public Func<string, string> FormatearTitulo;  //Se usa para otorgar un evento que se ejecute cada vez que se modifique el título (ver DataMostrar_CollectionChanged)
        public Func<string, string> FormatearDireccion;  //Se usa para otorgar un evento que se ejecute cada vez que se modifique la dirección (ver DataMostrar_CollectionChanged)

        public string RutaXml { get; set; }
        public string Web1Temporadas { get; set; }
        public string Web1Capitulo { get; set; }
        public string Web2Temporadas { get; set; }
        public string Web2Capitulo { get; set; }
        public string Web3Temporadas { get; set; }
        public string Web3Capitulo { get; set; }
        public string Desde { get; set; }
        public int IndiceCapitulosExpress { get; set; }
        public List<string> Variables { get; set; }
        public ObservableCollection<RegistroCap> DataMostrar { get; set; }
        public ObservableCollection<RegistroCap> TemporadasConMaxCap { get; set; }
        public ObservableCollection<RegistroCap> TemporadasConMaxCap_Express { get; set; }
        public ObservableCollection<RegistroCap> CapitulosOmitidos { get; set; }
        public ObservableCollection<RegistroCap> CapitulosAgregados { get; set; }
        public ObservableCollection<RegistroCap> TitulosDirecciones { get; set; }
        public ObservableCollection<RegistroCap> ExpressVistos { get; set; }

        private bool constructorOk = false;

        public DataCapitulos()
        {
            constructorOk = false;
            DataMostrar = new ObservableCollection<RegistroCap>();
            DataMostrar.CollectionChanged += DataMostrar_CollectionChanged;

            try
            {
                using (StreamReader reader = new StreamReader(Directory.GetCurrentDirectory() + @"\RutaArchivos.txt"))
                {
                    RutaXml = reader.ReadLine() + @"\{0}.xml";
                }

                XmlSerializer serializer = new XmlSerializer(typeof(List<string>));
                using (StreamReader reader = new StreamReader(string.Format(RutaXml, NombreVariables)))
                {
                    Variables = (List<string>)serializer.Deserialize(reader);
                }
                Desde = Variables.Where(x => x.StartsWith(DataCapitulos.V_From)).First().Split(':')[1];
                IndiceCapitulosExpress = int.Parse(Variables.Where(x => x.StartsWith(DataCapitulos.V_Express)).First().Split(':')[1]);
                Web1Temporadas = Variables.Where(x => x.StartsWith(DataCapitulos.V_MainWeb1)).First().Split(':')[1];
                Web1Capitulo = Variables.Where(x => x.StartsWith(DataCapitulos.V_SubWeb1)).First().Split(':')[1];
                Web2Temporadas = Variables.Where(x => x.StartsWith(DataCapitulos.V_MainWeb2)).First().Split(':')[1];
                Web2Capitulo = Variables.Where(x => x.StartsWith(DataCapitulos.V_SubWeb2)).First().Split(':')[1];
                Web3Temporadas = Variables.Where(x => x.StartsWith(DataCapitulos.V_MainWeb3)).First().Split(':')[1];
                Web3Capitulo = Variables.Where(x => x.StartsWith(DataCapitulos.V_SubWeb3)).First().Split(':')[1];

				TemporadasConMaxCap = Deserializar<RegistroCap>(NombreTemporadasConMaxCap);
				TemporadasConMaxCap_Express = Deserializar<RegistroCap>(NombreTemporadasConMaxCap_Express);
                CapitulosOmitidos = Deserializar<RegistroCap>(NombreCapitulosOmitidos);
                CapitulosAgregados = Deserializar<RegistroCap>(NombreCapitulosAgregados);
                TitulosDirecciones = Deserializar<RegistroCap>(NombreTitulosDirecciones);
                ExpressVistos = Deserializar<RegistroCap>(NombreExpressVistos);

                constructorOk = true;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error leyendo RutaCapitulos.txt\n\n" + ex.Message, "Error al leer archivo", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void DataMostrar_CollectionChanged(object sender, NotifyCollectionChangedEventArgs e)
        {
            if (e.Action == NotifyCollectionChangedAction.Add)
            {
                foreach(RegistroCap registroCap in e.NewItems)
                {
                    registroCap.FormatearTitulo = this.FormatearTitulo;
                    registroCap.FormatearDireccion = this.FormatearDireccion;
                }
            }
        }

        public int CalcularCapituloReal(int temporada, int capitulo)
        {
            int conteo = 0;
            if (constructorOk)
            {
                for (int i = 1; i < temporada; i++)
                {
                    conteo += TemporadasConMaxCap.ElementAt(i - 1).Capitulo;
                }
                conteo += capitulo;
            }
            return conteo;
        }


        public void GenerarCapitulos(bool iniciando)
        {
            if (constructorOk)
            {
                List<int> omitidosAux;
                List<int> agregadosAux;
                string[] titDir;
                string titulo, direccion;

				int.TryParse(Desde, out int desde);
				if (iniciando || desde == 0)
                {
					foreach (RegistroCap tMaxCap in TemporadasConMaxCap)
					{
						if ((from x in CapitulosOmitidos where x.Temporada == tMaxCap.Temporada && x.Capitulo == 0 select 1).Count() == 0)  // Usando Linq (pero solo hago select número 1 en vez de select new RegistroCap(){}
						//if (CapitulosOmitidos.Where(x => x.Temporada == tMaxCap.Temporada && x.Capitulo == 0).FirstOrDefault() == null)  // Usando Lambda expression para representar el delegado genérico Predicate<T> para Where
						{
							omitidosAux = (from x in CapitulosOmitidos where x.Temporada == tMaxCap.Temporada && x.Capitulo > 0 select x.Capitulo).ToList();
							for (int i = 0; i < tMaxCap.Capitulo; i++)
							{
								if (!omitidosAux.Contains(i + 1))
								{
									titDir = (from x in TitulosDirecciones where x.Temporada == tMaxCap.Temporada && x.Capitulo == (i + 1) select new string[] { x.Titulo, x.Direccion }).FirstOrDefault();
									titulo = titDir == null ? "" : titDir[0];
									direccion = titDir == null ? "" : titDir[1];
									DataMostrar.Add(new RegistroCap() { Temporada = tMaxCap.Temporada, Capitulo = i + 1, CapituloReal = CalcularCapituloReal(tMaxCap.Temporada, i + 1), Titulo = titulo, Direccion = direccion });
								}
							}
						}

						agregadosAux = (from x in CapitulosAgregados where x.Temporada == tMaxCap.Temporada select x.Capitulo).ToList();
						foreach (int cap in agregadosAux)
						{
							titDir = (from x in TitulosDirecciones where x.Temporada == tMaxCap.Temporada && x.Capitulo == cap select new string[] { x.Titulo, x.Direccion }).FirstOrDefault();
							titulo = titDir == null ? "" : titDir[0];
							direccion = titDir == null ? "" : titDir[1];
							DataMostrar.Add(new RegistroCap() { Temporada = tMaxCap.Temporada, Capitulo = cap, CapituloReal = CalcularCapituloReal(tMaxCap.Temporada, cap), Titulo = titulo, Direccion = direccion });
						}
					}
				}
                else
                {
                    List<RegistroCap> temporadasDesdeConMaxCap = (from x in TemporadasConMaxCap where x.Temporada >= desde select x).ToList();
					foreach (RegistroCap tMaxCap in temporadasDesdeConMaxCap)
					{
						for (int i = 0; i < tMaxCap.Capitulo; i++)
						{
							titDir = (from x in TitulosDirecciones where x.Temporada == tMaxCap.Temporada && x.Capitulo == (i + 1) select new string[] { x.Titulo, x.Direccion }).FirstOrDefault();
							titulo = titDir == null ? "" : titDir[0];
							direccion = titDir == null ? "" : titDir[1];
							DataMostrar.Add(new RegistroCap() { Temporada = tMaxCap.Temporada, Capitulo = i + 1, CapituloReal = CalcularCapituloReal(tMaxCap.Temporada, i + 1), Titulo = titulo, Direccion = direccion });

						}
					}
				}
            }
        }


        public bool AgregarRegistroCapitulo(RegistroCap registroCap, string destinoArchivo)
        {
            bool respuesta = false;

            if (registroCap != null && !string.IsNullOrWhiteSpace(RutaXml) && registroCap.Temporada > 0 && registroCap.Capitulo > 0)
            {
                string nuevaLinea = "";
                string archivo = string.Format(RutaXml, destinoArchivo);
                XmlSerializerClean serializer = new XmlSerializerClean(typeof(RegistroCap));

                using (StringWriter stringWriter = new StringWriter())
                {
                    RegistroCap nuevoCap = new RegistroCap() { Temporada = registroCap.Temporada, Capitulo = registroCap.Capitulo };
					if (destinoArchivo == NombreExpressVistos)
					{
                        nuevoCap.CapituloExpress_Indice = registroCap.CapituloExpress_Indice;
					}
					serializer.SerializeClean(stringWriter, nuevoCap);
                    nuevaLinea = "  " + stringWriter.ToString();
                }

                if (destinoArchivo == NombreCapitulosOmitidos)
                {
                    try
                    {
                        List<string> lineas = new List<string>(File.ReadLines(string.Format(RutaXml, NombreCapitulosAgregados)));
                        if (!string.IsNullOrWhiteSpace(nuevaLinea) && lineas.Contains(nuevaLinea))
                        {
                            MessageBox.Show($"No se pudo omitir ya que este registro se encuentra en {NombreCapitulosAgregados}.xml", "Verificando registro", MessageBoxButton.OK, MessageBoxImage.Error);
                            return false;
                        }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Error al verificar registro en archivo\n\n" + ex.Message, "Error al verificar registro", MessageBoxButton.OK, MessageBoxImage.Error);
                        return false;
                    }
                }

                try
                {
                    List<string> lineas = new List<string>(File.ReadLines(archivo));
                    if (!string.IsNullOrWhiteSpace(nuevaLinea) && lineas.Count >= 2)
                    {
                        lineas.Insert(lineas.Count - 1, nuevaLinea);
                        File.WriteAllLines(archivo, lineas);
                        respuesta = true;
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error al agregar xml al archivo\n\n" + ex.Message, "Error al agregar xml", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }

            return respuesta;
        }


        public bool ModificarTituloDireccion(RegistroCap registroCap)
        {
            bool respuesta = false;

            if (registroCap != null && !string.IsNullOrWhiteSpace(RutaXml) && registroCap.Temporada > 0 && registroCap.Capitulo > 0)
            {
                string nuevaLinea = "";
                string archivo = string.Format(RutaXml, NombreTitulosDirecciones);
                XmlSerializerClean serializer = new XmlSerializerClean(typeof(RegistroCap));

                using (StringWriter stringWriter = new StringWriter())
                {
                    serializer.SerializeClean(stringWriter, registroCap);
                    nuevaLinea = "  " + stringWriter.ToString();
                }

                try
                {
                    List<string> lineas = new List<string>(File.ReadLines(archivo));
                    if (!string.IsNullOrWhiteSpace(nuevaLinea) && lineas.Count >= 2)
                    {
                        int index = lineas.FindIndex(x => x.StartsWith("  <" + typeof(RegistroCap).Name + " " + typeof(RegistroCap).GetProperties()[0].Name + "=\"" + registroCap.Temporada + "\" " + typeof(RegistroCap).GetProperties()[1].Name + "=\"" + registroCap.Capitulo + "\""));

                        if (index > 0)
                        {
                            lineas[index] = nuevaLinea;
                            File.WriteAllLines(archivo, lineas);
                            respuesta = true;
                        }
                        else if(!string.IsNullOrWhiteSpace(registroCap.Titulo) || !String.IsNullOrWhiteSpace(registroCap.Direccion))
                        {
                            lineas.Insert(lineas.Count - 1, nuevaLinea);
                            File.WriteAllLines(archivo, lineas);
                            respuesta = true;
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error al modificar título y dirección\n\n" + ex.Message, "Error al modificar título y dirección", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }

            return respuesta;
        }

        public void ModificarVariable(string variableAModificar, string valor)
        {
            List<string> nuevasVariables = new List<string>();
            foreach (string variable in Variables)
            {
                if (variable.StartsWith(variableAModificar))
                    nuevasVariables.Add($"{variableAModificar}:{valor}");
                else
                    nuevasVariables.Add(variable);
            }
            Variables = nuevasVariables;
            XmlSerializerClean serializer = new XmlSerializerClean(typeof(List<string>));
            using (StreamWriter writer = new StreamWriter(string.Format(RutaXml, NombreVariables)))
            {
                serializer.SerializeClean(writer, Variables);
            }
        }

        public void BarajarLista()
        {
            if (constructorOk)
            {
                Random random = new Random();
                DataMostrar = new ObservableCollection<RegistroCap>(DataMostrar.OrderBy(x => random.Next(1000)).ToList());
            }
        }


        public void AbrirWeb(RegistroCap registroCap, AccionAbrirWeb accion)
        {
            if (registroCap != null)
            {
                Process proc = new Process();
                proc.StartInfo.UseShellExecute = true;
                switch (accion)
                {
                    case AccionAbrirWeb.TemporadasWeb1:
                        proc.StartInfo.FileName = Web1Temporadas + registroCap.Temporada;
                        break;
                    case AccionAbrirWeb.CapituloWeb1:
                        proc.StartInfo.FileName = ArmarProcessFileName(Web1Capitulo, Variables.Where(x => x.StartsWith(DataCapitulos.V_ConfigWeb1)).First().Split(':')[1]);
                        break;
                    case AccionAbrirWeb.TemporadasWeb2:
                        proc.StartInfo.FileName = Web2Temporadas + registroCap.Temporada;
                        break;
                    case AccionAbrirWeb.CapituloWeb2:
                        proc.StartInfo.FileName = ArmarProcessFileName(Web2Capitulo, Variables.Where(x => x.StartsWith(DataCapitulos.V_ConfigWeb2)).First().Split(':')[1]);
                        break;
                    case AccionAbrirWeb.TemporadasWeb3:
                        proc.StartInfo.FileName = Web3Temporadas + registroCap.Temporada;
                        break;
                    case AccionAbrirWeb.CapituloWeb3:
                        proc.StartInfo.FileName = ArmarProcessFileName(Web3Capitulo, Variables.Where(x => x.StartsWith(DataCapitulos.V_ConfigWeb3)).First().Split(':')[1]);
                        break;
                    default:
                        return;
                }
                if (Variables[0].EndsWith(V_BrowserVar_MicrosoftEdge))
                {
                    proc.StartInfo.FileName = $"{V_BrowserVar_MicrosoftEdge}:{proc.StartInfo.FileName}";
                }
                proc.StartInfo.FileName = "https://" + proc.StartInfo.FileName;
                proc.Start();
            }
            string ArmarProcessFileName(string webCapitulo, string variableConfigWeb)
            {
                switch (variableConfigWeb)
                {
                    case "1":
                        return webCapitulo + registroCap.Direccion;
                    case "2":
                        return webCapitulo + (registroCap.Temporada < 10 ? "0" : "") + registroCap.Direccion;
                    case "3":
                        return webCapitulo + registroCap.Temporada + "x" + registroCap.Capitulo;
                    default:
                        throw new Exception("Variable ConfigWeb no válida.");
                }

            }
        }


        public void Serializar(string nombre, ObservableCollection<RegistroCap> registroCap)
        {
            if (!string.IsNullOrWhiteSpace(nombre) && !string.IsNullOrWhiteSpace(RutaXml))
            {
                XmlSerializerClean serializer = new XmlSerializerClean(typeof(ObservableCollection<RegistroCap>), new XmlRootAttribute(nombre));  //Se usa XmlRootAttribute(texto) para usar ese texto en lugar del "ArrayOf" en el archivo xml
				using (StreamWriter writer = new StreamWriter(string.Format(RutaXml, nombre)))
                {
                    serializer.SerializeClean(writer, registroCap);
                }
            }
        }


        public ObservableCollection<T> Deserializar<T>(string nombre)
        {
            ObservableCollection<T> registros = new ObservableCollection<T>();
            if (!string.IsNullOrWhiteSpace(nombre) && !string.IsNullOrWhiteSpace(RutaXml))
            {
                XmlSerializer serializer = new XmlSerializer(typeof(ObservableCollection<T>), new XmlRootAttribute(nombre));  //Se usa XmlRootAttribute(texto) para usar ese texto en lugar del "ArrayOf" en el archivo xml
                using (StreamReader reader = new StreamReader(string.Format(RutaXml, nombre)))
                {
                    registros = (ObservableCollection<T>)serializer.Deserialize(reader);
                }
            }
            return registros;
        }


		public void BackupArchivos()
        {
            if (constructorOk)
            {
                string directorio = RutaXml[..RutaXml.LastIndexOf(@"\")];
                string nuevoDirectorio = directorio + directorio[directorio.LastIndexOf(@"\")..] + "_bak_" + DateTime.Now.ToString("yyyyMMddHHmmss");

                Directory.CreateDirectory(nuevoDirectorio);

                List<string> listaArchivos = new List<string>(Directory.GetFiles(directorio));
                foreach (string x in listaArchivos)
                {
                    File.Copy(x, nuevoDirectorio + @"\" + x[(x.LastIndexOf(@"\") + 1)..]);
                }

                List<string> listaDirs = new List<string>(Directory.GetDirectories(directorio));
                listaDirs.Sort();
                while (listaDirs.Count > 10)
                {
                    Directory.Delete(listaDirs[0], true);
                    listaDirs.RemoveAt(0);
                }
            }
        }
    }



    [XmlRoot("RegistroCap")]
    public class RegistroCap
    {
        //Nota: No se implementó INotifyPropertyChanged porque esta clase se usa en un ObservableCollection que hereda INotifyPropertyChanged

        private string titulo;
        private string direccion;

        [XmlIgnore]
        public Func<string, string> FormatearDireccion;
        [XmlIgnore]
        public Func<string, string> FormatearTitulo;

        [XmlAttribute("Temporada")]
        public int Temporada { get; set; }
        [XmlAttribute("Capitulo")]
        public int Capitulo { get; set; }
        [XmlAttribute("Titulo")]
        public string Titulo { get => titulo; set => titulo = FormatearTitulo?.Invoke(value) ?? value; }  //FormatearTitulo retorna string (Func ... string>), pero si no se le ha delegado ninguna función será null y no se ejecutará FormatearTitulo trayendo null, en ese caso se devuelve value en lugar de null (... ?? value)
        [XmlAttribute("Direccion")]
        public string Direccion
        { 
            get => direccion;
            set
            {
                direccion = FormatearDireccion?.Invoke(value) ?? value;  //Ver explicación en siguiente comentario
                if (Temporada > 0 && Capitulo > 0 && !string.IsNullOrWhiteSpace(direccion) && CapituloReal > 0)
                {
                    bool correcto = Regex.IsMatch(direccion, "[x].*[-]");  //Debe haber x ([x]), luego cualquier caracter cualquier número de veces (.*), y luego guión ([-])
                    if (correcto)
                    {
                        string[] numeros = direccion.Split("-")[0].Split("x");
                        correcto = numeros[0] == Temporada.ToString() && numeros[1] == Capitulo.ToString("00");
                    }
                    if (!correcto)
                    {
                        ToastMessage.Show($"La dirección del capítulo {Capitulo} de la temporada {Temporada} es incorrecta.");
                    }
                }
            }
        }

		[XmlAttribute("CapituloExpress_Indice")]
		public int CapituloExpress_Indice { get; set; }

		[XmlIgnore]
        public int CapituloReal { get; set; }
    }



    public enum AccionAbrirWeb
    {
        TemporadasWeb1,
        CapituloWeb1,
        TemporadasWeb2,
        CapituloWeb2,
        TemporadasWeb3,
        CapituloWeb3
    }
}
