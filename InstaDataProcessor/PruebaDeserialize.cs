using System;
using System.Collections.Generic;
using System.Text;
using System.Text.Json.Serialization;

namespace InstaDataProcessor
{
    public class RaizDeserialize
    {
        public Author1 author1 { get; set; }
        public Author2 author2 { get; set; }
        public Author3 author3 { get; set; }

        public override string ToString()
        {
            return author1.ToString() + "\n\n" + author2.ToString() + "\n\n" + author3.ToString();
        }
    }

    public class Author1 : Author
    {
        //public int id { get; set; }
        //public string name { get; set; }
        //public Book book { get; set; }
        //public Magazine[] magazines { get; set; }
    }

    public class Author2 : Author
    {
        //public int id { get; set; }
        //public string name { get; set; }
        //public Book book { get; set; }
        //public Magazine[] magazines { get; set; }
    }

    public class Author3 : Author
    {
        //public int id { get; set; }
        //public string name { get; set; }
        //public Book book { get; set; }
        //public Magazine[] magazines { get; set; }
    }
}
