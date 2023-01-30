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
using System.Windows.Shapes;

namespace Marinichev619KingIT
{
    /// <summary>
    /// Логика взаимодействия для WindowCapcha.xaml
    /// </summary>
    public partial class WindowCapcha : Window
    {
        int num;
        bool capchaСorrect = false;

        public WindowCapcha()
        {
            InitializeComponent();
            GenerateCaptcha();
        }

        private void GenerateCaptcha()
        {
            Random rand = new Random();
            num = rand.Next(-100, 101);
            tbNum.Text = $"Введите число: {num}";
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            e.Cancel = !capchaСorrect;
        }

        private void btnCheck_Click(object sender, RoutedEventArgs e)
        {
            if (!String.IsNullOrEmpty(tbCapcha.Text) && Convert.ToInt32(tbCapcha.Text) == num)
            {
                capchaСorrect = true;
                this.Owner.Focus();
                this.Owner.IsEnabled = true;
                this.Close();
            }
            else
            {
                MessageBox.Show("Капча введена не правильно", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                GenerateCaptcha();
            }
        }
    }
}
