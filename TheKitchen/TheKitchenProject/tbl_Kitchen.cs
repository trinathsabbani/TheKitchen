//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TheKitchenProject
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbl_Kitchen
    {
        public int Id { get; set; }
        public string Description { get; set; }
        public string Ingredients { get; set; }
        public string Specialnotes { get; set; }
        public Nullable<int> CategoryId { get; set; }
        public Nullable<int> Price { get; set; }
    
        public virtual tbl_Category tbl_Category { get; set; }
    }
}