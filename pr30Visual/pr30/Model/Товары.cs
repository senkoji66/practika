//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace pr30.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Товары
    {
        public double id_товара { get; set; }
        public string Артикул { get; set; }
        public Nullable<double> id_наименования { get; set; }
        public string Единица_измерения___ { get; set; }
        public Nullable<double> Стоимость { get; set; }
        public Nullable<double> Размер_максимально_возможной_скидки { get; set; }
        public string Производитель { get; set; }
        public string Поставщик { get; set; }
        public Nullable<double> id_категории { get; set; }
        public Nullable<double> Действующая_скидка { get; set; }
        public Nullable<double> Кол_во_на_складе { get; set; }
        public string Описание { get; set; }
        public string Изображение { get; set; }
    }
}
