using System;
using System.Collections.Generic;
using System.IO;
using System.Reflection.Metadata;
using System.Text;
using System.Xml;
using System.Xml.Serialization;

namespace TablaAzar
{
    public class XmlSerializerClean : XmlSerializer
    {
        public XmlWriterSettings Settings { get; set; }
        public XmlSerializerNamespaces Namespaces { get; set; }

        public XmlSerializerClean(Type type, bool sinEncabezado = true, bool sinNamespaces = true) : base(type)
        {
            Inicializar(sinEncabezado, sinNamespaces);
        }

        public XmlSerializerClean(Type type, XmlRootAttribute root, bool sinEncabezado = true, bool sinNamespaces = true) : base(type, root)
        {
            Inicializar(sinEncabezado, sinNamespaces);
        }

        private void Inicializar(bool sinEncabezado, bool sinNamespaces)
        {
            Settings = new XmlWriterSettings();
            Settings.Indent = true;
            Settings.OmitXmlDeclaration = sinEncabezado;  // Quita el encabezado (version y encoding)

            Namespaces = new XmlSerializerNamespaces();
            if (sinNamespaces)
            {
                Namespaces.Add("", "");  // Quita los namespaces (xmlns:)
            }
        }

        public void SerializeClean(TextWriter writer, object o)
        {
            using (XmlWriter xmlWriter = XmlWriter.Create(writer, Settings))
            {
                this.Serialize(xmlWriter, o, Namespaces);
            }
        }
    }
}
