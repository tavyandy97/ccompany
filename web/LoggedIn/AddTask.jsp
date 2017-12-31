<%@include file="Header.jsp"%>
<div class="row">
    <%int JobID = Integer.parseInt(session.getAttribute("LoggedJobID").toString()); %>
    <div class="col-lg-12 content-custom">
	 <h1>Add Task</h1>
	 <form method="post" action="../EmpServlet">
	     <table class="table table-striped">
		 <tr>
		     <th>
			 Task Name
		     </th>
		     <td>
			 <input type="text" class="form-control" name="txtTaskName" id="txtTaskName">
		     </td>
		 </tr>
		 <tr><th colspan="2">Description<br><br>
			 <textarea name="txtDescription" class="form-control text-area"  placeholder="Please Enter Task Description Here .." rows="7"></textarea>
		     </th>
		 </tr>
		 <tr>
		     <th>
			 Last Date
		     </th>
		     <td>
			 <div  class='input-group' id="dt-picker">
			     <input type="text" class="form-control" name="txtLastDate" id="txtLastDate">
			     <span class="input-group-addon">
				<span class="glyphicon glyphicon-calendar"></span>
			    </span>
		     </td>
		 </tr>
		 <tr>
		     <th>
			 Priority
		     </th>
		     <td class="form-inline">
			 <input type="radio" name='radioPriority' id='radioPriority1' value='L' class="" checked> Low
			 <input type="radio" name='radioPriority' id='radioPriority2' value='M' class=""> Medium
			 <input type="radio" name='radioPriority' id='radioPriority3' value='H' class=""> High
		     </td>
		 </tr>
		 <tr>
		     <%
			datalayer.DALEmployees objDAL = new datalayer.DALEmployees();
			 ArrayList<beans.Employees> AL = objDAL.showEmpAdded(Integer.parseInt(session.getAttribute("LoggedEmpId").toString()));		     
		    %>
		    
		    <table class="table table-hover table-condensed table-bordered">
			<tr>
			    <th><span class="glyphicon glyphicon-saved pad-left"></span></th>
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
			    <td><input	type='checkbox' class="form-control big-check" name="checkEmpSelect" value="<%=x.getEmpID()%>"></td>
			    <td><%=x.getEmpID()%></td>
			    <td><%=x.getEmpName()%></td>
			    <td><%=x.getEmpContactNumber()%></td>
			    <td><%=x.getDepartmentName()%></td>
			    <td><%=x.getJobID()%></td>
			    <td><%=x.getJobName()%></td>
			</tr>
		     <%}%>
		    </table>
		 </tr>
		 <tr>
		     <td></td>
		     <td><input type="submit" value="Add Task" class="btn  btn-primary pull-right" name="btnAddTask"></td>
		 </tr>
	     </table>
	 </form>
     </div>
</div>
<script src="../LatestJQuery.js"></script>
<script type="text/javascript">
 
</script>		
<%@include file="Footer.html"%>