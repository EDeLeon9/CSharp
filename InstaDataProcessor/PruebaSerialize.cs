using System;
using System.Collections.Generic;
using System.Text;
using System.Text.Json.Serialization;

namespace InstaDataProcessor
{
    public class RaizSerialize
    {
        public Author author { get; set; }

        public override string ToString()
        {
            return $"RaizSerialize: {author}";
        }
    }

    public class Author
    {
        public int id { get; set; }
        public string name { get; set; }
        public Book book { get; set; }
        public List<Magazine> magazines { get; set; }

        public override string ToString()
        {
            string magazinesString = "";
            foreach(Magazine magazine in magazines)
            {
                magazinesString += magazine.ToString()+" ";
            }
            return $"Author: {id} {name} -{book}- {magazinesString}";
        }
    }

    public class Book
    {
        public int id { get; set; }
        public string title { get; set; }
        public int pages { get; set; }

        public override string ToString()
        {
            return $"Book: {id} {title} {pages}";
        }
    }

    public class Magazine
    {
        public int id { get; set; }
        public DateTime datetime { get; set; }

        public override string ToString()
        {
            return $"Magazine: {id} {datetime}";
        }
    }
}
