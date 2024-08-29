using System;
using System.ComponentModel;
using System.Diagnostics.CodeAnalysis;
using System.Runtime.CompilerServices;

namespace InstaDataProcessor
{
    public class IgUser : INotifyPropertyChanged, IEquatable<IgUser>
    {
        private string link;
        private string username;
        private bool following;
        private bool followsYou;
        private bool userChecked;  //Usado para que el usuario pueda marcar las filas, organizarse y filtrar
        private bool whiteListed;
        private long jsonTimeStamp;  //Valor "timestamp" que tienen los json de instagram

        public string Link { get => link; set { link = value; NotifyPropertyChanged(); } }
        public string Username { get => username; set { username = value; NotifyPropertyChanged(); } }
        public bool Following { get => following; set { following = value; NotifyPropertyChanged(); } }
        public bool FollowsYou { get => followsYou; set { followsYou = value; NotifyPropertyChanged(); } }
        public bool UserChecked { get => userChecked; set { userChecked = value; NotifyPropertyChanged(); } }
        public bool WhiteListed { get => whiteListed; set { whiteListed = value; NotifyPropertyChanged(); } }
        public long JsonTimeStamp { get => jsonTimeStamp; set { jsonTimeStamp = value; NotifyPropertyChanged(); } }

        public event PropertyChangedEventHandler PropertyChanged;
        private void NotifyPropertyChanged([CallerMemberName] string propertyName = "") => PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));

        public bool Equals([AllowNull] IgUser other)
        {
            if (other != null)
                return this.Username == other.Username;
            else
                return false;
        }
    }
}
