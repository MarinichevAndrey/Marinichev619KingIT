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

namespace Marinichev619KingIT.Pages
{
    /// <summary>
    /// Логика взаимодействия для ManagerCPage.xaml
    /// </summary>
    public partial class ManagerCPage : Page
    {
        public ManagerCPage()
        {
            InitializeComponent();
            var statuses = Marinichev619KingITEntities.GetContext().StatusShoppingCenter.ToList();
            StatusShoppingCenter newSSC = new StatusShoppingCenter();
            newSSC.Status = "Все";
            statuses.Add(newSSC);
            combosort.ItemsSource = statuses;
            combosort.SelectedItem = combosort.Items[combosort.Items.Count - 1];
            UpdateItems();
        }

        private void SortShoppingCenters(object sender, SelectionChangedEventArgs e)
        {
            var malls = Marinichev619KingITEntities.GetContext().ShoppingCenter.ToList();
            if ((combosort.SelectedItem as StatusShoppingCenter).Status == "Все")
            {
                malls = malls.OrderBy(sc => sc.City.Title).OrderBy(sc => sc.StatusShoppingCenter.Status).ToList();
                dataList.ItemsSource = malls;
                return;
            }
            var filteredSC = malls.Where(sc => sc.StatusShoppingCenter.Status == (combosort.SelectedItem as StatusShoppingCenter).Status);
            filteredSC = filteredSC.OrderBy(sc => sc.City.Title).OrderBy(sc => sc.StatusShoppingCenter.Status).ToList();
            dataList.ItemsSource = filteredSC;

        }

        private void btnAddSC(object sender, EventArgs e)
        {
            NavigationService.Content = new AddSHPage();
        }

        private void btnEditSC(object sender, RoutedEventArgs e)
        {
            if (dataList.SelectedItem != null)
            {
                ShoppingCenter selectedSC = (dataList.SelectedItem as ShoppingCenter);
                this.NavigationService.Navigate(new AddSHPage(selectedSC));
            }
            else
            {
                MessageBox.Show("Выберите тороговый центр", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void UpdateItems()
        {
            var malls = Marinichev619KingITEntities.GetContext().ShoppingCenter.ToList();
            malls = malls.OrderBy(sc => sc.City.Title).ThenBy(sc => sc.StatusShoppingCenter.Status).ToList();
            dataList.ItemsSource = malls;
        }

        private void btnDeleteSC(object sender, RoutedEventArgs e)
        {
            if (dataList.SelectedItem != null)
            {
                var mbres = MessageBox.Show("Вы точно хотите удалить данный торговый центр?", "Уведомление!", MessageBoxButton.YesNo, MessageBoxImage.Warning);
                if (mbres == MessageBoxResult.Yes)
                {
                    try
                    {
                        ShoppingCenter selectedSC = (dataList.SelectedItem as ShoppingCenter);
                        Marinichev619KingITEntities.GetContext().ShoppingCenter.Remove(selectedSC);
                        Marinichev619KingITEntities.GetContext().SaveChanges();
                        MessageBox.Show("Данный торговый центр был успешно удалён!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                        UpdateItems();
                    }
                    catch
                    {
                        MessageBox.Show("При удалении торгового центра произошла ошибка!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
            }
            else
            {
                MessageBox.Show("Выберите тороговый центр!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btnGoToPavilions(object sender, RoutedEventArgs e)
        {
            if (dataList.SelectedItem != null)
            {
                this.NavigationService.Navigate(new PagePavilions((dataList.SelectedItem as ShoppingCenter).Id));
            }
            else
            {
                MessageBox.Show("Выберите тороговый центр!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            UpdateItems();
        }
    }
}
