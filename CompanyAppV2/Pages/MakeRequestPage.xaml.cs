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
    public partial class MakeRequestPage : Page
    {
        private int userId;

        public MakeRequestPage(int userId)
        {
            InitializeComponent();
            this.userId = userId;
            LoadEquipment();
            LoadFaultTypes();
        }

        private void LoadEquipment()
        {
            using (var db = new Entities())
            {
                var equipmentList = db.Equipment.Select(e => new
                {
                    e.ID,
                    e.Name
                }).ToList();

                EquipmentComboBox.ItemsSource = equipmentList;
                EquipmentComboBox.DisplayMemberPath = "Name";
                EquipmentComboBox.SelectedValuePath = "ID";
            }
        }

        private void LoadFaultTypes()
        {
            using (var db = new Entities())
            {
                var faultTypesList = db.FaultsTypes.Select(f => new
                {
                    f.ID,
                    f.Name
                }).ToList();

                FaultTypeComboBox.ItemsSource = faultTypesList;
                FaultTypeComboBox.DisplayMemberPath = "Name";
                FaultTypeComboBox.SelectedValuePath = "ID";
            }
        }

        private void CreateRequestButton_Click(object sender, RoutedEventArgs e)
        {
            if (EquipmentComboBox.SelectedValue == null || FaultTypeComboBox.SelectedValue == null)
            {
                MessageBox.Show("Пожалуйста, выберите оборудование и тип неисправности.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            using (var db = new Entities())
            {
                var newRequest = new Requests
                {
                    Date = DateTime.Now,
                    EquipmentID = (int)EquipmentComboBox.SelectedValue,
                    FaultTypeID = (int)FaultTypeComboBox.SelectedValue,
                    ProblemDescription = ProblemDescriptionTextBox.Text,
                    UserID = userId,
                    StatusID = 1
                };

                db.Requests.Add(newRequest);
                db.SaveChanges();
            }

            MessageBox.Show("Заявка успешно создана!", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
            NavigationService.GoBack();
        }
    }
}
