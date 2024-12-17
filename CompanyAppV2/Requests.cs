//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CompanyAppV2
{
    using System;
    using System.Collections.Generic;
    
    public partial class Requests
    {
        public int ID { get; set; }
        public Nullable<System.DateTime> Date { get; set; }
        public Nullable<int> EquipmentID { get; set; }
        public Nullable<int> FaultTypeID { get; set; }
        public string ProblemDescription { get; set; }
        public Nullable<int> UserID { get; set; }
        public Nullable<int> StatusID { get; set; }
        public Nullable<System.DateTime> DeadLine { get; set; }
        public Nullable<int> DaysSpent { get; set; }
        public Nullable<int> EmployeeID { get; set; }
    
        public virtual Equipment Equipment { get; set; }
        public virtual FaultsTypes FaultsTypes { get; set; }
        public virtual Status Status { get; set; }
        public virtual Users Users { get; set; }
        public virtual Staff Staff { get; set; }
    }
}