<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="lab3.Show" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="show" runat="server">
        <div>
            <asp:GridView ID="GridViewClients" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" DataKeyNames="Id" DataSourceID="SqlDataSourceClients" Width="440px" OnSelectedIndexChanged="GridViewClients_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="LastNameClient" HeaderText="Surname" SortExpression="LastNameClient" />
                    <asp:BoundField DataField="FirstNameClient" HeaderText="Name" SortExpression="FirstNameClient" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Adress" HeaderText="Adress" SortExpression="Adress" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceClients" runat="server" ConnectionString="<%$ ConnectionStrings:TradeCompanyDBConnectionString %>" SelectCommand="SELECT * FROM [Clients]" DeleteCommand="Delete from Clients where Id=@Id" InsertCommand="Insert into Clients (LastNameClient, FirstNameClient, Phone, Email, Adress) values (@LastNameClient, @FirstNameClient, @Phone, @Email, @Adress)" UpdateCommand="Update Clients set LastNameClient=@LastNameClient, FirstNameClient=@FirstNameClient, Phone=@Phone, Email=@Email, Adress=@Adress where Id=@Id">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="GridViewClients" Name="Id" PropertyName="SelectedValue" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBoxSurname" Name="LastNameClient" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TextBoxName" Name="FirstNameClient" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TextBoxPhone" Name="Phone" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TextBoxEmail" Name="Email" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TextBoxAdress" Name="Adress" PropertyName="Text" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="GridViewClients" Name="LastNameClient" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridViewClients" Name="FirstNameClient" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridViewClients" Name="Phone" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridViewClients" Name="Email" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridViewClients" Name="Adress" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridViewClients" Name="Id" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Button ID="ButtonAddClient" runat="server" Text="Add client" Width="82px" OnClick="ButtonAddClient_Click" />
            <asp:Button ID="ButtonEditClient" runat="server" style="margin-left: 66px" Text="Edit client" Width="99px" OnClick="ButtonEditClient_Click" />
            <asp:Button ID="ButtonDeleteClient" runat="server" style="margin-left: 60px" Text="Delete client" OnClick="ButtonDeleteClient_Click" />
            <br />
            <br />
            <asp:Panel ID="PanelAddClient" runat="server" Visible="False" Width="365px">
                Surname:<asp:TextBox ID="TextBoxSurname" runat="server"></asp:TextBox>
                <br />
                Name:<asp:TextBox ID="TextBoxName" runat="server" style="margin-left: 24px"></asp:TextBox>
                <br />
                Phone:<asp:TextBox ID="TextBoxPhone" runat="server" style="margin-left: 22px"></asp:TextBox>
                <br />
                E-mail:<asp:TextBox ID="TextBoxEmail" runat="server" style="margin-left: 16px"></asp:TextBox>
                <br />
                Adress:<asp:TextBox ID="TextBoxAdress" runat="server" style="margin-left: 15px"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="ButtonAddC" runat="server" Text="Add" Width="101px" OnClick="ButtonAddC_Click" />
                <asp:Button ID="ButtonCancelC" runat="server" style="margin-left: 128px" Text="Cancel" OnClick="ButtonCancelC_Click" Width="92px" />
            </asp:Panel>
            <br />
            <br />
            <asp:GridView ID="GridViewOrders" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceOrders" Width="441px">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="IdClient" HeaderText="Id Client" SortExpression="IdClient" ReadOnly="True" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceOrders" runat="server" ConnectionString="<%$ ConnectionStrings:TradeCompanyDBConnectionString %>" InsertCommand="Insert into Orders(IdClient, Description, Price) values (@IdClient, @Description, @Price)" SelectCommand="SELECT * FROM [Orders] WHERE ([IdClient] = @IdClient)" DeleteCommand="Delete from Orders where Id=@Id" UpdateCommand="Update Orders set IdClient=@IdClient, Description=@Discription, Price=@Price where Id=@Id">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="GridViewOrders" Name="Id" PropertyName="SelectedValue" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="GridViewClients" Name="IdClient" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="TextBoxDescrip" Name="Description" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TextBoxPrice" Name="Price" PropertyName="Text" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewClients" Name="IdClient" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="GridViewClients" Name="IdClient" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridViewOrders" Name="Discription" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridViewOrders" Name="Price" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridViewOrders" Name="Id" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Panel ID="PanelButOrder" runat="server" Visible="False">
                <asp:Button ID="ButtonAddOrder" runat="server" Text="Add order" OnClick="ButtonAddOrder_Click" />
                <asp:Button ID="ButtonEditOrder" runat="server" OnClick="ButtonEditOrder_Click" style="margin-left: 44px" Text="Edit order" />
                <asp:Button ID="ButtonDeleteOrder" runat="server" OnClick="ButtonDeleteOrder_Click" style="margin-left: 55px" Text="Delete order" />
            </asp:Panel>
            <br />
            <asp:Panel ID="PanelAddOrder" runat="server" Visible="False" Width="295px">
                Description:<asp:TextBox ID="TextBoxDescrip" runat="server" style="margin-left: 21px"></asp:TextBox>
                <br />
                Price:
                <asp:TextBox ID="TextBoxPrice" runat="server" style="margin-left: 67px"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="ButtonAdd" runat="server" Text="Add" Width="111px" OnClick="ButtonAdd_Click" />
                <asp:Button ID="ButtonCanel" runat="server" style="margin-left: 90px" Text="Cancel" OnClick="ButtonCanel_Click" />
            </asp:Panel>
        </div>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
