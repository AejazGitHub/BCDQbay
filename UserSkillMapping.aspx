<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/masterPage.Master" CodeBehind="UserSkillMapping.aspx.cs" Inherits="FCTG_Web.UserSkillMapping" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainBodyContent" runat="server">


    <asp:UpdatePanel runat="server" ID="updtpanel1">
        <ContentTemplate>
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <div class="content-header d-none">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1 class="m-0 pageTitle">User Skill Mapping</h1>
                            </div>
                            <!-- /.col -->
                            <%--  <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item active">Master</li>
                                    <li class="breadcrumb-item active">User Skill Mapping</li>
                                </ol>
                            </div>--%>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.container-fluid -->
                </div>
                <!-- /.content-header -->

                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid">
                        <!-- Small boxes (Stat box) -->

                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h3 class="card-title font-weight-bold">
                                            <i class="fas fa-chart-pie mr-1"></i>
                                            User Skill Mapping</h3>
                                        <div class="card-tools">
                                        </div>
                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body">
                                        <div class="tab-content p-0">

                                            <div id="divUserSkillMapping">

                                                <!-- Agent Selection -->
                                                <div class="row mb-3 align-items-center">
                                                    <div class="col-md-2">
                                                        <label class="mb-0">
                                                            <span class="text-danger">*</span> Agent Name
                                                        </label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <asp:ListBox ID="lstAgents"
                                                            runat="server"
                                                            SelectionMode="Multiple"
                                                            AutoPostBack="true"
                                                            OnSelectedIndexChanged="lstAgents_SelectedIndexChanged"
                                                            CssClass="form-control selectpicker"
                                                            data-live-search="true"
                                                            data-size="5"
                                                            data-none-selected-text="Select user"></asp:ListBox>
                                                    </div>

                                                </div>

                                                <!-- Skills Section -->

                                                <div class="row">

                                                    <!-- PNR -->

                                                    <div class="col-md-4">
                                                        <div class="card card-outline card-primary">
                                                            <div class="card-header p-2">
                                                                <h6 class="card-title font-weight-bold">PNR Skills</h6>
                                                            </div>

                                                            <div class="card-body p-2" style="min-height: 230px; overflow: auto;">
                                                                <asp:GridView ID="grdPNR" runat="server" AutoGenerateColumns="False"
                                                                    CssClass="table table-bordered table-sm mb-0"
                                                                    DataKeyNames="Rule_Master_Key">

                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Select Data" ControlStyle-Width="25px" HeaderStyle-CssClass="select-checkbox">
                                                                            <HeaderTemplate>
                                                                                <asp:CheckBox ID="chkParent" runat="server" onclick="return clickChkParent(this);" />
                                                                            </HeaderTemplate>

                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="chkChild" runat="server" AutoPostBack="false" onclick="setSkillLevel(this);" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>

                                                                        <asp:TemplateField HeaderText="ID" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblRuleMasterKey" runat="server" Text='<%# Bind("Rule_Master_Key") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>

                                                                        <%--   <asp:TemplateField HeaderText="Work Type">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSystem_Type" runat="server" Text='<%# Bind("FILE_TYPE") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>--%>

                                                                        <asp:TemplateField HeaderText="Skill Name">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSkillName" runat="server" Text='<%# Bind("RuleName") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>

                                                                        <asp:TemplateField HeaderText="Skill Level" ControlStyle-Width="80px">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtSkillLevel" CssClass="form-control form-control-sm" runat="server" TextMode="Number" min="0" Text="0"></asp:TextBox>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>

                                                                    </Columns>

                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- Excel -->
                                                    <div class="col-md-4">
                                                        <div class="card card-outline card-success">
                                                            <div class="card-header p-2">
                                                                <h6 class="card-title font-weight-bold">Excel Skills</h6>
                                                            </div>
                                                            <div class="card-body p-2" style="min-height: 230px; overflow: auto;">
                                                                <asp:GridView ID="grdExcel" runat="server" AutoGenerateColumns="False"
                                                                    CssClass="table table-bordered table-sm mb-0"
                                                                    DataKeyNames="Rule_Master_Key">

                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Select Data" ControlStyle-Width="25px" HeaderStyle-CssClass="select-checkbox">
                                                                            <HeaderTemplate>
                                                                                <asp:CheckBox ID="chkParent" runat="server" onclick="return clickChkParent(this);" />
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="chkChild" runat="server" AutoPostBack="false" onclick="setSkillLevel(this);" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>

                                                                        <asp:TemplateField HeaderText="ID" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblRuleMasterKey" runat="server" Text='<%# Bind("Rule_Master_Key") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>

                                                                        <%-- <asp:TemplateField HeaderText="Work Type">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSystem_Type" runat="server" Text='<%# Bind("FILE_TYPE") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>--%>

                                                                        <asp:TemplateField HeaderText="Skill Name">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSkillName" runat="server" Text='<%# Bind("RuleName") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>

                                                                        <asp:TemplateField HeaderText="Skill Level" ControlStyle-Width="80px">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtSkillLevel" CssClass="form-control form-control-sm" runat="server" TextMode="Number" min="0" Text="0"></asp:TextBox>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>

                                                                </asp:GridView>

                                                                <asp:Panel ID="pnlNoram" runat="server" Visible="false" CssClass="mt-2">
                                                                    <details>
                                                                        <summary class="font-weight-bold" style="cursor: pointer;">
                                                                            NORAM Skills
                                                                        </summary>

                                                                        <div class="pt-2">
                                                                            <asp:GridView ID="grdNoram" runat="server" AutoGenerateColumns="False"
                                                                                CssClass="table table-bordered table-sm mb-0"
                                                                                DataKeyNames="Rule_Master_Key">

                                                                                <Columns>
                                                                                    <asp:TemplateField HeaderText="Select Data" ControlStyle-Width="25px" HeaderStyle-CssClass="select-checkbox">
                                                                                        <HeaderTemplate>
                                                                                            <asp:CheckBox ID="chkParent" runat="server" onclick="return clickChkParent(this);" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="chkChild" runat="server" AutoPostBack="false" onclick="setSkillLevel(this);" />
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>

                                                                                    <asp:TemplateField HeaderText="ID" Visible="false">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblRuleMasterKey" runat="server" Text='<%# Bind("Rule_Master_Key") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>

                                                                                    <asp:TemplateField HeaderText="Skill Name">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblSkillName" runat="server" Text='<%# Bind("RuleName") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>

                                                                                    <asp:TemplateField HeaderText="Skill Level" ControlStyle-Width="80px">
                                                                                        <ItemTemplate>
                                                                                            <asp:TextBox ID="txtSkillLevel" CssClass="form-control form-control-sm" runat="server" TextMode="Number" min="0" Text="0"></asp:TextBox>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                </Columns>

                                                                            </asp:GridView>
                                                                        </div>
                                                                    </details>
                                                                </asp:Panel>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- Email -->
                                                    <div class="col-md-4">
                                                        <div class="card card-outline card-warning">
                                                            <div class="card-header p-2">
                                                                <h6 class="card-title font-weight-bold">Email Skills</h6>
                                                            </div>
                                                            <div class="card-body p-2" style="min-height: 230px; overflow: auto;">
                                                                <asp:GridView ID="grdEmail" runat="server" AutoGenerateColumns="False"
                                                                    CssClass="table table-bordered table-sm mb-0"
                                                                    DataKeyNames="Rule_Master_Key">

                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Select Data" ControlStyle-Width="25px" HeaderStyle-CssClass="select-checkbox">
                                                                            <HeaderTemplate>
                                                                                <asp:CheckBox ID="chkParent" runat="server" onclick="return clickChkParent(this);" />
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="chkChild" runat="server" AutoPostBack="false" onclick="setSkillLevel(this);" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>

                                                                        <asp:TemplateField HeaderText="ID" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblRuleMasterKey" runat="server" Text='<%# Bind("Rule_Master_Key") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>

                                                                        <%-- <asp:TemplateField HeaderText="Work Type">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSystem_Type" runat="server" Text='<%# Bind("FILE_TYPE") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>--%>

                                                                        <asp:TemplateField HeaderText="Skill Name">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSkillName" runat="server" Text='<%# Bind("RuleName") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>

                                                                        <asp:TemplateField HeaderText="Skill Level" ControlStyle-Width="80px">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtSkillLevel" CssClass="form-control form-control-sm" runat="server" TextMode="Number" min="0" Text="0"></asp:TextBox>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>

                                                                </asp:GridView>
                                                            </div>

                                                            <asp:Label ID="lblErrorMessage" runat="server" CssClass="text-danger error_span"></asp:Label>

                                                        </div>
                                                    </div>

                                                </div>

                                                <!-- Buttons -->
                                                <div class="row">
                                                    <div class="col-md-12 text-right">
                                                        <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                                                            CssClass="btn btn-primary"
                                                            OnClick="btnSubmit_Click"
                                                            OnClientClick="return Validation();" />

                                                        <asp:Button ID="btnReset" runat="server" Text="Reset"
                                                            Class="btn btn-yellow"
                                                            OnClick="btnReset_Click" />
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.card-body -->
                                </div>
                            </div>
                            <!-- /.col-->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.container-fluid -->
                </section>
                <!-- /.content -->
            </div>

            <!-- /.content-wrapper -->
            <asp:ScriptManager runat="server"></asp:ScriptManager>
            <script type="text/javascript">   
                function OnAgentSelectedIndexChange() {
                    if ($("#mainBodyContent_lstAgents :selected").length <= 1) {
                        $('#mainBodyContent_lstAgents').click();
                        __doPostBack('#mainBodyContent_lstAgents')
                        return true;
                    }
                    else {
                        return false;
                    }
                }

                function Validation() {

                    var flag = true;

                    $('#<%= lblErrorMessage.ClientID%>').text('');
                    $('.error').remove();

                    // Agent validation
                    var role = $($('#divDDLAgent').find('.filter-option-inner-inner')[0]).html();

                    if (role == 'Select') {
                        $('#divDDLAgent')
                            .find('div.selectControl')
                            .attr('style', 'border:1px solid red !important')
                            .after('<span class="text-danger error">Please select Agent</span>');
                        flag = false;
                    }

                    var anyChecked = $('input[id*="chkChild"]:checked').length > 0;

                    if (!anyChecked) {
                        $('input[id*="chkChild"]').css({ "outline": "1px solid red" });
                        $('#<%= lblErrorMessage.ClientID%>').text('Please select at least 1 Skill');
                        flag = false;
                    }
                    else {
                        $('input[id*="chkChild"]').css({ "outline": "none" });
                    }

                    return flag;
                }

                function checkAllSelect() {
                }

                $(document).ready(function () {
                    $('#mainBodyContent_btnReset').click(function () {
                        $('input:checkbox').removeAttr('checked');
                    });

                    checkAllSelect();

                    $('[id*=chkChild]').on('click', function () {
                        checkAllSelect();
                    });

                    if (typeof (Sys) != "undefined") {
                        var prm = Sys.WebForms.PageRequestManager.getInstance();
                        prm.add_endRequest(function () {
                            checkAllSelect();
                            $('[id*=chkChild]').on('click', function () {
                                checkAllSelect();
                            });
                        });
                    }
                });

                function clickChkParent(parentChk) {
                    try {

                        var isChecked = $(parentChk).is(':checked');

                        // Find ONLY current grid
                        var grid = $(parentChk).closest('table');

                        grid.find("input[id*='chkChild']").each(function () {

                            var chkChild = $(this);
                            var row = chkChild.closest("tr");
                            var txtSkill = row.find("input[id*='txtSkillLevel']");
                            var skillVal = parseInt(txtSkill.val(), 10);

                            if (isChecked) {
                                chkChild.prop('checked', true);

                                if (isNaN(skillVal) || skillVal <= 0) {
                                    txtSkill.val("1");
                                }
                            }
                            else {
                                chkChild.prop('checked', false);
                                txtSkill.val("0");
                            }
                        });

                        return true;
                    }
                    catch (error) {
                        console.error("clickChkParent() Error:", error);
                    }
                }

                function setSkillLevel(el) {
                    var row = $(el).closest('tr');
                    var txt = row.find('input[type="number"]');

                    if ($(el).is(':checked')) {
                        txt.val('1');
                    } else {
                        txt.val('0');
                        $(el).closest('table').find("input[id*='chkParent']").prop('checked', false);
                    }
                }

            </script>
            <!-- /.content-wrapper -->
        </ContentTemplate>
        <%--<Triggers>
            <asp:PostBackTrigger ControlID="lstAgents" />
        </Triggers>--%>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="updtpanel1">
        <ProgressTemplate>
            <div id="overlayBlocker"
                style="position: fixed; top: 0; left: 0; width: 100vw; height: 100vh; background-color: rgba(0,0,0,0.3); z-index: 998;">
            </div>
            <div style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 999; background: rgba(255, 255, 255, 0.8); padding: 10px; border-radius: 5px; text-align: center;">
                <img src="malkom-static-assets/common/images/Loader.gif" alt="Loading..." />
                <br />
                <span>Please wait...</span>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>