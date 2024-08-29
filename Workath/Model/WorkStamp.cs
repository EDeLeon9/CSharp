using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using DBConnections;

namespace Workath
{
    public class WorkStamp : INotifyPropertyChanged  //Se implementó primeramente INotifyPropertyChanged para que actualice los totales de los grupos
    {
        private int idWorkStamp;
        private int idProject;
        private string dateText;
        private DateTime startTime;
        private DateTime? endTime;
        private TimeSpan? workingTime;
        private string description;
        private decimal? base1Income;
        private decimal? base2Income;
        private decimal? base3Income;
        private decimal? base4Income;

        public event PropertyChangedEventHandler PropertyChanged;

        public int IdWorkStamp { get => idWorkStamp; set { idWorkStamp = value; NotifyPropertyChanged(); } }
        public int IdProject { get => idProject; set { idProject = value; NotifyPropertyChanged(); } }
        public string DateText { get => dateText; set { dateText = value; NotifyPropertyChanged(); } }
        public DateTime StartTime { get => startTime; set { startTime = value; NotifyPropertyChanged(); } }
        public DateTime? EndTime { get => endTime; set { endTime = (value.GetValueOrDefault().Ticks == 0)? null : value; NotifyPropertyChanged(); } }
        public TimeSpan? WorkingTime { get => workingTime; set { workingTime = (value.GetValueOrDefault().Ticks == 0) ? null : value; NotifyPropertyChanged(); } }
        public string Description { get => string.IsNullOrWhiteSpace(description) ? null : description.Trim(); set { description = value?.Trim(); NotifyPropertyChanged(); } }
        public decimal? Base1Income { get => base1Income; set { base1Income = value; NotifyPropertyChanged(); } }
        public decimal? Base2Income { get => base2Income; set { base2Income = value; NotifyPropertyChanged(); } }
        public decimal? Base3Income { get => base3Income; set { base3Income = value; NotifyPropertyChanged(); } }
        public decimal? Base4Income { get => base4Income; set { base4Income = value; NotifyPropertyChanged(); } }

        //Para pintar de rojo las filas que tienen mal los datos
        public bool InvalidDates { get => IdWorkStamp > 0 && (StartTime.Ticks == 0 || ((EndTime?.Ticks ?? 0) > 0 && (EndTime.GetValueOrDefault() - StartTime).Ticks <= 0)); }

        public WorkStamp()
        {
        }

        public WorkStamp(WorkStamp workStamp)
        {
            if (workStamp != null)
            {
                this.IdWorkStamp = workStamp.IdWorkStamp;
                this.IdProject = workStamp.IdProject;
                this.DateText = workStamp.DateText;
                this.StartTime = workStamp.StartTime;
                this.EndTime = workStamp.EndTime;
                this.WorkingTime = workStamp.WorkingTime;
                this.Description = workStamp.Description;
                this.Base1Income = workStamp.Base1Income;
                this.Base2Income = workStamp.Base2Income;
                this.Base3Income = workStamp.Base3Income;
                this.Base4Income = workStamp.Base4Income;
            }
        }

        private void NotifyPropertyChanged([CallerMemberName] string propertyName = "") => PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));

        //Llena los ingresos del WorkStamp dependiendo de la tarifa por hora obtenida del List<HourRate> ingresado
        public void SetIncomes(List<HourRate> hourRateList)
        {
            Base1Income = WorkingTime != null ? Math.Round(Convert.ToDecimal(WorkingTime.GetValueOrDefault().TotalHours) * hourRateList[0].HourRateAmount, 2) : (decimal?)null;
            Base2Income = WorkingTime != null ? Math.Round(Convert.ToDecimal(WorkingTime.GetValueOrDefault().TotalHours) * hourRateList[1].HourRateAmount, 2) : (decimal?)null;
            Base3Income = WorkingTime != null ? Math.Round(Convert.ToDecimal(WorkingTime.GetValueOrDefault().TotalHours) * hourRateList[2].HourRateAmount, 2) : (decimal?)null;
            Base4Income = WorkingTime != null ? Math.Round(Convert.ToDecimal(WorkingTime.GetValueOrDefault().TotalHours) * hourRateList[3].HourRateAmount, 2) : (decimal?)null;
        }

        //Obtiene el listado de WorkStamps, obtiene los totales de cada grupo de DateText y le calcula los Incomes con SetIncomes()
        public static List<WorkStamp> GetWorkStamps(List<HourRate> hourRateList, int? idProject, int? year, int? month)
        {
            List<WorkStamp> workStampList = new List<WorkStamp>();
            if (DBConnection.GlobalConnections[0].Execute<WorkStamp>("GetWorkStamps", ref workStampList, idProject, year, month))
            {
                TimeSpan totalWorkingTime = new TimeSpan();
                for (int i = 0; i < workStampList.Count; i++)
                {
                    workStampList[i].SetIncomes(hourRateList);

                    //Ingresa las filas de los totales
                    if (workStampList[i].IdWorkStamp > 0)
                    {
                        totalWorkingTime = totalWorkingTime.Add(workStampList[i].WorkingTime.GetValueOrDefault());
                        if (i == workStampList.Count - 1 || workStampList[i].DateText != workStampList[i + 1].DateText)
                            workStampList.Insert(i + 1, new WorkStamp() { IdWorkStamp = 0, DateText = workStampList[i].DateText, WorkingTime = totalWorkingTime });
                    }
                    else
                        totalWorkingTime = new TimeSpan();
                }
            }
            return workStampList;
        }

        public static int GetFirstYear()
        {
            int year = 0;
            DBConnection.GlobalConnections[0].Execute<int>("GetFirstYear", ref year);
            return year;
        }

        public static int InsertWorkStamp(int idProject, DateTime startTime, DateTime? endTime)
        {
            int insertedIdWorkStamp = 0;
            DBConnection.GlobalConnections[0].Execute<int>("InsertWorkStamp", ref insertedIdWorkStamp, idProject, startTime.AddSeconds(-startTime.Second), endTime?.AddSeconds(-endTime.GetValueOrDefault().Second));
            return insertedIdWorkStamp;
        }

        public static bool UpdateOpenWorkStamp(ref int updatedIdWorkStamp, DateTime? endTime)
        {
            return DBConnection.GlobalConnections[0].Execute<int>("UpdateOpenWorkStamp", ref updatedIdWorkStamp, endTime?.AddSeconds(-endTime.GetValueOrDefault().Second));
        }

        public static bool SelectOpenWorkStamp(ref int idOpenWorkStamp)
        {
            return DBConnection.GlobalConnections[0].Execute<int>("SelectOpenWorkStamp", ref idOpenWorkStamp);
        }

        public static bool UpdateWorkStamp(WorkStamp workStamp)
        {
            //DebugWriteLine($"UpdateWorkStamp: {workStamp?.IdWorkStamp}");
            if (workStamp != null && workStamp.IdWorkStamp > 0)
                //Recordar que EndTime es nullable y StartTime no, por ello se validan algo diferentes
                return DBConnection.GlobalConnections[0].Execute("UpdateWorkStamp", workStamp.IdWorkStamp, workStamp.IdProject > 0 ? workStamp.IdProject : (int?)null, workStamp.StartTime.Ticks > 0 ? workStamp.StartTime : (DateTime?)null, (workStamp.EndTime?.Ticks ?? 0) > 0 ? workStamp.EndTime : (DateTime?)null, workStamp.Description);
            else
                return false;
        }

        public static bool DeleteWorkStamp(int idWorkStamp)
        {
            return DBConnection.GlobalConnections[0].Execute("DeleteWorkStamp", idWorkStamp);
        }
    }
}
