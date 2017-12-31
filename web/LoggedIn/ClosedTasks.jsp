<%@include file="Header.jsp"%>
<div class="row">
    <%int JobID = Integer.parseInt(session.getAttribute("LoggedJobID").toString()); %>
    <div class="col-lg-12 content-custom">
	
	<h1>Closed Tasks
	    <div class="row"><div class="col-xs-12">
		<span class="badge taskp-high pull-right badge-bar-right">High</span>
		<span class="badge taskp-medium pull-right badge-bar-center">Medium</span>
		<span class="badge taskp-low pull-right badge-bar-center">Low</span>
		<span class="badge pull-right badge-bar-left">Priority Color Coding</span>
	    </div>
	    </div>
	</h1>
	<ul class="nav nav-tabs nav-justified">
	    <li class="active"><a href="#toyou" data-toggle="tab" class="tab-header">Tasks Assigned To You</a></li>
	    <li class=""><a href="#byyou" data-toggle="tab" class="tab-header">Tasks Assigned By You</a></li>
	</ul>
	<div class="tab-content">
	    <div class="tab-pane active" id="toyou">
		<br>
		<div class="list-group">
		<%
		    datalayer.DALTasks objDAL = new datalayer.DALTasks();
		    ArrayList<beans.Tasks> TasksAL = objDAL.getTasksOpenForYou(Integer.parseInt(session.getAttribute("LoggedEmpId").toString()));
		    for(beans.Tasks x : TasksAL){
			if(x.getStatus()!='C')
			    continue;
			String status="";
			String priority="";
			switch(x.getTaskPriority()){
			    case 'L':
				priority="taskp-low";
				break;
			    case 'M':
				priority="taskp-medium";
				break;
			    case 'H':
				priority="taskp-high";
				break;				
			}

		%>
		<div class="list-group-item <%=priority%>" id="<%=x.getTaskID()%>Task">
		    <span class="badge"><a id="<%=x.getTaskID()%>">Closed</a></span>
			<div class="list-group-item-heading task-header"><span class="caret"></span> <%=x.getTaskName()%></div>
			<span class="task-desc"><span class=" glyphicon glyphicon-triangle-right"></span> <%=x.getTaskDescription()%></span>
			<div class="list-group-item-text">
			    <span class="date-given">Task Assigned on: <%=x.getDate()%></span>
			    <span class="last-date pull-right">Task Completion by: <%=x.getLastDate()%></span>
			</div>
			<br class="hidden-md hidden-lg hidden-sm">
		    </div>
		<%}%>
		</div>
	     </div>
	     <div class="tab-pane" id="byyou">
		 <br>
		<div class="list-group">
		<%
		    objDAL = new datalayer.DALTasks();
		    TasksAL = objDAL.getTasksAssignedByYou(Integer.parseInt(session.getAttribute("LoggedEmpId").toString()));
		    for(beans.Tasks x : TasksAL){
			
			if(x.getStatus()!='C')
			    continue;
			String status="";
			String priority="";
			switch(x.getTaskPriority()){
			    case 'L':
				priority="taskp-low";
				break;
			    case 'M':
				priority="taskp-medium";
				break;
			    case 'H':
				priority="taskp-high";
				break;				
			}

			if(status=="Closed")
			    continue;
			beans.Employees e   = x.EmployeeList.get(0);
			datalayer.DALJobs objDALJ = new datalayer.DALJobs();
			e.setJobName(objDALJ.getJobByJobID(e.getJobID()));
		%>
		<div class="list-group-item <%=priority%>" id="<%=x.getTaskID()%>Task">
		    <span class="badge"><a id="<%=x.getTaskID()%>">Closed</a></span>
			<span class="emp-deet"><%=e.getEmpName()%> (<%=e.getJobName()%>)</span>
			<div class="list-group-item-heading task-header"><span class="caret"></span> <%=x.getTaskName()%></div>
			<span class="task-desc"><span class=" glyphicon glyphicon-triangle-right"></span> <%=x.getTaskDescription()%></span>
			<div class="list-group-item-text">
			    <span class="date-given">Task Assigned on: <%=x.getDate()%></span>
			    <span class="last-date pull-right">Task Completion by: <%=x.getLastDate()%></span>
			</div>
			<br class="hidden-md hidden-lg hidden-sm">
		    </div>
		<%}%>
		</div>
	     </div> 
		
		
	</div>
    </div>
</div>
<script src="../LatestJQuery.js"></script>
<script type="text/javascript">
    $(document).ready(
	    function(){
		$(".task-header").click(
			function(){
			    $(this).next().slideToggle();
			}
		)
	    }
    );

</script>
<%@include file="Footer.html"%>