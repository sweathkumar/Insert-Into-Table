<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Insert-Into-Table.aspx.cs" Inherits="Insert_Into_Table.Insert_Into_Table" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Insert Into Table</title>
    <style>
        #grid1 tr {
            border-bottom: 1px solid black;
        }

        #grid1 td {
            border-left: 1px solid black;
        }

        #grid1 th {
            border-left: 1px solid black;
        }
    </style>
    <script src="script.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script type="text/javascript">
      
       function onSubmit(){
        debugger;
        var uid = document.getElementById("<%=txtuserId.ClientID%>");
        var uname = document.getElementById("<%=txtuserName.ClientID%>");
        if (uid.value == ""){
            alert('UserID field should not be empty!');
            return false;
        } 
        else if(uname.value == "")
        {
            alert('User Name field should not be empty!');
            return false;
        }

        return true;
       }

       function onClear(){
        debugger;
        return confirm("Are you sure you want to delete entire data from the table?");
          
       }
       function deleteRow() {
        return confirm("Are you sure you want to delete this Row?");
       }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="spm" runat="server"></asp:ScriptManager>
        <section class="header bg-dark text-white py-3">
            <div class="container">
                <div class="row justify-content center">
                    <div class="col d-flex justify-content-center">
                        <p class="fs-3  m-0 fw-normal">
                            Insert Into Table
                        </p>
                    </div>
                </div>
            </div>
        </section>
        <section class="main py-5">
            <div class="container">
                <div class="row py-5">
                    <div class="col border border-1 border-dark py-4">
                        <div class="row py-3">
                            <div class="col-2">
                                <a id="test" runat="server"></a>
                                <asp:Label for="txtuserId" ID="lbluserId" runat="server" CssClass="fs-lg-6 fs-small fw-normal m-0 p-0" Text="User Id"></asp:Label>
                            </div>
                            <div class="col-2">
                                <asp:TextBox type="text" CssClass="fs-lg-6 fs-small fw-normal" ID="txtuserId" runat="server" placeholder="Enter Your User ID"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row py-3">
                            <div class="col-2">
                                <asp:Label for="txtuserName" ID="lbluserName" runat="server" CssClass="fs-lg-6 fs-small fw-normal m-0 p-0" Text="Username"></asp:Label>
                            </div>
                            <div class="col-2">
                                <asp:TextBox type="text" CssClass="fs-lg-6 fs-small fw-normal" ID="txtuserName" runat="server" placeholder="Enter Your User Name"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row py-2 ">
                            <div class="col d-flex justify-content-start">
                                <asp:Button Class="btn btn-primary btn-sm fs-5 fw-normal me-1 " OnClick="btnSubmit_Click" OnClientClick="javascript: return onSubmit();" Text="Submit" ID="btnSubmit" runat="server" />
                                <asp:Button class="btn btn-danger btn-sm fs-5 fw-normal mx-1" ID="btnReset1" runat="server" Text="Reset" OnClick="btnReset_Click" />
                                <asp:Button Class="btn btn-outline-primary btn-sm fs-5 fw-normal me-1 " OnClick="btnView_Click" Text="View" ID="btnView" runat="server" />
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="row">
                            <asp:GridView ID="grid1" ShowFooter="false" runat="server" AutoGenerateColumns="false" OnRowDataBound="grid1_RowDataBound" OnRowDeleting="grid1_RowDeleting" datakeyname="Fid" CellPadding="4" GridLines="Horizontal" PageSize="10" BackColor="White" BorderColor="#000000" BorderStyle="Solid" BorderWidth="1px" AllowPaging="True">
                                <Columns>
                                    <asp:TemplateField HeaderText="S.no">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User ID" SortExpression="userid">
                                        <ItemTemplate>
                                            <asp:Label Text='<%# Bind("userid") %>' ID="lbluserid" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User Name" SortExpression="userid">
                                        <ItemTemplate>
                                            <asp:Label Text='<%# Bind("name") %>' ID="lblname" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date" SortExpression="userid">
                                        <ItemTemplate>
                                            <asp:Label Text='<%# Bind("date") %>' ID="lbldate" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button class="btn btn-danger btn-sm fs-5 fw-normal mx-1" ID="btnDelete" runat="server" Text="Delete" onClick="btnDelete_Click" OnClientClick="return deleteRow()" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="row justify-content-end d-block">
                            <div class="col-2">
                                <asp:Button Class="btn btn-outline-danger btn-sm fs-5 fw-normal my-2 p-2 " CommandName="DeleteRow" CommandArgument='<%# Bind("userid")%>' Visible="false" OnClick="btnClear_Click" OnClientClick="javascript: return onClear();" Text="Clear Table" ID="btnClear" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="footer bg-dark text-white py-3">
            <div class="container">
                <div class="row p-1 justify-content-center">
                    <p class="fs-5 fw-normal text-center">Sweathkumar project 2024</p>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
