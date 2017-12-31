<%@include file="Header.jsp"%>
<%
    datalayer.DALEmployees objDAL1 = new datalayer.DALEmployees();
    beans.Employees emp = objDAL1.getEmpByID(Integer.parseInt(request.getParameter("ID")));
    datalayer.DALDepartments objDAL2 = new datalayer.DALDepartments();
    beans.Departments dep = objDAL2.getDepartmentByJobID(emp.getJobID());
    datalayer.DALJobs objDAL3 = new datalayer.DALJobs();
    emp.setJobName(objDAL3.getJobByJobID(emp.getJobID()));
    emp.setDepartmentName(dep.getDepartmentName());
    emp.setDepartmentID(dep.getDepartmentID());
    String gender="-";
    if(emp.getEmpGender()=='M') gender="Male";
    else if(emp.getEmpGender()=='F') gender = "Female";
%> 
<div class="row">
    <div class="col-lg-12 content-custom">
	<br>
	 <h1><%=emp.getEmpName()%></h1>
	 <div class="row">
	    <div class="col-lg-4" align="center">
		<img src="EmployeesImages/Img<%=emp.getEmpID()%>.jpg" class="img-thumbnail img-responsive" onerror="if (this.src != 'ProfileImg.jpg') this.src = 'EmployeesImages/ProfileImg.jpg';">
		<br>
	    </div>
	    <div class="col-lg-8">
		<table class="table table-hover table-bordered">
		    <colgroup>
			<col width="35%">
			<col width="65%">
		    </colgroup>
		    <tr>
			<th>Employee ID</th>
			<td><%=emp.getEmpID()%></td>
		    </tr>
		    <tr>
			<th>Employee Gender</th>
			<td><%=gender%></td>
		    </tr>
		    <tr>
			<th>Employee Designation</th>
			<td><%=emp.getJobName()%></td>
		    </tr>
		    <tr>
			<th>Employee Department</th>
			<td><%=emp.getDepartmentName()%></td>
		    </tr>
		    <tr>
			<th>Employee Contact Number</th>
			<td><%=emp.getEmpContactNumber()%></td>
		    </tr>
		    <tr>
			<th>Employee Email</th>
			<td><%=emp.getEmpEmailID()%></td>
		    </tr>		    
		</table>
	    </div>
	</div>
	<div class="row">
	    <div class="col-lg-12">
		<h3>Employees Under <%=emp.getEmpName()%></h3>
		    <%
			 ArrayList<beans.Employees> AL = objDAL1.showEmpAdded(emp.getEmpID());		     
		    %>
	     <table class="table table-striped ">
		 <tr>
		     <th>Employee ID</th>
		     <th>Employee Name</th>
		     <th>Employee Contact</th>	     
		     <th>Department Name</th>
		     <th>Job ID</th>			     
		     <th>Job Name</th>		     
		 </tr>
		 <%
		     for(beans.Employees x : AL){
		 %>
		 <tr>
		     <td><%=x.getEmpID()%></td>
		     <td><a href="EmpProfile.jsp?ID=<%=x.getEmpID()%>"><button class="btn btn-default"><%=x.getEmpName()%></button></a></td>
		     <td><%=x.getEmpContactNumber()%></td>
		     <td><%=x.getDepartmentName()%></td>
		     <td><%=x.getJobID()%></td>
		     <td><%=x.getJobName()%></td>
		 </tr>
		 <%}%>
	     </table>
	    </div>
	</div>
     </div>
</div>
<script type="text/javascript">

</script>			 
<%@include file="Footer.html" %>