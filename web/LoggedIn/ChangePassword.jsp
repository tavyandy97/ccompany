<%@include file="Header.jsp"%>
 <div class="row">
    
    <div class="col-lg-12 content-custom">
	 <h1>Change Your Password</h1>
	 <form method="post" action="../EmpServlet"  onsubmit="return validateChangePassword()">
	    <center>
		<table class="table-condensed table-hover">
		    <colgroup>
			<col width="20%">
			<col width="50%">
			<col width="30%">
		    </colgroup>
		    <tr>
			<td>Current Password</td>
			<td><input type="password" id="pwdCurrectPassword" name="pwdCurrectPassword" class="form-control"></td>
			<td class="text-danger">
			    <%=(request.getParameter("fail") != null) ? "Wrong Password Entered" : "" %>
			</td>
		    </tr>
		    <tr>
			<td>New Password</td>
			<td><input type="password" id="pwdNewPassword" name="pwdNewPassword" class="form-control"></td>
			<td class="text-danger" id="msg1"></td>
		    </tr>
		    <tr>
			<td>Confirm New Password</td>
			<td><input type="password" id="pwdCNewPassword" name="pwdCNewPassword" class="form-control"></td>
			<td class="text-danger" id="msg2"></td>
		    </tr>
		    <tr>
			<td></td>
			<td><input type="submit" value="Change Password" class="btn btn-warning" name="btnChngPwd"></td>
			<td></td>
		    </tr>
		    <tr></tr>
		</table>
	    </center>
	</form>
     </div>
</div>
<script type="text/javascript">
    function validateChangePassword(){
		let ret = true;
		document.getElementById("msg1").innerHTML="";
		document.getElementById("msg2").innerHTML="";

		if(document.getElementById("pwdNewPassword").value.length < 8){
		    document.getElementById("msg1").innerHTML="Password should be 8 characters or more";
		    ret = false;
		}
		if(document.getElementById("pwdNewPassword").value !== document.getElementById("pwdCNewPassword").value){
		    document.getElementById("msg2").innerHTML = "Password Mismatch";
		    ret = false;
		}
		return ret;		
	    }
</script>			 
<%@include file="Footer.html" %>