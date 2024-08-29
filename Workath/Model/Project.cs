using System;
using System.Collections.Generic;
using DBConnections;

namespace Workath
{
    public class Project
    {
        private int idProjectAux;

        public int IdProject { get; set; }
        public int IdProjectAux { get => IdProject; set => idProjectAux = value; }
        public string ProjectName { get; set; }
        public bool Enabled { get; set; }

        //Obtiene el listado de Projects
        public static List<Project> GetProjects()
        {
            List<Project> projectList = new List<Project>();
            DBConnection.GlobalConnections[0].Execute<Project>("GetProjects", ref projectList);
            return projectList;
        }
    }
}
