<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" MasterPageFile="~/Site1.Master" Inherits="TheKitchenProject.LoginPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
    <div>

        <fieldset style="width:200px">
            <legend>Login</legend>
    <table>
        <tr>
            <th>USERNAME:</th>
            <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                     ControlToValidate="TextBox1" ForeColor="red"
                     ErrorMessage="* Field is mandatory"></asp:RequiredFieldValidator>
            </td>
        </tr>
             <tr>
            <th>PASSWORD:</th>
            <td><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                     ControlToValidate="TextBox2" ForeColor="red"
                     ErrorMessage="* Field is mandatory"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr >
            <td >
                <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />

            </td>  
            <td>
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/UserRegister.aspx">Register Here</asp:LinkButton>
            </td>    
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblMessage" runat="server" ></asp:Label>
            </td>
        </tr>
    </table>
            </fieldset>
        Trinath</div>


    </asp:Content>

