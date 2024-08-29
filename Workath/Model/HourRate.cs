using System;
using System.Collections.Generic;
using DBConnections;

namespace Workath
{
    public class HourRate
    {
        public int IdHourRate { get; set; }
        public string Description { get; set; }
        public decimal HourRateAmount { get; set; }

        //Obtiene el listado de HourRates
        public static List<HourRate> GetHourRates()
        {
            List<HourRate> hourRateList = new List<HourRate>();
            DBConnection.GlobalConnections[0].Execute<HourRate>("GetHourRates", ref hourRateList);
            return hourRateList;
        }
    }
}
