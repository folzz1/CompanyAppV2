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

                    // Загрузка статусов в ComboBox
                    var statuses = db.Status.ToList();
                    StatusComboBox.ItemsSource = statuses;
                    StatusComboBox.DisplayMemberPath = "Name"; // Отображаемое имя
                    StatusComboBox.SelectedValuePath = "ID"; // Значение для выбора
                    StatusComboBox.SelectedValue = request.StatusID; // Устанавливаем текущий статус
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
                    request.StatusID = (int)StatusComboBox.SelectedValue; // Обновляем статус
                    db.SaveChanges(); // Сохраняем изменения
                    MessageBox.Show("Статус успешно изменен!", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                    NavigationService.GoBack(); // Возвращаемся на предыдущую страницу
                }
                else
                {
                    MessageBox.Show("Не удалось найти заявку для изменения статуса.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
    }
}