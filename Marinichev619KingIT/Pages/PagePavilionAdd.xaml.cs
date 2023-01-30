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
    /// Логика взаимодействия для PagePavilionAdd.xaml
    /// </summary>
    public partial class PagePavilionAdd : Page
    {
        Pavilion CurrentPavilion = null;
        int ShoppingCenterID;
        public PagePavilionAdd(int selectedShoppingCenterID, Pavilion selectedPavilion = null)
        {
            InitializeComponent();
            var statuses = Marinichev619KingITEntities.GetContext().StatusPavilion.ToList();
            cmbstatus.ItemsSource = statuses;
            if (selectedPavilion != null)
            {
                CurrentPavilion = selectedPavilion;
                tbfloor.Text = selectedPavilion.NumberOfFloor.ToString();
                tbPavilionNumber.Text = selectedPavilion.PovilionNum;
                cmbstatus.SelectedItem = selectedPavilion.StatusPavilion;
                tbsquare.Text = selectedPavilion.Square.ToString();
                tbprice.Text = selectedPavilion.CostPerSqm.ToString();
                tbvalueaddedratio.Text = selectedPavilion.ValueAddedRatio.ToString();
                btnAdd.Content = "Сохранить";
            }
            ShoppingCenterID = selectedShoppingCenterID;
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.GoBack();
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            if (String.IsNullOrEmpty(tbfloor.Text) || String.IsNullOrEmpty(tbvalueaddedratio.Text) || String.IsNullOrEmpty(tbprice.Text) || String.IsNullOrEmpty(tbPavilionNumber.Text) || String.IsNullOrEmpty(cmbstatus.Text) || String.IsNullOrEmpty(tbsquare.Text))
            {
                MessageBox.Show("Не все поля заполнены", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            if (CurrentPavilion != null)
            {
                try
                {
                    CurrentPavilion.PovilionNum = tbPavilionNumber.Text;
                    CurrentPavilion.NumberOfFloor = Convert.ToInt32(tbfloor.Text);
                    CurrentPavilion.IdStatusPavilion = (cmbstatus.SelectedItem as StatusPavilion).Id;
                    CurrentPavilion.Square = Convert.ToInt32(tbsquare.Text);
                    CurrentPavilion.CostPerSqm = Convert.ToDecimal(tbprice.Text);
                    if (Convert.ToDouble(tbvalueaddedratio.Text) < 0.1)
                    {
                        return;
                    }
                    CurrentPavilion.ValueAddedRatio = Convert.ToDouble(tbvalueaddedratio.Text);
                    Marinichev619KingITEntities.GetContext().SaveChanges();
                    MessageBox.Show("Изменения внесены", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                    this.NavigationService.GoBack();
                }
                catch
                {
                    MessageBox.Show("При изменении павильона возникла ошибка", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else
            {
                try
                {
                    Pavilion newPavilion = new Pavilion();
                    newPavilion.IdShoppingCenter = ShoppingCenterID;
                    newPavilion.PovilionNum = tbPavilionNumber.Text;
                    newPavilion.NumberOfFloor = Convert.ToInt32(tbfloor.Text);
                    newPavilion.IdStatusPavilion = (cmbstatus.SelectedItem as StatusPavilion).Id;
                    newPavilion.Square = Convert.ToInt32(tbsquare.Text);
                    newPavilion.CostPerSqm = Convert.ToDecimal(tbprice.Text);
                    newPavilion.ValueAddedRatio = Convert.ToDouble(tbvalueaddedratio.Text);
                    Marinichev619KingITEntities.GetContext().Pavilion.Add(newPavilion);
                    Marinichev619KingITEntities.GetContext().SaveChanges();
                    MessageBox.Show("Павильон создан", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                    this.NavigationService.GoBack();
                }
                catch
                {
                    MessageBox.Show("Ошибка при создании павильона", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
    }
}
