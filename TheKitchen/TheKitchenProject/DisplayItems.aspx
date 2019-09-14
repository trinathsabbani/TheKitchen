<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DisplayItems.aspx.cs" MasterPageFile="~/Site1.Master" Inherits="TheKitchenProject.DisplayItems" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div>
        <asp:Label ID="userlbl" runat="server" ></asp:Label><br />
      Select Category:  <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="View" OnClick="Button1_Click" />
        <%--<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="DropDownList1" ValueToCompare="-1" Operator="GreaterThan"
            ErrorMessage="* select any item"></asp:CompareValidator>--%>
        <br />
        <div class="sample">
        <asp:GridView ID="GridView1" runat="server"></asp:GridView><br />
     <span > Select Item: </span>  <asp:DropDownList ID="DropDownList2" runat="server" ></asp:DropDownList>
      <span > Select Quantity: </span> <asp:DropDownList ID="DropDownList3" runat="server" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" AutoPostBack="true" >
          <asp:ListItem Value="-1" Text="--select Quantity---"></asp:ListItem>
          <asp:ListItem Value="0" Text="1"></asp:ListItem>
          <asp:ListItem Value="1" Text="2"></asp:ListItem>
          <asp:ListItem Value="2" Text="3"></asp:ListItem>
                      </asp:DropDownList>
            <br />
            <asp:Button ID="Button2" runat="server" Text="Add to cart" OnClick="Button2_Click" />&nbsp &nbsp&nbsp
            <asp:Button ID="Button3" runat="server" Text="View cart" OnClick="Button3_Click" /><br />
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </div>
    </div>
    </asp:Content>

