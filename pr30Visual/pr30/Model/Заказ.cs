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
    
    public partial class Заказ
    {
        public double id_заказа { get; set; }
        public Nullable<System.DateTime> Дата_заказа { get; set; }
        public Nullable<System.DateTime> Дата_доставки { get; set; }
        public Nullable<double> Пункт_выдачи { get; set; }
        public double id_покупателя { get; set; }
        public Nullable<double> Код_для_получения { get; set; }
        public Nullable<double> Статус_заказа { get; set; }
    }
}
