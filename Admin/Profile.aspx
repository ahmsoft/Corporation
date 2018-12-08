<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="false" CodeFile="Profile.aspx.vb" Inherits="Admin_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="IDU" DataSourceID="SqlDataSource1" Height="50px" Width="100%" style="margin-right:10px;margin-left:10px;">
        <EmptyDataRowStyle BackColor="#FF9900" />
        <Fields>
            <asp:BoundField DataField="IDU" HeaderText=" شماره کاربری" InsertVisible="False" ReadOnly="True" SortExpression="IDU" />
            <asp:BoundField DataField="Name" HeaderText=" نام" SortExpression="Name" />
            <asp:BoundField DataField="Family" HeaderText=" نام خانوادگی" SortExpression="Family" />
            <asp:BoundField DataField="Username" HeaderText=" نام کاربری" SortExpression="Username" />
            <asp:CheckBoxField DataField="IsMan" HeaderText=" مرد هستم" SortExpression="IsMan" />
            <asp:BoundField DataField="Birthday" HeaderText=" تاریخ تولد" SortExpression="Birthday" />
            <asp:BoundField DataField="SchoolName" HeaderText=" نام آموزشگاه" SortExpression="SchoolName" />
            <asp:BoundField DataField="Email" HeaderText=" پست الکترونیکی" SortExpression="Email" />
            <asp:BoundField DataField="Phone" HeaderText=" تلفن" SortExpression="Phone" />
            <asp:BoundField DataField="Password" HeaderText=" کلمه عبور" SortExpression="Password" />
            <asp:BoundField DataField="Supervisor" HeaderText=" راهبری" SortExpression="Supervisor" />
            <asp:BoundField DataField="Photo" HeaderText=" تصویر" SortExpression="Photo" />
            <asp:BoundField DataField="No1" HeaderText=" فیلد اضافی1" SortExpression="No1" />
            <asp:BoundField DataField="No2" HeaderText=" فیلد اضافی2" SortExpression="No2" />
            <asp:BoundField DataField="No3" HeaderText=" فیلد اضافی3" SortExpression="No3" />
            <asp:BoundField DataField="No4" HeaderText=" فیلد اضافی4" SortExpression="No4" />
            <asp:BoundField DataField="No5" HeaderText=" فیلد اضافی5" SortExpression="No5" />
            <asp:BoundField DataField="No6" HeaderText=" فیلد اضافی6" SortExpression="No6" />
            <asp:BoundField DataField="Message" HeaderText=" پیام" SortExpression="Message" />
            <asp:CheckBoxField DataField="Active" HeaderText=" فعال" SortExpression="Active" />
            <asp:BoundField DataField="Request" HeaderText=" درخواست" SortExpression="Request" />
            <asp:CommandField EditText="ویرایش" ControlStyle-Width="100%" CancelText="انصراف" UpdateText="ذخیره" ShowEditButton="True">
            <ControlStyle CssClass="btn btn-success btn-xs" />
            </asp:CommandField>
        </Fields>
        <RowStyle BorderColor="#336600" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AHMDBConnectionString %>" SelectCommand="SELECT * FROM [User] WHERE ([Supervisor] = @Supervisor)" UpdateCommand="UPDATE [User] SET [Name]=@Name,[Family]=@Family,[Username]=@Username,[Email]=@Email,[Password]=@Password,[SchoolName]=@SchoolName,[Photo]=@Photo,[Phone]=@Phone,[Message]=@Message,[Supervisor]=@Supervisor,[No1]=@No1,[No2]=@No2,[No3]=@No3,[No4]=@No4,[No5]=@No5,[No6]=@No6,[Request]=@Request,[Active]=@Active,[IsMan]=@IsMan,[Birthday]=@Birthday WHERE [IDU]=@IDU">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="Supervisor" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" />
            <asp:Parameter Name="Family" />
            <asp:Parameter Name="Username" />
            <asp:Parameter Name="Email" />
            <asp:Parameter Name="Password" />
            <asp:Parameter Name="SchoolName" />
            <asp:Parameter Name="Photo" />
            <asp:Parameter Name="Phone" />
            <asp:Parameter Name="Message" />
            <asp:Parameter Name="Supervisor" />
            <asp:Parameter Name="No1" />
            <asp:Parameter Name="No2" />
            <asp:Parameter Name="No3" />
            <asp:Parameter Name="No4" />
            <asp:Parameter Name="No5" />
            <asp:Parameter Name="No6" />
            <asp:Parameter Name="Request" />
            <asp:Parameter Name="Active" />
            <asp:Parameter Name="IsMan" />
            <asp:Parameter Name="Birthday" />
            <asp:Parameter Name="IDU" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

