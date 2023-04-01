using System;
using System.Collections.Generic;
using System.ComponentModel;
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

namespace pr30
{
    /// <summary>
    /// Логика взаимодействия для spisoc.xaml
    /// </summary>
    public partial class spisoc : Window
    {
        public spisoc()
        {
            InitializeComponent();
        }

        public object Instance { get; private set; }

        private void Window_Loaded_1(object sender, RoutedEventArgs e)
        {
            
        }

        private Grid GetMaterialList()
        {
            return MaterialList;
        }

        private void Page_Loaded(object sender, RoЫutedEventArgs e, Grid materialList)
        {
            materialList.ItermsSource = App.db.Товары.Take(15).ToList();
        }
    }
}
