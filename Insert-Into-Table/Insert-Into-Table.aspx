<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Insert-Into-Table.aspx.cs" Inherits="Insert_Into_Table.Insert_Into_Table" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Insert Into Table</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="spm" runat="server"></asp:ScriptManager>
        <section class="header bg-dark text-white py-3">
        <div class="container">
            <div class="row justify-content center">
                <div class="col d-flex justify-content-center">
                    <p class="fs-3 fw-normal">
                        Insert Into Table
                    </p>
                </div>
            </div>
        </div>
    </section>
    <section class="main py-5">
        <div class="container">
            <div class="row py-5">
                <div class="col py-4">
                    <div class="row py-3">
                        <div class="col-2">
                            <a id="test" runat="server"></a>
                            <asp:Label for="txtuserId" id="lbluserId" runat="server" CssClass="fs-5 fw-normal m-0 p-0" Text ="User Id"></asp:Label>
                        </div>
                        <div class="col-2">
                            <asp:TextBox type="text" CssClass="fs-5 fw-normal" id="txtuserId" runat="server" placeholder="Enter Your User ID"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row py-3">
                        <div class="col-2">
                            <asp:Label for="txtuserName" id="lbluserName" runat="server" CssClass="fs-5 fw-normal m-0 p-0" Text="Username"></asp:Label>
                        </div>
                        <div class="col-2">
                            <asp:TextBox type="text" CssClass="fs-5 fw-normal" id="txtuserName" runat="server" placeholder="Enter Your User Name"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row py-2">
                        <div class="col-2 d-flex">
                            <asp:Button Class="btn btn-primary btn-md fs-5 fw-normal me-1 " OnClick="btnSubmit_Click" Text="Submit" id="btnSubmit" runat="server"/>
                            <button Class="btn btn-danger btn-md fs-5 fw-normal mx-1" Type="reset" Value="Reset" ID="btnReset" runat="server">Reset</button>
                            <button class="btn btn-outline-primary btn-md fs-5 fw-normal mx-1"  ID="btnView" runat="server">View</button>
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
