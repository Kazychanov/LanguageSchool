using Microsoft.Win32;
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

namespace LanguageSchoolTR14WR
{
  /// <summary>
  /// Логика взаимодействия для AddEditPeoplePage.xaml
  ///// </summary>
  public partial class AddEditPeoplePage : Page
  {
    private Client currentPeople = new Client();
    public AddEditPeoplePage(Client selectedPeople)
    {
      InitializeComponent();
      if (selectedPeople != null)
      {
        currentPeople = selectedPeople;
      }
      DataContext = currentPeople;

      if (currentPeople.GenderCode == "м")
      {
        MaleRBtn.IsChecked = true;
      }
      else if (currentPeople.GenderCode == "ж")
      {
        FemaleRBtn.IsChecked = true;
      }
      if (currentPeople.ID == 0)
      {
        IDTBlock.Visibility = Visibility.Hidden;
        IDTBox.Visibility = Visibility.Hidden;
      }
    }

    private void SaveBtn_Click(object sender, RoutedEventArgs e)
    {
      StringBuilder errors = new StringBuilder();

      if (string.IsNullOrWhiteSpace(currentPeople.LastName))
        errors.AppendLine("Укажите фамилию клиента");
      if (string.IsNullOrWhiteSpace(currentPeople.FirstName))
        errors.AppendLine("Укажите имя клиента");
      if (string.IsNullOrWhiteSpace(currentPeople.Patronymic))
        errors.AppendLine("Укажите отчество клиента");
      if (string.IsNullOrWhiteSpace(BirthdayDPicker.Text))
        errors.AppendLine("Укажите дату рождения клиента");
      if (string.IsNullOrWhiteSpace(currentPeople.Email))
      {
        errors.AppendLine("Укажите email клиента");
      }
      else
      {
        // Примитивная проверка email
        if (!System.Text.RegularExpressions.Regex.IsMatch(currentPeople.Email, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
        {
          errors.AppendLine("Укажите корректный email клиента");
        }
      }
      if (string.IsNullOrWhiteSpace(currentPeople.Phone))
        errors.AppendLine("Укажите номер клиента");
      else
      {
        string ph = currentPeople.Phone.Replace("(", "").Replace(")", "").Replace(" ", "").Replace("-", "").Replace("+", "");
        if (((ph[1] == '9' || ph[1] == '4' || ph[1] == '8') && ph.Length != 11 && (ph[0] == '7' || ph[0] == '8'))
            || (ph[1] == '3' && ph.Length != 12) && (ph[0] == '7' || ph[0] == '8'))
          errors.AppendLine("Укажите правильно телефон клиента");
      }
      currentPeople.Birthday = Convert.ToDateTime(BirthdayDPicker.Text);
      if (FemaleRBtn.IsChecked == true)
      {
        currentPeople.GenderCode = "ж";
      }
      else
      {
        currentPeople.GenderCode = "м";
      }


      if (errors.Length > 0)
      {
        MessageBox.Show(errors.ToString());
        return;
      }

      if (currentPeople.ID == 0)
      {
        MRLanguageSchoolEntities.GetContext().Client.Add(currentPeople);
      }
      try
      {
        MRLanguageSchoolEntities.GetContext().SaveChanges();
        MessageBox.Show("Информация сохранена");
        Manager.MainFrame.GoBack();
      }
      catch (Exception ex)
      {
        MessageBox.Show(ex.Message.ToString());
      }


    }

    private void ChangePhoto_Click(object sender, RoutedEventArgs e)
    {
      OpenFileDialog myOpenFileDialog = new OpenFileDialog();
      if (myOpenFileDialog.ShowDialog() == true)
      {
        currentPeople.PhotoPath = myOpenFileDialog.FileName;
        PhotoPeople.Source = new BitmapImage(new Uri(myOpenFileDialog.FileName));
      }
    }
  }
}
