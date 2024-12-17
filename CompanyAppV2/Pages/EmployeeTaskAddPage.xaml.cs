﻿using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace CompanyAppV2.Pages
{
    public partial class EmployeeTaskAddPage : Page
    {
        private int requestId;

        public EmployeeTaskAddPage(int requestId)
        {
            InitializeComponent();
            this.requestId = requestId;
            LoadRequestDetails();
            LoadEmployees();
        }

        private void LoadRequestDetails()
        {
            using (var db = new Entities())
            {
                var request = db.Requests
                    .Where(r => r.ID == requestId)
                    .Select(r => new
                    {
                        r.ID,
                        r.ProblemDescription,
                        r.DeadLine // Добавляем дедлайн
                    })
                    .FirstOrDefault();

                if (request != null)
                {
                    RequestIdTextBlock.Text = request.ID.ToString();
                    ProblemDescriptionTextBlock.Text = request.ProblemDescription;
                    DeadlineDatePicker.SelectedDate = request.DeadLine; // Устанавливаем дедлайн
                }
                else
                {
                    MessageBox.Show("Заявка не найдена.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void LoadEmployees()
        {
            using (var db = new Entities())
            {
                var employees = db.Staff.Select(s => new
                {
                    s.ID,
                    FullName = s.First_Name + " " + s.Last_Name
                }).ToList();

                EmployeeComboBox.ItemsSource = employees;
                EmployeeComboBox.DisplayMemberPath = "FullName";
                EmployeeComboBox.SelectedValuePath = "ID";
            }
        }

        private void AssignButton_Click(object sender, RoutedEventArgs e)
        {
            if (EmployeeComboBox.SelectedValue != null)
            {
                using (var db = new Entities())
                {
                    var request = db.Requests.FirstOrDefault(r => r.ID == requestId);
                    if (request != null)
                    {
                        request.EmployeeID = (int)EmployeeComboBox.SelectedValue; // Обновляем ID сотрудника

                        // Проверяем, выбрана ли дата
                        if (DeadlineDatePicker.SelectedDate.HasValue)
                        {
                            request.DeadLine = DeadlineDatePicker.SelectedDate.Value; // Обновляем дедлайн
                        }
                        else
                        {
                            MessageBox.Show("Пожалуйста, выберите дедлайн.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                            return; // Выход из метода, если дата не выбрана
                        }

                        db.SaveChanges(); // Сохраняем изменения
                        MessageBox.Show("Сотрудник назначен успешно!", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                        NavigationService.GoBack(); // Возвращаемся на предыдущую страницу
                    }
                    else
                    {
                        MessageBox.Show("Не удалось найти заявку для назначения сотрудника.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
            }
            else
            {
                MessageBox.Show("Пожалуйста, выберите сотрудника.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }
    }
}