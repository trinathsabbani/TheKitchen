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
    
    public partial class tbl_Category
    {
        public tbl_Category()
        {
            this.tbl_Kitchen = new HashSet<tbl_Kitchen>();
        }
    
        public int Id { get; set; }
        public string Category { get; set; }
    
        public virtual ICollection<tbl_Kitchen> tbl_Kitchen { get; set; }
    }
}
