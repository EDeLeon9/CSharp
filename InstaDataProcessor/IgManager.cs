using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Windows;
using System.Windows.Input;

namespace InstaDataProcessor
{
    public class IgManager
    {
        public const string SAVEDLISTS_FILENAME = @"\InstaDataProcessor_SavedLists.json";

        public List<IgUser> IgUserList { get; set; } = new List<IgUser>();
        public string JsonFolder { get; set; } = "";


        public void LoadFollowingFollowers(bool oldMethod)
        {
            OpenFileDialog dialog = new OpenFileDialog() { Filter = "JSON files (*.json)|*.json|All files (*.*)|*.*", FileName = "connections.json", Multiselect = !oldMethod };
            if (dialog.ShowDialog() == true)
            {
                if ((!oldMethod && dialog.FileNames.Count() == 2) || oldMethod)
                {
                    Mouse.OverrideCursor = Cursors.Wait;

                    try
                    {
                        List<List<string>> jsonList = new List<List<string>>();
                        List<string> whiteList = new List<string>();
                        List<string> checkedList = new List<string>();

                        IgUserList = new List<IgUser>();
                        JsonFolder = System.IO.Path.GetDirectoryName(dialog.FileNames[0]);

                        if (File.Exists(JsonFolder + SAVEDLISTS_FILENAME))
                        {
                            //whiteList = File.ReadAllLines(JsonFolder + SAVEDLIST_FILENAME).ToList();  //Si no hay nada devuelve una lista pero sin elementos
                            jsonList = JsonSerializer.Deserialize<List<List<string>>>(File.ReadAllText(JsonFolder + SAVEDLISTS_FILENAME));
                            if (jsonList.Count == 2)
                            {
                                checkedList = jsonList.ElementAt(0);
                                whiteList = jsonList.ElementAt(1);
                            }
                            else MessageBox.Show($"The file \"{SAVEDLISTS_FILENAME[1..]}\" is not in the correct format.", Application.Current.MainWindow.Title, MessageBoxButton.OK, MessageBoxImage.Error);
                        }

                        if (oldMethod)
                            LoadFollowingFollowersOldMethod(dialog.FileName);
                        else
                            LoadFollowingFollowersNewMethod(dialog.FileNames);

                        IgUser foundUser;
                        foreach (string checkedUser in checkedList)
                        {
                            foundUser = IgUserList.Find(x => x.Username == checkedUser);
                            if (foundUser != null)
                                foundUser.UserChecked = true;
                        }
                        foreach (string whiteListedUser in whiteList)
                        {
                            foundUser = IgUserList.Find(x => x.Username == whiteListedUser);
                            if (foundUser != null)
                                foundUser.WhiteListed = true;
                        }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message, Application.Current.MainWindow.Title, MessageBoxButton.OK, MessageBoxImage.Error);
                    }

                    Mouse.OverrideCursor = null;
                }
                else MessageBox.Show("Please select exactly 2 files.", Application.Current.MainWindow.Title, MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }


        private void LoadFollowingFollowersNewMethod(string[] fileNames)
        {
            int fileIndex = 0;
            IgUser currentIgUser;
            JsonElement targetElement;
            do
            {
                using (JsonDocument document = JsonDocument.Parse(File.ReadAllText(fileNames[fileIndex])))
                {
                    if (document.RootElement.TryGetProperty("relationships_following", out JsonElement rootArray))
                    {
                        foreach (JsonElement jsonElement in rootArray.EnumerateArray())
                        {
                            targetElement = jsonElement.GetProperty("string_list_data").EnumerateArray().ElementAt(0);
                            IgUserList.Add(new IgUser() { Username = targetElement.GetProperty("value").GetString(), Link = targetElement.GetProperty("href").GetString(), JsonTimeStamp = targetElement.GetProperty("timestamp").GetInt64(), Following = true });
                        }
                        fileIndex = fileIndex * -1;
                    }
                    else fileIndex = 1;
                }
            } while (fileIndex == 1);

            fileIndex++;

            using (JsonDocument document = JsonDocument.Parse(File.ReadAllText(fileNames[fileIndex])))
            {
                foreach (JsonElement jsonElement in document.RootElement.GetProperty("relationships_followers").EnumerateArray())
                {
                    targetElement = jsonElement.GetProperty("string_list_data").EnumerateArray().ElementAt(0);
                    currentIgUser = new IgUser() { Username = targetElement.GetProperty("value").GetString(), Link = targetElement.GetProperty("href").GetString(), FollowsYou = true };
                    if (IgUserList.Contains(currentIgUser))  //IgUser implementa IEquatable para poder usar Contains (pude solo usar .Find pero lo dejo así para probar que funciona IEquatable)
                        IgUserList.Find(x => x.Username == currentIgUser.Username).FollowsYou = true;
                    else
                    {
                        currentIgUser.JsonTimeStamp = targetElement.GetProperty("timestamp").GetInt64();
                        IgUserList.Add(currentIgUser);
                    }
                }
            }

            IgUserList = IgUserList.OrderByDescending(x => x.JsonTimeStamp).ToList();
        }


        private void LoadFollowingFollowersOldMethod(string fileName)
        {
            try
            {
                using (JsonDocument document = JsonDocument.Parse(File.ReadAllText(fileName)))
                {
                    foreach (JsonProperty jsonProp in document.RootElement.GetProperty("followers").EnumerateObject())
                    {
                        IgUserList.Add(new IgUser() { Username = jsonProp.Name, FollowsYou = true });
                    }
                    foreach (JsonProperty jsonProp in document.RootElement.GetProperty("following").EnumerateObject())
                    {
                        IgUser currentIgUser = new IgUser() { Username = jsonProp.Name, Following = true };
                        if (IgUserList.Contains(currentIgUser))  //IgUser implementa IEquatable para poder usar Contains (pude solo usar .Find pero lo dejo así para probar que funciona IEquatable)
                            IgUserList.Find(x => x.Username == currentIgUser.Username).Following = true;
                        else
                            IgUserList.Add(currentIgUser);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, Application.Current.MainWindow.Title, MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }


        public void SaveChanges()
        {
            if (IgUserList != null && !string.IsNullOrWhiteSpace(JsonFolder))
            {
                try
                {
                    List<IEnumerable<string>> rootList = new List<IEnumerable<string>>();
                    rootList.Add(IgUserList.Where(x => x.UserChecked == true).Select(x => x.Username));
                    rootList.Add(IgUserList.Where(x => x.WhiteListed == true).Select(x => x.Username));

                    string jsonResult = JsonSerializer.Serialize(rootList, new JsonSerializerOptions() { WriteIndented = true });

                    //File.WriteAllLines(JsonFolder + IgManager.WHITELIST_FILENAME, IgUserList.Where(x => x.WhiteListed == true).Select(x => x.Username));
                    File.WriteAllText(JsonFolder + IgManager.SAVEDLISTS_FILENAME, jsonResult);
                    MessageBox.Show("Changes saved.", Application.Current.MainWindow.Title, MessageBoxButton.OK, MessageBoxImage.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, Application.Current.MainWindow.Title, MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else MessageBox.Show("Please load the list first.", Application.Current.MainWindow.Title, MessageBoxButton.OK, MessageBoxImage.Exclamation);
        }


		public void CopyPendingFollowRequests()
		{
			OpenFileDialog dialog = new OpenFileDialog() { Filter = "JSON files (*.json)|*.json|All files (*.*)|*.*" };
			if (dialog.ShowDialog() == true)
			{
				Mouse.OverrideCursor = Cursors.Wait;

				try
				{
                    var records = new List<string>();
					JsonElement targetElement;
					using (JsonDocument document = JsonDocument.Parse(File.ReadAllText(dialog.FileName)))
					{
						if (document.RootElement.TryGetProperty("relationships_follow_requests_sent", out JsonElement rootArray))
						{
							foreach (JsonElement jsonElement in rootArray.EnumerateArray())
							{
								targetElement = jsonElement.GetProperty("string_list_data").EnumerateArray().ElementAt(0);
								records.Add($"{targetElement.GetProperty("value").GetString()}\t{targetElement.GetProperty("href").GetString()}");
							}
						}
					}
					//Not ordering by timestamp yet
					//records = records.OrderByDescending(x => x.timestamp).ToList();
					Clipboard.SetText(string.Join("\n", records));
				}
				catch (Exception ex)
				{
					MessageBox.Show(ex.Message, Application.Current.MainWindow.Title, MessageBoxButton.OK, MessageBoxImage.Error);
				}

				Mouse.OverrideCursor = null;
			}
		}

	}
}
