<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="OrderManagement.aspx.vb" Inherits="Admin_OrderManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js"></asp:ScriptReference>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js"></asp:ScriptReference>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js"></asp:ScriptReference>
        </Scripts>
    </telerik:RadScriptManager>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <asp:SqlDataSource ID="DataSourceOrder" runat="server" ConnectionString="<%$ ConnectionStrings:AHMDBConnectionString %>" SelectCommand="SELECT * FROM [Order]" DeleteCommand="DELETE FROM [Order] Where [IDO]=@IDO
DELETE FROM [Client] WHERE [IDO]=@IDO">
        <DeleteParameters>
            <asp:Parameter Name="IDO" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <div class="text-center">
        <asp:GridView ID="OrderView" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="DataSourceOrder" Width="100%" DataKeyNames="IDO" AllowPaging="True">
            <Columns>
                <asp:CommandField ButtonType="Button" SelectText="انتخاب" ShowSelectButton="True" DeleteText="حذف">
                    <ControlStyle CssClass="btn btn-success btn-xs" Width="100%" />
                </asp:CommandField>
                <asp:BoundField DataField="NameAndFamily" HeaderText="نام و نام خانوادگی" SortExpression="NameAndFamily" />
                <asp:BoundField DataField="SiteSubject" HeaderText="موضوع" SortExpression="SiteSubject" />
                <asp:CommandField ButtonType="Button" DeleteText="حذف" ShowDeleteButton="True" HeaderText="حذف">
                    <ControlStyle CssClass="btn btn-danger btn-xs" Width="100%" />
                </asp:CommandField>
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
    </div>
    <section class="content">

        <!-- SELECT2 EXAMPLE -->

        <div class="box box-info collapsed-box">
            <div class="box-header with-border">
                <h3 class="box-title">اطلاعات اولیه </h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6">
                        <!-- /.form-group -->
                        <br />
                        <label for="txtNameAndFamily">نام و نام خانوادگی</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-address-book"></i>
                            </div>
                            <asp:TextBox ID="txtNameAndFamily" placeholder="به عنوان مثال: امیرحسن مروجی." runat="server" type="Text" class="form-control" data-inputmask='"mask": ""' data-mask />
                        </div>
                        <!-- /.form-group -->
                        <br />
                        <label for="txtTel">تلفن ثابت</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <asp:TextBox ID="txtTel" placeholder="به عنوان مثال: 05135026982" runat="server" type="text" class="form-control" data-inputmask='"mask": "09999999999"' data-mask />
                        </div>
                        <br />
                        <!-- /.input group -->
                        <label for="txtMobile">تلفن همراه</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-mobile"></i>
                            </div>
                            <asp:TextBox ID="txtMobile" placeholder="به عنوان مثال: 09391815029" runat="server" type="text" class="form-control" data-inputmask='"mask": "09999999999"' data-mask />
                        </div>
                        <!-- /.form-group -->


                    </div>
                    <!-- /.col -->


                    <div class="col-md-6">
                        <br />
                        <!-- /.input group -->
                        <label for="txtEmail">پست الکترونیک</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-at"></i>
                            </div>
                            <asp:TextBox ID="txtEmail" placeholder="به عنوان مثال: ah.moravveji.edu@gmail.com" runat="server" type="Email" class="form-control" data-inputmask='"mask": ""' data-mask />
                        </div>
                        <!-- /.form-group -->
                        <br />
                        <label for="txtJob">زمینه فعالیت</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-cc-jcb"></i>
                            </div>
                            <asp:TextBox ID="txtJob" placeholder="به عنوان مثال: تولیدی کفش." runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                        </div>
                        <!-- /.form-group -->
                        <br />
                        <label for="txtAddress">آدرس</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-location-arrow"></i>
                            </div>
                            <asp:TextBox ID="txtAddress" placeholder="به عنوان مثال: مشهد - خیابان صیاد شیرازی - صیاد شیرازی 18 - پلاک 32 واحد 3." runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                        </div>
                        <!-- /.input group -->
                    </div>
                    <!-- /.col -->
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                        <asp:Button ID="btnUpdateOrder" runat="server" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 btn btn-primary" Text="ذخیره تغییرات" />

                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
                <span>از طریق این اطلاعات ما با شما تماس خواهیم گرفت  </span>
            </div>
        </div>

        <div class="box box-success collapsed-box">
            <div class="box-header with-border">
                <h3 class="box-title">اطلاعات تکمیلی </h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6">
                        <!-- /.form-group -->
                        <br />
                        <div class="form-group">
                            <label for="rdoNewDesign">
                                آیا این اولین وب سایت شما است یا قصد طراحی مجدد وب سایت فعلی خود را دارید؟
                            </label>
                            <select id="rdoNewDesign" runat="server" class="form-control select2 text-center" style="width: 100%;">
                                <option selected="selected">طراحی جدید</option>
                                <option>طراحی مجدد</option>
                            </select>
                        </div>
                        <label for="txtNameFa">نام سایت به فارسی</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-flag-checkered"></i>
                            </div>
                            <asp:TextBox ID="txtNameFa" placeholder="به عنوان مثال: آریا سافت." runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                        </div>
                        <br />
                        <label for="txtNameEn">نام سایت به انگلیسی:</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-flag-checkered"></i>
                            </div>
                            <asp:TextBox ID="txtNameEn" placeholder="به عنوان مثال: AriyaSoft." runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                        </div>
                        <br />
                        <label for="txtSubject">موضوع سایت:</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-comments-o"></i>
                            </div>
                            <asp:TextBox ID="txtSubject" placeholder="به عنوان مثال: طراحی سایت." runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                        </div>
                        <br />
                        <!-- /.input group -->
                        <label for="txtCustomers">کدام گروه از اقشار جامعه منتظر بازدید از وب سایت شما هستند؟</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-users"></i>
                            </div>
                            <asp:TextBox ID="txtCustomers" placeholder="به عنوان مثال: شاغلین، جوانان، متخصصین، دانشجویان، تحصیل کرده، عموم مردم، افراد خاص." runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                        </div>
                        <!-- /.form-group -->
                        <br />
                        <!-- /.input group -->
                        <label for="txtCompetition">دو یا چند نمونه از رقبای کاری خود را نام ببرید:</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-opencart"></i>
                            </div>
                            <asp:TextBox ID="txtCompetition" placeholder="به عنوان مثال: نام برند یا آدرس وب سایت." runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                        </div>
                        <br />
                        <!-- /.form-group -->
                        <label for="txtService">چه خدماتی قرار است در اختیار مشتریان شما قرار بگیرد؟</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-server"></i>
                            </div>
                            <asp:TextBox ID="txtService" placeholder="به عنوان مثال: پردازش سفارشات مشتری." runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                        </div>
                        <!-- /.form-group -->
                        <!-- /.form-group -->
                        <br />
                        <label for="txtRequirements">دلایل نیاز شما به یک وب سایت چیست؟</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-cab"></i>
                            </div>
                            <asp:TextBox ID="txtRequirements" placeholder="به عنوان مثال: معرفی کسب و کار و افزایش فروش ازطریق سفارشات آنلاین." runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                        </div>
                        <!-- /.input group -->
                        <br />
                        <label for="txtSampleSite">چند وب سایت که از نظر گرافیک و محتوایی می پسندید:</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-sitemap"></i>
                            </div>
                            <asp:TextBox ID="txtSampleSite" placeholder="به عنوان مثال: وب سایت شرکت طراحی سایت کاسپید wwww.Kaspid.com" Style="z-index: 0;" runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                        </div>
                        <!-- /.input group -->

                        <!-- /.form-group -->

                    </div>
                    <!-- /.col -->


                    <div class="col-md-6">
                        <br />
                        <div class="form-group">
                            <label for="txtSuggestedCost">زمان تحویل گرفتن وب سایت و هزینه پیشنهادی خود را مشخص نمایید:</label>
                            <div class="input-group date">
                                <div class="input-group-addon">
                                    <i class="fa fa-clock-o"></i>
                                </div>
                                <asp:TextBox runat="server" type="text" ID="tarikh" class="form-control pull-right" />
                                <asp:TextBox runat="server" type="text" ID="txtSuggestedCost" placeholder="هزینه پیشنهادی شما" class="form-control pull-right" data-inputmask='"mask": "تومان 999999999999"' data-mask />
                            </div>
                            <!-- /.input group -->
                            <!-- /.form-group -->
                            <br />
                            <label for="txtPurposeExistingSite">چه انتظاراتی از داشتن وب سایت دارید؟</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-eye"></i>
                                </div>
                                <asp:TextBox ID="txtPurposeExistingSite" placeholder="به عنوان مثال: نمایش دادن محصولات و نمونه کارهای کسب و کار." Style="z-index: 0;" runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                            </div>
                            <!-- /.form-group -->
                            <br />
                            <label for="txtPossibilities">چه امکاناتی برای وب سایت خود در نظر گرفته اید؟</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-coffee"></i>
                                </div>
                                <asp:TextBox ID="txtPossibilities" placeholder="به عنوان مثال: نمایش محصولات، خرید آنلاین، مدیریت محتوا، گالری تصاویر. " Style="z-index: 0;" runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                            </div>
                            <!-- /.input group -->
                            <!-- /.form-group -->
                            <br />
                            <label for="txtStyle">کمی در مورد رنگ و گرافیک دلخواه خود توضیح دهید:</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-th-large"></i>
                                </div>
                                <asp:TextBox ID="txtStyle" placeholder="به عنوان مثال: رنگ پس زمینه سفید و رنگ قالب سبز." Style="z-index: 0;" runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                            </div>
                            <!-- /.input group -->
                            <!-- /.form-group -->
                            <br />
                            <label for="txtAdvice">هر ایده و طرحی (واقعی یا تخیلی) در ذهن خود دارید در این قسمت وارد کنید. حتما نظر شما در حد توان عملی خواهد شد.</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-commenting"></i>
                                </div>
                                <asp:TextBox ID="txtAdvice" placeholder="به عنوان مثال: افزایش بازدید از وب سایت." runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                            </div>
                            <!-- /.input group -->
                            <!-- /.form-group -->
                            <br />
                            <label for="txtDescription">توضیحات:</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-pencil-square-o"></i>
                                </div>
                                <asp:TextBox ID="txtDescription" placeholder="به عنوان مثال: حرف‌های نا گفته." runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                            </div>
                            <!-- /.input group -->
                            <br />
                            <div class="form-group">
                                <label for="rdoNewDesign">
                                    مشتری بودن
                                </label>
                                <select id="drpActiveClient" runat="server" class="form-control select2 text-center" style="width: 100%;">
                                    <option selected="selected">غیرفعال</option>
                                    <option>فعال</option>
                                </select>
                            </div>
                        </div>
                        <!-- /.col -->
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                                <asp:Button ID="btnUpdateOrder1" runat="server" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 btn btn-primary" Text="ذخیره تغییرات" />

                            </div>
                        </div>

                    </div>
                    <!-- /.row -->

                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <span>با ورود این اطلاعات مارا در طراحی آنچه میخواهید کمک می‌کنید </span>
                </div>
            </div>

        </div>

        <div class="box box-default collapsed-box" runat="server" id="frmProgress" visible="false">
            <div class="box-header with-border">
                <h3 class="box-title">گزارش پیشرفت پروژه </h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <div class="form-group col-md-12">
                        <label for="txtMessage" class="col-md-1 control-label" style="width: 100%;">گزارش عملکرد:</label>
                        <div class="col-md-12">
                            <telerik:RadEditor ID="txtSPL" runat="server" Height="100%" Width="100%" Skin="Bootstrap"></telerik:RadEditor>
                        </div>
                    </div>

                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                        <asp:Button ID="btnUpdateOrder2" runat="server" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 btn btn-primary" Text="ذخیره تغییرات" />

                    </div>
                </div>
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
                <span>از طریق این اطلاعات مشتری از پیشرفت پروژه خود آگاه خواهد شد.</span>
            </div>
        </div>

        <div class="box box-primary collapsed-box" runat="server" id="frmClientInfo" visible="false">
            <div class="box-header with-border">
                <h3 class="box-title">اطلاعات حساب مشتری </h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6">
                        <!-- /.form-group -->
                        <br />
                        <!-- /.input group -->
                        <label for="txtUsername">نام کاربری</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-at"></i>
                            </div>
                            <asp:TextBox ID="txtUsername" placeholder="نام کاربری به عنوان مثال: ah.moravveji.edu@gmail.com" runat="server" type="text" class="form-control" />
                        </div>
                        <!-- /.form-group -->
                        <br />
                        <!-- /.input group -->
                        <label for="txtPassword">کلمه عبور</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-lock"></i>
                            </div>
                            <asp:TextBox ID="txtPassword" placeholder="رمز عبور" runat="server" type="text" class="form-control" />
                        </div>
                        <br />
                    </div>
                    <!-- /.col -->
                    <div class="col-md-6">
                        <br />
                        <!-- /.input group -->
                        <label for="txtPhotoClient">تصویر مشتری</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-at"></i>
                            </div>
                            <asp:TextBox ID="txtPhotoClient" placeholder="آدرس تصویر نمایه مشتری" runat="server" type="text" class="form-control" />
                        </div>
                        <!-- /.form-group -->
                        <br />
                        <asp:SqlDataSource ID="DataSourceClient" runat="server" ConnectionString="<%$ ConnectionStrings:AHMDBConnectionString %>" SelectCommand="SELECT * FROM [Client] WHERE ([IDO] = @IDO)" DeleteCommand="DELETE FROM Client WHERE IDClient=@IDClient">
                            <DeleteParameters>
                                <asp:Parameter Name="IDClient" />
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="OrderView" Name="IDO" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:GridView ID="ClientView" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="DataSourceClient" Width="100%" DataKeyNames="IDClient" AllowPaging="True">
                            <Columns>
                                <asp:CommandField ButtonType="Button" SelectText="انتخاب" ShowSelectButton="True" DeleteText="حذف">
                                    <ControlStyle CssClass="btn btn-success btn-xs" Width="100%" />
                                </asp:CommandField>
                                <asp:BoundField DataField="Username" HeaderText="نام کاربری" SortExpression="Username" />
                                <asp:BoundField DataField="Password" HeaderText="رمز" SortExpression="Password" />
                                <asp:CommandField ButtonType="Button" DeleteText="حذف" ShowDeleteButton="True" HeaderText="حذف">
                                    <ControlStyle CssClass="btn btn-danger btn-xs" Width="100%" />
                                </asp:CommandField>
                            </Columns>
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FFF1D4" />
                            <SortedAscendingHeaderStyle BackColor="#B95C30" />
                            <SortedDescendingCellStyle BackColor="#F1E5CE" />
                            <SortedDescendingHeaderStyle BackColor="#93451F" />
                        </asp:GridView>
                        <br />
                        <!-- /.input group -->
                        <div class="input-group">
                            <asp:Button runat="server" ID="btnCreateClient" CssClass="btn btn-default" Text="ایجاد" />
                            <asp:Button runat="server" ID="btnUpdateClient" CssClass="btn btn-primary" Text="ذخیره" />
                        </div>
                        <!-- /.form-group -->
                        <asp:Label runat="server" ID="lblSubmitStatus" Text="" />
                        <br />
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
                <span>از طریق این اطلاعات مشتری وارد پنل اختصاصی خود خواهد شد  </span>
            </div>
        </div>

        <div class="box box-danger" runat="server" id="frmContra" visible="false">
            <div class="box-header with-border">
                <h3 class="box-title">قرارداد نامه </h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <!-- /.row -->
                <div class="row">
                    <div class="form-group col-md-12">
                        <label for="txtContra" class="col-md-1 control-label" style="width: 100%;">لیست قراردادها:</label>
                        <div class="col-md-12">
                            <asp:SqlDataSource ID="ContractSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:AHMDBConnectionString %>" ProviderName="<%$ ConnectionStrings:AHMDBConnectionString.ProviderName %>" SelectCommand="SELECT * FROM Contract WHERE (IDO = @IDO)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="OrderView" Name="IDO" PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:GridView ID="ContractView" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="ContractSqlDataSource" Width="100%" DataKeyNames="IDCon" AllowPaging="True">
                                <Columns>
                                    <asp:CommandField ButtonType="Button" SelectText="انتخاب" ShowSelectButton="True" DeleteText="حذف">
                                        <ControlStyle CssClass="btn btn-success btn-xs" Width="100%" />
                                    </asp:CommandField>
                                    <asp:BoundField DataField="Title" HeaderText="عنوان" SortExpression="Title" />
                                    <asp:CommandField ButtonType="Button" DeleteText="حذف" ShowDeleteButton="True" HeaderText="حذف">
                                        <ControlStyle CssClass="btn btn-danger btn-xs" Width="100%" />
                                    </asp:CommandField>
                                </Columns>
                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                                <SortedDescendingHeaderStyle BackColor="#93451F" />
                            </asp:GridView>
                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label for="txtContra" class="col-md-1 control-label" style="width: 100%;">عنوان قرارداد نامه:</label>
                        <div class="col-md-12">
                            <asp:TextBox ID="txtContraName" runat="server" Width="100%" />
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label for="txtContra" class="col-md-1 control-label" style="width: 100%;">متن قرارداد نامه:</label>
                        <div class="col-md-12">
                            <telerik:RadEditor ID="txtContra" runat="server" Height="100%" Width="100%" Skin="Bootstrap"></telerik:RadEditor>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                        <asp:Button ID="btnUpdateContra" runat="server" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 btn btn-default" Text="ذخیره تغییرات" />
                        <asp:Button ID="btnCreateContra" runat="server" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 btn btn-primary" Text="ایجاد قرارداد" />
                    </div>
                </div>
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
                <span>از طریق این اطلاعات مشتری وارد پنل اختصاصی خود خواهد شد  </span>
            </div>
        </div>

<%--        <div class="box box-primary" runat="server" id="Div1">
            <div class="box-header with-border">
                <h3 class="box-title">روند پیشرفت پروژه </h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

                <div class="row">
                    <div class="form-group col-md-12">
                        <label for="txtContra" class="col-md-1 control-label" style="width: 100%;">لیست قراردادها:</label>
                        <div class="col-md-12">
                            <asp:SqlDataSource ID="ProcessDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:AHMDBConnectionString %>" ProviderName="<%$ ConnectionStrings:AHMDBConnectionString.ProviderName %>" SelectCommand="SELECT * FROM Contract WHERE (IDCon = @IDCon)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ProcessView" Name="IDProc" PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:GridView ID="ProcessView" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="ProcessDataSource" Width="100%" DataKeyNames="IDCon" AllowPaging="True">
                                <Columns>
                                    <asp:CommandField ButtonType="Button" SelectText="انتخاب" ShowSelectButton="True" DeleteText="حذف">
                                        <ControlStyle CssClass="btn btn-success btn-xs" Width="100%" />
                                    </asp:CommandField>
                                    <asp:BoundField DataField="TitleProcess" HeaderText="عنوان" SortExpression="Title" />
                                    <asp:BoundField DataField="EndProc" HeaderText="پایان" SortExpression="EndProc" />
                                    <asp:BoundField DataField="Delay" HeaderText="تاخیر" SortExpression="Delay" />
                                    <asp:BoundField DataField="Description" HeaderText="توضیح" SortExpression="Description" />
                                    <asp:CommandField ButtonType="Button" DeleteText="حذف" ShowDeleteButton="True" HeaderText="حذف">
                                        <ControlStyle CssClass="btn btn-danger btn-xs" Width="100%" />
                                    </asp:CommandField>
                                </Columns>
                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                                <SortedDescendingHeaderStyle BackColor="#93451F" />
                            </asp:GridView>
                        </div>
                    </div>

                </div>

                <div class="row">
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <span>درحال حاضر سیستم پنل مشتری در حال توسعه می‌باشد.  </span>
                </div>
            </div>
        </div>--%>

    </section>

</asp:Content>

