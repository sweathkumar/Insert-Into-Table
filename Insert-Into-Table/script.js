function onSubmit() {
    var uid = document.getElementById("<%=txtuserId%>").value;
    if (uid == null) {
        //document.getElementById(uid).style.border = "2px solid red";
        alert("User Id Feild Should Not be empty!");
        return false;
    }
}

var uid = document.getElementById("<%=txtuserId.ClientID%>");
        var uname = document.getElementById("<%=txtuserName.Text%>");

  function onSubmit() {
            debugger;
            if (uid.valu == "") {
                alert("User Id feild should not be empty1")
                return false;
            }
        }