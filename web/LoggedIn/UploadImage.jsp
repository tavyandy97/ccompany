<%@include file="Header.jsp"%>
 <div class="row">
    
    <div class="col-lg-12 content-custom">
	 <h1>Change Your Image</h1>
	<br>
	 <div class="row">
	    <div class="col-lg-4" align="center">
		<img src="EmployeesImages/Img<%=session.getAttribute("LoggedEmpId")%>.jpg" class="img-thumbnail" height="150px" onerror="if (this.src != 'ProfileImg.jpg') this.src = 'EmployeesImages/ProfileImg.jpg';">
		<br>
		<h2>Your Current Image</h2>
	    </div>
	    <div class="col-lg-8">
		<form action="../EmpServlet" method="post" enctype="multipart/form-data">
		    <input type="file" name="empimage" class="btn btn-lg btn-default">
		   <br>
		   <input type="submit" name="btnUpload" value="Upload" class="btn btn-success">
		   <br>
		   <%=request.getAttribute("flag")!=null? "Image has been uploaded successfully": ""%>
	       </form>
	    </div>
	</div>
     </div>
</div>
<script type="text/javascript">

</script>			 
<%@include file="Footer.html" %>