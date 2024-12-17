using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace CompanyAppV2.Pages
{
    public partial class AdminPage : Page
    {
        public AdminPage()
        {
            InitializeComponent();
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            using (var db = new Entities())
            {
                var requests = db.Requests
                    .Select(r => new
                    {
                        r.ID,
                        r.Date,
                        UserName = r.Users != null ? r.Users.Login : "Неизвестно",
                        EquipmentName = r.Equipment != null ? r.Equipment.Name : "Неизвестно",
                        FaultTypeName = r.FaultsTypes != null ? r.FaultsTypes.Name : "Неизвестно",
                        StatusName = r.Status != null ? r.Status.Name : "Неизвестно",
                        r.ProblemDescription
                    })
                    .ToList();

                RequestsDataGrid.ItemsSource = requests;
            }
        }

        private void ChangeStatusButton_Click(object sender, RoutedEventArgs e)
        {
            var button = sender as Button;
            var request = button?.DataContext;

            if (request != null)
            {
                int requestId = (int)request.GetType().GetProperty("ID").GetValue(request);

                NavigationService.Navigate(new StatusChangePage(requestId));
            }
            else
            {
                MessageBox.Show("Не удалось получить информацию о заявке.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void StatisticsButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new StatisticsPage());
        }
    }
}