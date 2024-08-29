using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Diagnostics;
using System.Globalization;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Windows;
using System.Windows.Data;
using System.Windows.Input;
using DBConnections;

namespace Workath
{
    public class MainViewModel : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;
        public event Action UpdateGridLayout;
        public event Action<object> ScrollToWorkStamp;
        public event Action BeginEditWorkStampDescription;

        private WorkStamp selectedWorkStampFirstValues;
        private List<Project> allProjects;

        private List<HourRate> hourRateList;
        private List<string> hourRateHeaders;
        private ObservableCollection<Project> projectsForEditing;
        private ObservableCollection<Project> projectsForStamping;
        private ObservableCollection<string> yearFilters;
        private ObservableCollection<string> monthFilters;
        private ObservableCollection<Project> projectFilters;
        private bool editingSelectedWorkStamp;
        private string filterYear;
        private string filterMonth;
        private Project filterProject;
        private ObservableCollection<WorkStamp> gridWorkStamps;
        private WorkStamp selectedWorkStamp;


        #region PROPERTIES
        public RelayCommand LoadWorkStampsCommand { get; set; }
        public RelayCommand FinishWorkStampCommand { get; set; }
        public RelayCommand GenerateNewWorkStampCommand { get; set; }
        public RelayCommand ShowWorkStampIdCommand { get; set; }
        public RelayCommand DeleteWorkStampCommand { get; set; }
        public RelayCommand MergeWorkStampCommand { get; set; }
        public RelayCommand TaskbarIconClickCommand { get; set; }

        public List<HourRate> HourRateList { get => hourRateList; set { hourRateList = value; NotifyPropertyChanged(); } }
        public List<string> HourRateHeaders { get => hourRateHeaders; set { hourRateHeaders = value; NotifyPropertyChanged(); } }
        public ObservableCollection<Project> ProjectsForEditing { get => projectsForEditing; set { projectsForEditing = value; NotifyPropertyChanged(); } }
        public ObservableCollection<Project> ProjectsForStamping { get => projectsForStamping; set { projectsForStamping = value; NotifyPropertyChanged(); } }
        public ObservableCollection<string> YearFilters { get => yearFilters; set { yearFilters = value; NotifyPropertyChanged(); } }
        public ObservableCollection<string> MonthFilters { get => monthFilters; set { monthFilters = value; NotifyPropertyChanged(); } }
        public ObservableCollection<Project> ProjectFilters { get => projectFilters; set { projectFilters = value; NotifyPropertyChanged(); } }
        public bool EditingSelectedWorkStamp { get => editingSelectedWorkStamp; set { editingSelectedWorkStamp = value; NotifyPropertyChanged(); } }

        public int WorkStampCount { get => gridWorkStamps?.Where(x => x.IdWorkStamp > 0).Count() ?? 0; }
        public bool WorkStampIsOpen { get => gridWorkStamps?.Where(x => x.EndTime == null && x.IdWorkStamp > 0).FirstOrDefault() != null; }

        public string FilterYear
        {
            get => filterYear;
            set
            {
                filterYear = value;
                LoadWorkStamps(true);
                NotifyPropertyChanged();
            }
        }

        public string FilterMonth
        {
            get => filterMonth;
            set
            {
                filterMonth = value;
                LoadWorkStamps(true);
                NotifyPropertyChanged();
            }
        }
        public Project FilterProject
        {
            get => filterProject;
            set
            {
                filterProject = value;
                LoadWorkStamps(true);
                NotifyPropertyChanged();
            }
        }

        public ObservableCollection<WorkStamp> GridWorkStamps
        {
            get => gridWorkStamps;
            set
            {
                gridWorkStamps = value;
                NotifyPropertyChanged();
                NotifyPropertyChanged("WorkStampCount");
                NotifyPropertyChanged("WorkStampIsOpen");
            }
        }

        public WorkStamp SelectedWorkStamp
        {
            get => selectedWorkStamp;
            set
            {
                if (EditingSelectedWorkStamp
                    && selectedWorkStampFirstValues.IdWorkStamp == selectedWorkStamp.IdWorkStamp
                    && (selectedWorkStampFirstValues.IdProject != selectedWorkStamp.IdProject
                        || selectedWorkStampFirstValues.StartTime != selectedWorkStamp.StartTime
                        || selectedWorkStampFirstValues.EndTime != selectedWorkStamp.EndTime
                        || selectedWorkStampFirstValues.Description != selectedWorkStamp.Description))
                {
                    EditingSelectedWorkStamp = false;  //Al salir de la fila se termina de editar, y se hace set a SelectedItem (para cambiar/quitar el SelectedItem), por eso se coloca en false aquí en el set
                    UpdateWorkStamp(SelectedWorkStamp, true);
                }
                else EditingSelectedWorkStamp = false;  //Al salir de la fila se termina de editar, y se hace set a SelectedItem (para cambiar/quitar el SelectedItem), por eso se coloca en false aquí en el set

                selectedWorkStamp = value;
                selectedWorkStampFirstValues = selectedWorkStamp != null ? new WorkStamp(selectedWorkStamp) : null;
                NotifyPropertyChanged();
                NotifyPropertyChanged("WorkStampIsOpen");
            }
        }

        #endregion


        public MainViewModel()
        {
            LoadWorkStampsCommand = new RelayCommand(LoadWorkStamps);
            FinishWorkStampCommand = new RelayCommand(FinishWorkStamp);
            GenerateNewWorkStampCommand = new RelayCommand(GenerateNewWorkStamp);
            ShowWorkStampIdCommand = new RelayCommand(ShowWorkStampId);
            DeleteWorkStampCommand = new RelayCommand(DeleteWorkStamp);
            MergeWorkStampCommand = new RelayCommand(MergeWorkStamp);
            TaskbarIconClickCommand = new RelayCommand(TaskbarIconClick);
        }


        #region PRIVATE METHODS
        private void NotifyPropertyChanged([CallerMemberName] string propertyName = "") => PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));

        //Cuando se usa un RelayCommand desde el View puede que el parámetro llege en null, sobretodo cuando el método del RelayCommand tiene dos parámetros
        private bool BoolIsMainMethod(object isMainMethod) => (isMainMethod == null || (bool)isMainMethod);

        private void Hourglass(bool state, object isMainMethod)
        {
            if (BoolIsMainMethod(isMainMethod))
                Mouse.OverrideCursor = state ? Cursors.Wait : null;
        }

        //Se usa ManualConnection si va a ejecutar varios Stored Procedures de la base de datos para que solo se conecte una sola vez
        private void ManualConnection(bool connect, object isMainMethod)
        {
            if (BoolIsMainMethod(isMainMethod))
            {
                if (connect && DBConnection.GlobalConnections[0].ManualConnection == false)
                {
                    DBConnection.GlobalConnections[0].ManualConnection = true;
                    DBConnection.GlobalConnections[0].Connect();
                }
                else if (!connect && DBConnection.GlobalConnections[0].ManualConnection == true)
                {
                    DBConnection.GlobalConnections[0].Disconnect();
                    DBConnection.GlobalConnections[0].ManualConnection = false;
                }
            }
        }
        #endregion


        public void InitStaticUiCollections()
        {
            allProjects = Project.GetProjects();
            ProjectsForStamping = new ObservableCollection<Project>(allProjects.Where(x => x.Enabled == true));

            HourRateList = HourRate.GetHourRates();
            if (HourRateList.Count == 4)
            {
                HourRateHeaders = (new string[]{
                    $"{HourRateList[0].Description};{HourRateList[0].HourRateAmount}",
                    $"{HourRateList[1].Description};{HourRateList[1].HourRateAmount}",
                    $"{HourRateList[2].Description};{HourRateList[2].HourRateAmount}",
                    $"{HourRateList[3].Description};{HourRateList[3].HourRateAmount}"
                }).ToList();
            }
        }


        public void InitInteractiveUiCollections()
        {
            Hourglass(true, true);

            List<int> yearsInt = new List<int>();
            int firstYear = WorkStamp.GetFirstYear();  //No se trae un listado de años ya que (hipotéticamente) puede haber un año sin trabajar y debe aparecer en el listado
            if (firstYear > 0)
                for (int i = firstYear; i <= DateTime.Now.Year; i++)
                    yearsInt.Add(i);

            List<string> years = yearsInt.ConvertAll(x => x.ToString());
            filterYear = years[^1];
            years.Insert(0, "All");
            NotifyPropertyChanged("FilterYear");
            YearFilters = new ObservableCollection<string>(years);

            List<string> months = CultureInfo.GetCultureInfo("en-US").DateTimeFormat.MonthNames[0..12].ToList();
            filterMonth = months[DateTime.Now.Month - 1];
            months.Insert(0, "All");
            NotifyPropertyChanged("FilterMonth");
            MonthFilters = new ObservableCollection<string>(months);

            List<Project> projects = allProjects.Where(x => x.Enabled == true).ToList();
            filterProject = new Project { IdProject = 0, ProjectName = "All" };
            projects.Insert(0, filterProject);
            NotifyPropertyChanged("FilterProject");
            ProjectFilters = new ObservableCollection<Project>(projects);

            Hourglass(false, true);
        }


        public void LoadWorkStamps(object isMainMethod)
        {
            Hourglass(true, isMainMethod);

            int monthInt = 0;
            DateTime.TryParseExact(filterMonth, "MMMM", CultureInfo.GetCultureInfo("en-US"), DateTimeStyles.None, out DateTime dateTime);
            if (dateTime.Ticks > 0)
                monthInt = dateTime.Month;

            int.TryParse(filterYear, out int yearInt);

            int storedIdSelectedWorkStamp = SelectedWorkStamp?.IdWorkStamp ?? 0;

            GridWorkStamps = new ObservableCollection<WorkStamp>(WorkStamp.GetWorkStamps(HourRateList, FilterProject != null ? (FilterProject.IdProject > 0 ? FilterProject.IdProject : (int?)null) : (int?)null,
                yearInt > 0 ? yearInt : (int?)null, monthInt > 0 ? monthInt : (int?)null));

            List<int> gridIdProjects = GridWorkStamps.Select(ws => ws.IdProject).Where(id => id > 0).Distinct().ToList();
            ProjectsForEditing = new ObservableCollection<Project>(allProjects.Where(x => x.Enabled == true || gridIdProjects.Contains(x.IdProject)));


            if (BoolIsMainMethod(isMainMethod) && storedIdSelectedWorkStamp > 0)
            {
                SelectedWorkStamp = GridWorkStamps.FirstOrDefault(x => x.IdWorkStamp == storedIdSelectedWorkStamp);
                ScrollToWorkStamp?.Invoke(SelectedWorkStamp);
            }
            else UpdateGridLayout?.Invoke();  //Actualiza con anticipación lo visual del DataGrid

            Hourglass(false, isMainMethod);
        }


        public bool FinishWorkStamp(object isMainMethod)
        {
            Hourglass(true, isMainMethod);
            ManualConnection(true, isMainMethod);

            int updatedIdWorkStamp = 0;
            bool executed = WorkStamp.UpdateOpenWorkStamp(ref updatedIdWorkStamp, DateTime.Now);

            if (BoolIsMainMethod(isMainMethod) && updatedIdWorkStamp > 0)
            {
                LoadWorkStamps(false);
                SelectedWorkStamp = GridWorkStamps.FirstOrDefault(x => x.IdWorkStamp == updatedIdWorkStamp);
                ScrollToWorkStamp?.Invoke(SelectedWorkStamp);
            }

            ManualConnection(false, isMainMethod);
            Hourglass(false, isMainMethod);
            return executed;
        }


        public bool GenerateNewWorkStamp(object idProjectParam, object isMainMethod)
        {
            bool executed = false;
            int idProject = (int?)idProjectParam ?? 0;  //Convierte el object en un int nullable, y si es null devolverá 0
            if (idProject > 0)
            {
                Hourglass(true, isMainMethod);
                ManualConnection(true, isMainMethod);

                if (FinishWorkStamp(false))
                {
                    int insertedIdWorkStamp = WorkStamp.InsertWorkStamp(idProject, DateTime.Now, null);
                    if (insertedIdWorkStamp > 0)
                    {
                        executed = true;
                        LoadWorkStamps(false);
                        SelectedWorkStamp = GridWorkStamps.FirstOrDefault(x => x.IdWorkStamp == insertedIdWorkStamp);
                        ScrollToWorkStamp?.Invoke(SelectedWorkStamp);
                        BeginEditWorkStampDescription?.Invoke();
                    }
                }

                ManualConnection(false, isMainMethod);
                Hourglass(false, isMainMethod);
            }
            return executed;
        }


        public bool UpdateWorkStamp(WorkStamp workStamp, object isMainMethod)
        {
            Hourglass(true, isMainMethod);
            bool executed = WorkStamp.UpdateWorkStamp(workStamp);

            if (executed)
            {
                //Calcula el WorkingTime y los Incomes. 
                //Debido a que este método se usa en el set de SelectedWorkStamp hace NotifyPropertyChanged() y actualiza correctamente lo visual. Si se usa en otro lugar que no 
                //haya NotifyPropertyChanged() debería de igual forma actualizarse lo visual debido la implementación de INotifyPropertyChanged en la clase WorkStamp.
                workStamp.WorkingTime = workStamp.StartTime.Ticks > 0 && (workStamp.EndTime?.Ticks ?? 0) > 0 ? workStamp.EndTime.GetValueOrDefault() - workStamp.StartTime : (TimeSpan?)null;
                workStamp.SetIncomes(HourRateList);

                if (BoolIsMainMethod(isMainMethod)) 
                    UpdateGroupTotals(workStamp.DateText);
            }

            NotifyPropertyChanged("WorkStampIsOpen");

            Hourglass(false, isMainMethod);
            return executed;
        }


        public bool MergeWorkStamp(object workStamp, object isMainMethod)
        {
            bool executed = false;
            if (!EditingSelectedWorkStamp)
            {
                if (workStamp != null)
                {
                    WorkStamp currentStamp = (WorkStamp)workStamp;

                    if (currentStamp.StartTime.Ticks > 0 && currentStamp.EndTime.GetValueOrDefault().Ticks > 0)  //Usando GetValueOrDefault() con EndTime en null trae un DateTime con Ticks en 0
                    {
                        Hourglass(true, isMainMethod);

                        //Solo obtiene los del grupo que tienen StartTime, si hay un conflicto de fechas con los no obtenidos se deberá arreglar manualmente
                        List<WorkStamp> stampGroup = GridWorkStamps.Where(x => x.DateText == currentStamp.DateText && x.StartTime.Ticks > 0).ToList();

                        //Obtiene un WorkStamp que tenga StartTime menor al seleccionado para combinar, y que tenga EndTime (arriba ya se validó que tenga StartTime)
                        WorkStamp hostStamp = stampGroup.Where(x => x.IdWorkStamp != currentStamp.IdWorkStamp && x.IdProject == currentStamp.IdProject && x.StartTime < currentStamp.StartTime
                            && x.EndTime.GetValueOrDefault().Ticks > 0).OrderBy(x => x.StartTime).LastOrDefault();

                        if (hostStamp != null)
                        {
                            if (string.IsNullOrWhiteSpace(hostStamp.Description) || string.IsNullOrWhiteSpace(currentStamp.Description))
                            {
                                DateTime newEndTime = hostStamp.EndTime.GetValueOrDefault().Add(currentStamp.WorkingTime.GetValueOrDefault());

                                //Valida con WorkStamps que tengan StartTime mayor al seleccionado. Si hay algún WorkStamp con StartTime igual a hostStamp no se considerarán, así que si hay un 
                                //conflicto de fechas con los WorkStamp no considerados se deberá arreglar manualmente
                                if (stampGroup.Where(x => x.IdWorkStamp != currentStamp.IdWorkStamp && x.IdWorkStamp != hostStamp.IdWorkStamp && x.StartTime > hostStamp.StartTime
                                    && x.StartTime < newEndTime).FirstOrDefault() == null)
                                {
                                    DateTime previousEndTime = hostStamp.EndTime.GetValueOrDefault();
                                    hostStamp.EndTime = newEndTime;
                                    if (string.IsNullOrWhiteSpace(hostStamp.Description) && !string.IsNullOrWhiteSpace(currentStamp.Description))
                                    {
                                        hostStamp.Description = currentStamp.Description;
                                    }

                                    executed = UpdateWorkStamp(hostStamp, false);

                                    if (executed)
                                    {
                                        DeleteWorkStamp(currentStamp, false);
                                        SelectedWorkStamp = hostStamp;
                                    }
                                    else hostStamp.EndTime = previousEndTime;
                                }
                                else MessageBox.Show("There is a work stamp that conflicts with the merge.\nMerged end time: " + newEndTime.ToString(App.DATETIME_FORMAT, CultureInfo.InvariantCulture), Application.Current.MainWindow.Title, MessageBoxButton.OK, MessageBoxImage.Error);
                            }
                            else MessageBox.Show("The work stamps that are about to be merged have both descriptions.\nTarget work stamp Id: " + hostStamp.IdWorkStamp, Application.Current.MainWindow.Title, MessageBoxButton.OK, MessageBoxImage.Error);
                        }
                        else MessageBox.Show("There is no work stamp available to merge", Application.Current.MainWindow.Title, MessageBoxButton.OK, MessageBoxImage.Error);

                        Hourglass(false, isMainMethod);

                    }
                    else MessageBox.Show("You can't merge a work stamp without start time or end time", Application.Current.MainWindow.Title, MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else MessageBox.Show("Please finish editing the work stamp before attempting to merge", Application.Current.MainWindow.Title, MessageBoxButton.OK, MessageBoxImage.Error);

            return executed;
        }


        public bool DeleteWorkStamp(object workStamp, object isMainMethod)  //Se pudiera usar el SelectedWorkStamp, pero quiero dejar el método para usarse libre
        {
            bool executed = false;
            if (workStamp != null)
            {
                Hourglass(true, isMainMethod);

                WorkStamp currentStamp = (WorkStamp)workStamp;
                executed = WorkStamp.DeleteWorkStamp(currentStamp.IdWorkStamp);

                if (executed)
                {
                    GridWorkStamps.Remove(currentStamp);
                    NotifyPropertyChanged("WorkStampCount");
                    NotifyPropertyChanged("WorkStampIsOpen");

                    if (BoolIsMainMethod(isMainMethod))
                        UpdateGroupTotals(currentStamp.DateText);
                }

                Hourglass(false, isMainMethod);
            }
            return executed;
        }


        //Calcula el total del grupo, y los datos se actualizan visualmente gracias a la implementación de INotifyPropertyChanged en la clase WorkStamp
        public void UpdateGroupTotals(string groupDateText)
        {
            WorkStamp totalStamp = new WorkStamp();
            TimeSpan totalWorkingTime = new TimeSpan();

            List<WorkStamp> stampGroup = GridWorkStamps.Where(x => x.DateText == groupDateText).ToList();

            foreach (WorkStamp stamp in stampGroup)
            {
                if (stamp.IdWorkStamp > 0)
                    totalWorkingTime = totalWorkingTime.Add(stamp.WorkingTime.GetValueOrDefault());
                else
                    totalStamp = stamp;
            }

            if (stampGroup.Count > 1)
            {
                totalStamp.WorkingTime = totalWorkingTime;
                totalStamp.SetIncomes(HourRateList);
            }
            else GridWorkStamps.Remove(totalStamp);  //Si queda solo la fila de total en ese grupo entonces se elimina
        }


        public void ShowWorkStampId(object idWorkStamp)  //Se pudiera usar el SelectedWorkStamp para obtener el Id, pero quiero dejar el método para usarse libre
        {
            if (idWorkStamp != null)
                MessageBox.Show($"ID: {idWorkStamp}", Application.Current.MainWindow.Title, MessageBoxButton.OK, MessageBoxImage.Information);
        }


        private void TaskbarIconClick(object param)
        {
            Window window = Application.Current.MainWindow;  //Recordar que no se usa Linq para buscar la que está IsActive = true porque no sirve si hay otra ventana de otro programa con focus
            if (window.WindowState == WindowState.Minimized)
                SystemCommands.RestoreWindow(window);
            window.Activate();
        }
    }
}
