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
    /// Логика взаимодействия для PagePavilions.xaml
    /// </summary>
    public partial class PagePavilions : Page
    {
        int ShoppingCenterID;
        public PagePavilions(int shoppingCenterID)
        {
            InitializeComponent();
            ShoppingCenterID = shoppingCenterID;
            var statuses = Marinichev619KingITEntities.GetContext().StatusPavilion.ToList();
            StatusPavilion stsc = new StatusPavilion();
            stsc.Status = "Все";
            statuses.Add(stsc);
            cmbPavilionStatus.ItemsSource = statuses;
            cmbPavilionStatus.SelectedItem = cmbPavilionStatus.Items[cmbPavilionStatus.Items.Count - 1];
            UpdateItems();
        }

        private void btnAddPavilion_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.Navigate(new PagePavilionAdd(ShoppingCenterID, null));
        }

        private void btnEditPavilion_Click(object sender, RoutedEventArgs e)
        {
            Pavilion selectedPavilion = (ListPavilion.SelectedItem as Pavilion);
            if (ListPavilion.SelectedItem != null && selectedPavilion.IdStatusPavilion != 2 && selectedPavilion.IdStatusPavilion != 4)
            {
                this.NavigationService.Navigate(new PagePavilionAdd(ShoppingCenterID, selectedPavilion));
            }
            else if (ListPavilion.SelectedItem == null)
            {
                MessageBox.Show("Требуется выбрать павильон", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else if (selectedPavilion.IdStatusPavilion != 2 || selectedPavilion.IdStatusPavilion != 4)
            {
                MessageBox.Show("Павильон не может быть изменён", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void UpdateItems()
        {
            var pavilions = Marinichev619KingITEntities.GetContext().Pavilion.ToList();
            pavilions = pavilions.Where(p => p.IdShoppingCenter == ShoppingCenterID).ToList();
            ListPavilion.ItemsSource = pavilions;
        }

        private void StatusComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Sort();
        }

        private void btnDeletePavilion_Click(object sender, RoutedEventArgs e)
        {
            if (ListPavilion.SelectedItem != null)
            {
                var messageBoxResult = MessageBox.Show("Вы уверены, что хотите удалить данный павильон?", "Предупреждение", MessageBoxButton.YesNo, MessageBoxImage.Warning);
                if (messageBoxResult == MessageBoxResult.Yes)
                {
                    try
                    {
                        Pavilion selectedPavilion = (ListPavilion.SelectedItem as Pavilion);
                        if (selectedPavilion.IdStatusPavilion != 2 && selectedPavilion.IdStatusPavilion != 4)
                        {
                            Marinichev619KingITEntities.GetContext().Pavilion.Remove(selectedPavilion);
                            Marinichev619KingITEntities.GetContext().SaveChanges();
                            MessageBox.Show("Павильон удалён", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                            UpdateItems();
                        }
                        else
                        {
                            MessageBox.Show("Данный павильон невозможно удалить", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                        }
                    }
                    catch
                    {
                        MessageBox.Show("При удалении возникла ошибка", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
            }
            else
            {
                MessageBox.Show("Требуется выбрать павильон", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.GoBack();
        }

        private void Sort()
        {
            try
            {
                var pavilions = Marinichev619KingITEntities.GetContext().Pavilion.ToList();
                pavilions = pavilions.Where(p => p.IdShoppingCenter == ShoppingCenterID).ToList();

                if ((cmbPavilionStatus.SelectedItem as StatusPavilion).Status != "Все")
                {
                    pavilions = pavilions.Where(p => p.StatusPavilion == (cmbPavilionStatus.SelectedItem as StatusPavilion)).ToList();
                }

                if (!String.IsNullOrEmpty(tbFloor.Text))
                {
                    pavilions = pavilions.Where(p => p.NumberOfFloor == Convert.ToInt32(tbFloor.Text)).ToList();
                }

                if (!String.IsNullOrEmpty(tbSquareFrom.Text))
                {
                    pavilions = pavilions.Where(p => p.Square >= Convert.ToInt32(tbSquareFrom.Text)).ToList();
                }

                if (!String.IsNullOrEmpty(tbSquareTo.Text))
                {
                    pavilions = pavilions.Where(p => p.Square <= Convert.ToInt32(tbSquareTo.Text)).ToList();
                }

                ListPavilion.ItemsSource = pavilions;
            }
            catch
            {
                MessageBox.Show("При сортировке возникла ошибка", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void tbFloor_TextChanged(object sender, TextChangedEventArgs e)
        {
            Sort();
        }

        private void tbSquareFrom_TextChanged(object sender, TextChangedEventArgs e)
        {
            Sort();
        }

        private void tbSquareTo_TextChanged(object sender, TextChangedEventArgs e)
        {
            Sort();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            UpdateItems();
        }
    }
}
