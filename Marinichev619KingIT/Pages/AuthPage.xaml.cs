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
    /// Логика взаимодействия для AuthPage.xaml
    /// </summary>
    public partial class AuthPage : Page
    {
        public AuthPage()
        {
            InitializeComponent();
        }

        public static int faultCounter = 0;

        public void authBtn_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(loginUser.Text) || string.IsNullOrEmpty(passwordUser.Password))
            {
                MessageBox.Show("Введите логин и пароль");
                return;
            }
            var userInfo = Marinichev619KingITEntities.GetContext().Employee.AsNoTracking().FirstOrDefault(u => u.Login == loginUser.Text && u.Password == passwordUser.Password);
            if (userInfo == null)
            {
                MessageBox.Show("Пользователь не найден");
                faultCounter++;
                if (faultCounter == 3)
                {
                    ShowCaptcha();
                    faultCounter = 0;
                }
            }
            else
            {
                faultCounter = 0;
                MessageBox.Show("Пользователь успешно найден");
                faultCounter = 0;
                switch (userInfo.IdRole)
                {
                    case 1:
                        break;
                    case 2:
                        break;
                    case 3:
                        NavigationService.Content = new ManagerCPage();
                        break;
                    case 4:
                        MessageBox.Show("Пользователь удалён");
                        break;
                }
            }
        }
        public int i = 0;
        private void loginUser_TextChanged(object sender, TextChangedEventArgs e)
        {

            i++;
            if (i == 1)
            {
                loginUser.Text = loginUser.Text[0].ToString().ToUpper();
            }
            else
            {
                loginUser.SelectionStart = loginUser.Text.Length;
            }
            if (loginUser.Text.Length == 0)
            {
                i = 0;
            }
        }

        private void ShowCaptcha()
        {
            MessageBox.Show("Вы ошиблись слишком много раз", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
            WindowCapcha captcha = new WindowCapcha();
            captcha.Owner = Window.GetWindow(this);
            captcha.Owner.IsEnabled = false;
            captcha.Show();
        }
    }
}
