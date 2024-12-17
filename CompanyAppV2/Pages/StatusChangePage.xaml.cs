using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace CompanyAppV2.Pages
{
    public partial class StatusChangePage : Page
    {
        private int requestId;

        public StatusChangePage(int requestId)
        {
            InitializeComponent();
            this.requestId = requestId;
            LoadRequestDetails();
        }

        private void LoadRequestDetails()
        {
            using (var db = new Entities())
            {
                var request = db.Requests
                    .Where(r => r.ID == requestId)
                    .Select(r => new
                    {
                        r.Date,
                        UserName = r.Users.Login,
                        EquipmentName = r.Equipment.Name,
                        FaultTypeName = r.FaultsTypes.Name,
                        r.StatusID,
                        r.ProblemDescription
                    })
                    .FirstOrDefault();

                if (request != null)
                {
                    DateTextBlock.Text = request.Date.ToString();
                    UserNameTextBlock.Text = request.UserName;
                    EquipmentNameTextBlock.Text = request.EquipmentName;
                    FaultTypeNameTextBlock.Text = request.FaultTypeName;
                    ProblemDescriptionTextBlock.Text = request.ProblemDescription;

                    var statuses = db.Status.ToList();
                    StatusComboBox.ItemsSource = statuses;
                    StatusComboBox.DisplayMemberPath = "Name";
                    StatusComboBox.SelectedValuePath = "ID";
                    StatusComboBox.SelectedValue = request.StatusID;
                }
                else
                {
                    MessageBox.Show("Заявка не найдена.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            using (var db = new Entities())
            {
                var request = db.Requests.FirstOrDefault(r => r.ID == requestId);
                if (request != null)
                {
                    request.StatusID = (int)StatusComboBox.SelectedValue;
                    db.SaveChanges();
                    MessageBox.Show("Статус успешно изменен!", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                    NavigationService.GoBack();
                }
                else
                {
                    MessageBox.Show("Не удалось найти заявку для изменения статуса.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
    }
}