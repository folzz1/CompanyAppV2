using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace CompanyAppV2.Pages
{
    public partial class StatisticsPage : Page
    {
        public StatisticsPage()
        {
            InitializeComponent();
            LoadStatistics();
        }

        private void LoadStatistics()
        {
            using (var db = new Entities())
            {
                var completedRequestsCount = db.Requests.Count(r => r.StatusID == 4);

                var averageDaysSpent = Math.Round(db.Requests.Average(r => r.DaysSpent) ?? 0);

                var faultTypeStatistics = db.Requests
                    .GroupBy(r => r.FaultTypeID)
                    .Select(g => new
                    {
                        FaultTypeID = g.Key,
                        Count = g.Count()
                    })
                    .ToList();

                CompletedRequestsCountTextBlock.Text = completedRequestsCount.ToString();
                AverageDaysSpentTextBlock.Text = averageDaysSpent.ToString("0"); 
                FaultTypeStatisticsDataGrid.ItemsSource = faultTypeStatistics;
            }
        }
    }
}