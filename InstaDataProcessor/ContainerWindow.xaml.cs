using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using static System.Text.Json.JsonElement;

namespace InstaDataProcessor
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        IgManager igManager = new IgManager();
        public ObservableCollection<IgUser> igUserCollection = new ObservableCollection<IgUser>();

        public MainWindow()
        {
            InitializeComponent();
        }


        private void btnFollowingsFollowers_Click(object sender, RoutedEventArgs e)
		{
            //igManager.CopyPendingFollowRequests();
            //return;
            igManager.LoadFollowingFollowers(chkOldMethod.IsChecked == true);
            FillIgUserCollection(null, null);
        }


        private void FillIgUserCollection(object sender, SelectionChangedEventArgs e)
        {
            if (this.IsInitialized)
            {
                int indexFollowing = cboFollowing.SelectedIndex;
                int indexFollowsYou = cboFollowsYou.SelectedIndex;
                int indexChecked = cboChecked.SelectedIndex;
                int indexWhiteList = cboWhiteList.SelectedIndex;

                igUserCollection = new ObservableCollection<IgUser>(igManager.IgUserList.Where(x =>
                    (((x.Following == true && indexFollowing != 2) || (x.Following == false && indexFollowing != 1))
                    && ((x.FollowsYou == true && indexFollowsYou != 2) || (x.FollowsYou == false && indexFollowsYou != 1))
                    && ((x.UserChecked == true && indexChecked != 2) || (x.UserChecked == false && indexChecked != 1))
                    && ((x.WhiteListed == true && indexWhiteList != 2) || (x.WhiteListed == false && indexWhiteList != 1)))).AsEnumerable());

                grdIgUsers.ItemsSource = igUserCollection;
                txtRowCount.Text = grdIgUsers.Items.Count.ToString();
            }
        }


        private void btnShowFollowings_Click(object sender, RoutedEventArgs e)
        {

        }


        private void btnShowFollowers_Click(object sender, RoutedEventArgs e)
        {

        }


        private void btnSaveChanges_Click(object sender, RoutedEventArgs e)
        {
            igManager.SaveChanges();
        }


        private void MenuItemCopy_Click(object sender, RoutedEventArgs e)
        {
            Clipboard.SetText(string.Join("\n", grdIgUsers.SelectedItems.Cast<IgUser>().OrderByDescending(x => x.JsonTimeStamp).Select(x => $"{x.Username}\t{x.Link}")));
        }


        private void MenuItemSetChecked_Click(object sender, RoutedEventArgs e)
        {
            bool boolState = grdIgUsers.SelectedItems.Cast<IgUser>().Where(x => x.UserChecked == false).FirstOrDefault() != null;
            foreach (IgUser item in grdIgUsers.SelectedItems)
            {
                item.UserChecked = boolState;  //Se actualiza visualmente en el DataGrid debido a la implementación de INotifyPropertyChanged en IgUser
            }
        }


        private void MenuItemSetWhiteList_Click(object sender, RoutedEventArgs e)
        {
            bool boolState = grdIgUsers.SelectedItems.Cast<IgUser>().Where(x => x.WhiteListed == false).FirstOrDefault() != null;
            foreach (IgUser item in grdIgUsers.SelectedItems)
            {
                item.WhiteListed = boolState;  //Se actualiza visualmente en el DataGrid debido a la implementación de INotifyPropertyChanged en IgUser
            }
        }



        #region TESTS
        //private void btnSerialize_Click(object sender, RoutedEventArgs e)
        //{
        //    List<RaizSerialize> roots = new List<RaizSerialize>();
        //    List<Magazine> magazine;

        //    for (int i = 1; i <= 3; i++)
        //    {
        //        magazine = new List<Magazine>();
        //        for (int j = 1; j <= 2; j++)
        //        {
        //            magazine.Add(new Magazine() { id = j * i, datetime = DateTime.Now });
        //        }
        //        roots.Add(new RaizSerialize() { author = new Author() { id = i, name = "AutName n" + i, book = new Book { id = i, title = "BkName" + i, pages = i * 100 }, magazines = magazine } });

        //        Debug.WriteLine(roots[^1].ToString());
        //        Debug.WriteLine("");
        //    }

        //    string jsonResult = JsonSerializer.Serialize(roots, new JsonSerializerOptions() { WriteIndented = true });
        //    Debug.WriteLine(jsonResult);
        //    MessageBox.Show(jsonResult);
        //}



        //private void btnDeserialize_Click(object sender, RoutedEventArgs e)
        //{
        //    string jsonResult = File.ReadAllText(@"E:\Usuario\Documentos\Visual Studio 2019\Proyectos\InstaDataProcessor\PruebaJson.json");
        //    RaizDeserialize raiz = JsonSerializer.Deserialize<RaizDeserialize>(jsonResult);
        //    Debug.WriteLine(raiz.ToString());
        //}



        //private void btnDeserializeManual_Click(object sender, RoutedEventArgs e)
        //{
        //    string json = File.ReadAllText(@"E:\Usuario\Documentos\Visual Studio 2019\Proyectos\InstaDataProcessor\PruebaJson.json");

        //    using (JsonDocument document = JsonDocument.Parse(json))
        //    {
        //        JsonElement root = document.RootElement;
        //        //JsonElement author1 = root.GetProperty("author1");
        //        //JsonElement author2 = root.GetProperty("author2");
        //        //JsonElement author3 = root.GetProperty("author3");

        //        if (root.ValueKind == JsonValueKind.Object)
        //        {
        //            ObjectEnumerator enumeratorLv1 = root.EnumerateObject();
        //            foreach (JsonProperty propLv1 in enumeratorLv1)
        //            {
        //                if (propLv1.Value.ValueKind == JsonValueKind.Object)
        //                {
        //                    Debug.WriteLine($"propLv1 IS {propLv1.Name}");

        //                    ObjectEnumerator enumeratorLv2 = propLv1.Value.EnumerateObject();
        //                    foreach (JsonProperty propLv2 in enumeratorLv2)
        //                    {
        //                        if (propLv2.Value.ValueKind == JsonValueKind.Object)
        //                        {
        //                            Debug.WriteLine($"\tpropLv2 IS {propLv2.Name}");

        //                            ObjectEnumerator enumeratorLv3 = propLv2.Value.EnumerateObject();
        //                            foreach (JsonProperty propLv3 in enumeratorLv3)
        //                            {
        //                                Debug.WriteLine($"\t\tpropLv3 {propLv3.Name}: {propLv3.Value}");
        //                            }
        //                        }
        //                        //Solo se hizo este "else if" para probar los arreglos los cuales no tienen más niveles (es decir sin más clases ni arreglos dentro) pero se
        //                        //pùede seguir haciendo más niveles usando EnumerateObject() de los JsonElement del ArrayEnumerator ( elemLv3.EnumerateObject() );
        //                        else if (propLv2.Value.ValueKind == JsonValueKind.Array)
        //                        {
        //                            Debug.WriteLine($"\tpropLv2 IS {propLv2.Name} <ARRAY>");

        //                            ArrayEnumerator enumeratorLv3 = propLv2.Value.EnumerateArray();
        //                            foreach (JsonElement elemLv3 in enumeratorLv3)
        //                            {
        //                                Debug.WriteLine("\t\t[");
        //                                Debug.WriteLine($"\t\t\telemLv3 id: {elemLv3.GetProperty("id").GetInt32()}");
        //                                Debug.WriteLine($"\t\t\telemLv3 datetime: {elemLv3.GetProperty("datetime").GetDateTime()}");
        //                                Debug.WriteLine("\t\t]");
        //                            }
        //                        }
        //                        else
        //                        {
        //                            Debug.WriteLine($"\tpropLv2 {propLv2.Name}: {propLv2.Value}");
        //                        }
        //                    }
        //                }
        //                else
        //                {
        //                    Debug.WriteLine($"propLv1 {propLv1.Name}: {propLv1.Value}");
        //                }
        //            }
        //        }
        //    }
        //}
        #endregion

    }
}
