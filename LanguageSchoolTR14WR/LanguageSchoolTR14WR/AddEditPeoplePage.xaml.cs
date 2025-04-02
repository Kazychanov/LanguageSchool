using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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

      if (currentPeople.GenderCode == "ж")
      {
        FemaleRBtn.IsChecked = true;
      }
      else
      {
        MaleRBtn.IsChecked = true;
      }

      if (currentPeople.ID == 0)
      {
        IDTBlock.Visibility = Visibility.Hidden;
        IDTBox.Visibility = Visibility.Hidden;
        currentPeople.Birthday = DateTime.Now;
      }
    }

    private void SaveBtn_Click(object sender, RoutedEventArgs e)
    {
      StringBuilder errors = new StringBuilder();

      if (string.IsNullOrWhiteSpace(currentPeople.LastName))
        errors.AppendLine("Укажите фамилию клиента");
      if (currentPeople.LastName.Count() > 50)
        errors.AppendLine("Превышен лимит символов фамилии");
      if (string.IsNullOrWhiteSpace(currentPeople.FirstName))
        errors.AppendLine("Укажите имя клиента");
      if (currentPeople.FirstName.Count() > 50)
        errors.AppendLine("Превышен лимит символов имени");
      if (string.IsNullOrWhiteSpace(currentPeople.Patronymic))
        errors.AppendLine("Укажите отчество клиента");
      if (currentPeople.Patronymic.Count() > 50)
        errors.AppendLine("Превышен лимит символов отчества");
      if (string.IsNullOrWhiteSpace(BirthdayDPicker.Text))
        errors.AppendLine("Укажите дату рождения клиента");

      if (currentPeople.RegistrationDate != null)
      {
        currentPeople.RegistrationDate = DateTime.Now;
      }

      if (string.IsNullOrWhiteSpace(currentPeople.Email))
      {
        errors.AppendLine("Укажите email клиента");
      }
      else
      {
        if (!Regex.IsMatch(currentPeople.Email, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
        {
          errors.AppendLine("Укажите корректный email клиента");
        }
      }

      if (string.IsNullOrWhiteSpace(currentPeople.Phone))
        errors.AppendLine("Укажите номер клиента");
      else
      {
        string cleanedNumber = Regex.Replace(currentPeople.Phone, @"[^\d+]", "");
        if (!Regex.IsMatch(cleanedNumber, @"^(\+7|7|8)?[\d]{10}$"))
        {
          errors.AppendLine("Укажите корректный телефон клиента");
        }
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
