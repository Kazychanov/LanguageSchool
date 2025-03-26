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
  /// Логика взаимодействия для PeoplePage.xaml
  /// </summary>
  public partial class PeoplePage : Page
  {
    int CountRecord;
    int CountPage;
    int CurrentPage = 0;

    List<Client> currentPageList = new List<Client>();
    List<Client> TableList;
    public PeoplePage()
    {
      InitializeComponent();
      TableList = MRLanguageSchoolEntities.GetContext().Client.ToList();
      CountPeopleCBox.SelectedIndex = 0;
      UpdatePeople(); 
    }

    public void UpdatePeople()
    {
      TableList = MRLanguageSchoolEntities.GetContext().Client.ToList();
      ChangePage(0, 0); // Сбрасываем на первую страницу
    }

    private void GenderCBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
    {

    }

    private void SortCBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
    {

    }

    private void IsBirthdayThisMonth_Checked(object sender, RoutedEventArgs e)
    {

    }

    private void DeleteBtn_Click(object sender, RoutedEventArgs e)
    {
      var currentPeopleDelete = (sender as Button).DataContext as Client;

      if (MessageBox.Show("Вы точно хотите удалить клиента?","Внимание!",MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
      {
        try
        {
          if (currentPeopleDelete.VisitCount != 0)
          {
            MessageBox.Show("Невозможно удалить клиента,так как существуют данные об услугах!");
          }
          else
          {
            MRLanguageSchoolEntities.GetContext().Client.Remove(currentPeopleDelete);
            MRLanguageSchoolEntities.GetContext().SaveChanges();

            UpdatePeople();
          }
        }
        catch (Exception ex)
        {
          MessageBox.Show(ex.Message.ToString());
        }
      }
    }

    private void LeftDirBtn_Click(object sender, RoutedEventArgs e)
    {
      ChangePage(1, null);
    }

    private void RightDirBtn_Click(object sender, RoutedEventArgs e)
    {
      ChangePage(2, null);
    }
    private void PageListBox_MouseUp(object sender, MouseButtonEventArgs e)
    {
      ChangePage(0, Convert.ToInt32(PageListBox.SelectedItem.ToString())-1);
    }
    private void ChangePage(int direction, int? selectedPage)
    {
      currentPageList.Clear();
      CountRecord = TableList.Count;

      // Определяем количество записей на странице
      int itemsPerPage = 10; // по умолчанию
      switch (CountPeopleCBox.SelectedIndex)
      {
        case 0: itemsPerPage = 10; break;
        case 1: itemsPerPage = 50; break;
        case 2: itemsPerPage = 200; break;
        case 3: itemsPerPage = CountRecord; break; // "Все"
      }

      // Вычисляем количество страниц
      CountPage = itemsPerPage > 0 ? (int)Math.Ceiling((double)CountRecord / itemsPerPage) : 1;

      bool ifUpdate = true;
      int min;

      if (selectedPage.HasValue)
      {
        if (selectedPage >= 0 && selectedPage < CountPage)
        {
          CurrentPage = (int)selectedPage;
          min = Math.Min(CurrentPage * itemsPerPage + itemsPerPage, CountRecord);
          for (int i = CurrentPage * itemsPerPage; i < min; i++)
          {
            currentPageList.Add(TableList[i]);
          }
        }
      }
      else
      {
        switch (direction)
        {
          case 1: // Назад
            if (CurrentPage > 0)
            {
              CurrentPage--;
              min = Math.Min(CurrentPage * itemsPerPage + itemsPerPage, CountRecord);
              for (int i = CurrentPage * itemsPerPage; i < min; i++)
              {
                currentPageList.Add(TableList[i]);
              }
            }
            else
            {
              ifUpdate = false;
            }
            break;
          case 2: // Вперед
            if (CurrentPage < CountPage - 1)
            {
              CurrentPage++;
              min = Math.Min(CurrentPage * itemsPerPage + itemsPerPage, CountRecord);
              for (int i = CurrentPage * itemsPerPage; i < min; i++)
              {
                currentPageList.Add(TableList[i]);
              }
            }
            else
            {
              ifUpdate = false;
            }
            break;
        }
      }

      if (ifUpdate)
      {
        // Обновляем список страниц
        PageListBox.Items.Clear();
        for (int i = 1; i <= CountPage; i++)
        {
          PageListBox.Items.Add(i);
        }
        PageListBox.SelectedIndex = CurrentPage;

        // Обновляем информацию о записях
        min = Math.Min(CurrentPage * itemsPerPage + itemsPerPage, CountRecord);
        TBCount.Text = $"{CurrentPage * itemsPerPage + 1}-{min}";
        TBAllRecords.Text = $" из {CountRecord}";

        // Ключевое исправление - обновляем источник данных ListView
        PeopleLV.ItemsSource = null; // Сначала очищаем
        PeopleLV.ItemsSource = currentPageList; // Затем устанавливаем новый источник
      }
    }

    private void CountPeopleCBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
    {
      ChangePage(0, 0);
    }
  }
}
