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
    /// Логика взаимодействия для AddSHPage.xaml
    /// </summary>
    public partial class AddSHPage : Page
    {
        ShoppingCenter currentSC = null;
        public AddSHPage(ShoppingCenter malls = null)
        {
            InitializeComponent();
            var statuses = Marinichev619KingITEntities.GetContext().StatusShoppingCenter.ToList();
            scstatus.ItemsSource= statuses;
            var cities = Marinichev619KingITEntities.GetContext().City.ToList();
            sccity.ItemsSource= cities;
            if(malls != null)
            {
                currentSC = malls;
                sctitle.Text = malls.Title;
                scstatus.SelectedItem = malls.StatusShoppingCenter;
                scpavilionnum.Text = malls.PovilionNum.ToString();
                sccity.SelectedItem = malls.City;
                scprice.Text = malls.Price.ToString();
                scvalueaddedratio.Text = malls.ValueAddedRatio.ToString();
                scfloor.Text = malls.Floor.ToString();
                scimage.Text = malls.Image;
                ButtonSave.Content = "Сохранить";
            }
        }

        private void btnSaveNewSC(object sender, RoutedEventArgs e)
        {
            if (String.IsNullOrEmpty(sctitle.Text) || String.IsNullOrEmpty(scvalueaddedratio.Text) || String.IsNullOrEmpty(scprice.Text) || String.IsNullOrEmpty(scfloor.Text) || String.IsNullOrEmpty(scpavilionnum.Text) || String.IsNullOrEmpty(scstatus.Text) || String.IsNullOrEmpty(sccity.Text))
            {
                MessageBox.Show("Заполните все поля", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            if (currentSC != null)
            {
                try
                {
                    currentSC.Title = sctitle.Text;
                    currentSC.IdShoppingCenterStatus = scstatus.SelectedIndex + 1;
                    currentSC.PovilionNum = Convert.ToInt32(scpavilionnum.Text);
                    currentSC.IdCity = sccity.SelectedIndex + 1;
                    if (Convert.ToInt32(scprice.Text) < 0)
                    {
                        MessageBox.Show("Некорректный ввод в поле затрат", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                    currentSC.Price = Convert.ToInt32(scprice.Text);
                    currentSC.ValueAddedRatio = Convert.ToDouble(scvalueaddedratio.Text);
                    currentSC.Floor = Convert.ToInt32(scfloor.Text);
                    currentSC.Image = scimage.Text;
                    Marinichev619KingITEntities.GetContext().SaveChanges();
                    MessageBox.Show("Изменения внесены", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                    this.NavigationService.GoBack();
                }
                catch
                {
                    MessageBox.Show("Ошибка при внесении изименений", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else
            {
                try
                {
                    ShoppingCenter newSC = new ShoppingCenter();
                    newSC.Title = sctitle.Text;
                    newSC.IdShoppingCenterStatus = scstatus.SelectedIndex + 1;
                    newSC.PovilionNum = Convert.ToInt32(scpavilionnum.Text);
                    newSC.IdCity = sccity.SelectedIndex + 1;
                    if (Convert.ToInt32(scprice.Text) < 0)
                    {
                        MessageBox.Show("Некорректный ввод в поле затрат", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                    newSC.Price = Convert.ToInt32(scprice.Text);
                    newSC.ValueAddedRatio = Convert.ToDouble(scvalueaddedratio.Text);
                    newSC.Floor = Convert.ToInt32(scfloor.Text);
                    newSC.Image = scimage.Text;
                    Marinichev619KingITEntities.GetContext().ShoppingCenter.Add(newSC);
                    Marinichev619KingITEntities.GetContext().SaveChanges();
                    MessageBox.Show("Торговый центр создан", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                    this.NavigationService.GoBack();
                }
                catch
                {
                    MessageBox.Show("Ошибка при создании торгового центра", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.GoBack();
        }

        private void scstatus_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if ((scstatus.SelectedItem as StatusShoppingCenter).Id == 3 && currentSC != null)
            {
                MessageBox.Show("Нельзя установить статус \"Удалён\"", "Предупреждение", MessageBoxButton.OK, MessageBoxImage.Warning);
                scstatus.SelectedItem = currentSC.StatusShoppingCenter;
            }

            if ((scstatus.SelectedItem as StatusShoppingCenter).Id == 1 && currentSC != null)
            {
                var newmall = Marinichev619KingITEntities.GetContext().ShoppingCenter.ToList();
                var revPavilion = currentSC.Pavilion.FirstOrDefault(p => p.IdStatusPavilion == 2);
                if (revPavilion != null)
                {
                    MessageBox.Show("Нельзя установить статус \"План\" для этого отеля", "Предупреждение", MessageBoxButton.OK, MessageBoxImage.Warning);
                    scstatus.SelectedItem = currentSC.StatusShoppingCenter;
                }
            }
        }
    }
}