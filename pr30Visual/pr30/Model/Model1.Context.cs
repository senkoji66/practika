﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class bigEntities2 : DbContext
    {
        public bigEntities2()
            : base("name=bigEntities2")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<Заказ> Заказ { get; set; }
        public virtual DbSet<Категории> Категории { get; set; }
        public virtual DbSet<Наименование> Наименование { get; set; }
        public virtual DbSet<Пользователи_> Пользователи_ { get; set; }
        public virtual DbSet<Пункт_выдачи> Пункт_выдачи { get; set; }
        public virtual DbSet<Роли_> Роли_ { get; set; }
        public virtual DbSet<Товары> Товары { get; set; }
    }
}