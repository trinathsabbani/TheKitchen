﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Objects;
    using System.Data.Objects.DataClasses;
    using System.Linq;
    
    public partial class KitchenDBcontext : DbContext
    {
        public KitchenDBcontext()
            : base("name=KitchenDBcontext")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<tbl_Category> tbl_Category { get; set; }
        public DbSet<tbl_Kitchen> tbl_Kitchen { get; set; }
        public DbSet<tbl_Login> tbl_Login { get; set; }
    
        public virtual ObjectResult<Sp_Display_Result> Sp_Display(Nullable<int> categoryId)
        {
            var categoryIdParameter = categoryId.HasValue ?
                new ObjectParameter("CategoryId", categoryId) :
                new ObjectParameter("CategoryId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Sp_Display_Result>("Sp_Display", categoryIdParameter);
        }
    
        public virtual ObjectResult<Sp_Select_Result> Sp_Select(Nullable<int> catid)
        {
            var catidParameter = catid.HasValue ?
                new ObjectParameter("catid", catid) :
                new ObjectParameter("catid", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Sp_Select_Result>("Sp_Select", catidParameter);
        }
    
        public virtual ObjectResult<Sp_Price_Result> Sp_Price(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Sp_Price_Result>("Sp_Price", idParameter);
        }
    
        public virtual ObjectResult<string> SP_Login(string username, string password)
        {
            var usernameParameter = username != null ?
                new ObjectParameter("username", username) :
                new ObjectParameter("username", typeof(string));
    
            var passwordParameter = password != null ?
                new ObjectParameter("password", password) :
                new ObjectParameter("password", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("SP_Login", usernameParameter, passwordParameter);
        }
    }
}
