//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Marinichev619KingIT
{
    using System;
    using System.Collections.Generic;
    
    public partial class Pavilion
    {
        public int Id { get; set; }
        public Nullable<int> IdShoppingCenter { get; set; }
        public string PovilionNum { get; set; }
        public Nullable<int> NumberOfFloor { get; set; }
        public Nullable<int> IdStatusPavilion { get; set; }
        public Nullable<int> Square { get; set; }
        public Nullable<decimal> CostPerSqm { get; set; }
        public Nullable<double> ValueAddedRatio { get; set; }
    
        public virtual ShoppingCenter ShoppingCenter { get; set; }
        public virtual StatusPavilion StatusPavilion { get; set; }
    }
}
