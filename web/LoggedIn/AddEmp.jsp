<%@include file="Header.jsp"%>
 <div class="row">
    <%int JobID = Integer.parseInt(session.getAttribute("LoggedJobID").toString()); %>
    <div class="col-lg-12 content-custom">
	 <h1>Add Employee</h1>
	 <form method="post" action="../EmpServlet">
	     <table class="table table-striped">
		 <tr>
		     <td>Employee Name</td>
		     <td><input type="text" id="txtEmpName" name="txtEmpName" class="form-control"></td>
		 </tr>
		 <tr>
		     <td>Employee Mobile Number </td>
		     <td><input type="text" id="txtEmpContact" name="txtEmpContact" class="form-control"></td>
		 </tr>
		 <tr>
		     <td>Employee Department </td>
		     <td>
			 <select class="form-control" id="ddlDepartment" name="ddlDepartment" onchange="populateJobs()" <%=JobID==1 ? "" : "disabled"%>>
			 <%
			     
			     datalayer.DALDepartments objDAL = new datalayer.DALDepartments();
			     ArrayList<beans.Departments> AL = objDAL.getDepartments();
			     if(JobID==1){
				for(beans.Departments x : AL){
				    int flag =0;
				   if(x.getDepartmentID()==1){
				       continue;
				   }
			 %>
			    <option value="<%=x.getDepartmentID()%>" <%=(flag==1)?"selected":""%>><%=x.getDepartmentName()%></option>
			 <%}}%>
			 <%
			     if(JobID!=1){  
				     beans.Departments dep = objDAL.getDepartmentByJobID(JobID);
			 %>
			 <option value="<%=dep.getDepartmentID()%>"><%=dep.getDepartmentName()%></option> 
			 <%}%>
			 </select>
		     </td>
		 </tr>
		 <tr>
		     <td>Employee Job</td>
		     <td>
			<select class="form-control" id="ddlJob" name="ddlJob" onchange="showJobID()">
			    
			</select>
		     </td>
		 </tr>
		 <tr>
		     <td>Employee Job ID</td>
		     <td>
 			 <input  type="text" class="form-control" id="txtJobID" name="txtJobID" readonly>
		    </td>
		 </tr>
		 <tr>
		     <td></td>
		     <td><input type="submit" value="Add Employee" class="btn  btn-primary pull-right" name="btnAddEmp"></td>
		 </tr>
	     </table>
	 </form>
     </div>
</div>
<script src="../LatestJQuery.js"></script>
<script type="text/javascript">
    
    $(window).on('load', function() {
	populateJobs();
    });
    
    var ddl2= document.getElementById("ddlJob");
    var xhttp;
    var val;
    var ddl1= document.getElementById("ddlDepartment");
    val = ddl1.value;
    function populateJobs(){
	xhttp = new XMLHttpRequest();	
	for(var i=0;i < ddl2.options.length;){
	    ddl2.options[i]=null;
	}
	xhttp.onreadystatechange = subFunction;
	xhttp.open("post",("../EmpServlet?number="+ddl1.value),true);
	xhttp.send();
    }
    function subFunction(){
	if(xhttp.readyState===4){
		var passed = xhttp.responseText;
		var splitted = passed.split("#");
		var txtJobID = document.getElementById("txtJobID");
		txtJobID.value = splitted[0];
		for(var i = 0 ; i < (splitted.length ) -1 ; i+=2){
		    var test = document.createElement("option");
		    test.value = splitted[i];
		    test.text=splitted[i+1];
		    ddl2.options.add(test);
		}
	}
    }
    
    function showJobID(){
	var ddlJob = document.getElementById("ddlJob");
	var txtJobID = document.getElementById("txtJobID");
	txtJobID.value = ddlJob.value;
    }
</script>			 
<%@include file="Footer.html"%>