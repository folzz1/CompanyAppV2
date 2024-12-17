using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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

namespace CompanyAppV2.Pages
{
    /// <summary>
    /// Логика взаимодействия для UserPage.xaml
    /// </summary>
    public partial class UserPage : Page
    {
        private int userId;

        public UserPage(int userId)
        {
            InitializeComponent();
            this.userId = userId;
        }



        private void Button_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new MakeRequestPage(userId));
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            using (var db = new Entities())
            {
                var requests = db.Requests
                    .Where(r => r.UserID == userId)
                    .Select(r => new
                    {
                        r.Date,
                        EquipmentName = r.Equipment.Name,
                        FaultTypeName = r.FaultsTypes.Name,
                        StatusName = r.Status.Name,
                        r.ProblemDescription
                    })
                    .ToList();

                RequestsDataGrid.ItemsSource = requests;
            }
        }
    }
}
