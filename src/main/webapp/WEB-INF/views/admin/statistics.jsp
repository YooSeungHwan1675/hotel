<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="<%= request.getContextPath()%>/img/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/styles.css"/>
    
    <script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery-3.7.0.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="<%= request.getContextPath()%>/js/statistics.js"></script>
	
	<script type="text/javascript">
		$(() => {
			var url = '<%= request.getContextPath() %>/admin/statisticsData.do';
			
			fetch(url, {method: "get"})
	  		.then((response) => {
			  	return response.json();
		  	})
		  	.then((json) => {
		  		var month = json.month;
		  		var age = json.age;
		  		var room = json.room;
		  		var gender = json.gender;
		  		
		  		onChart(month, age, room, gender);
		  	})
		  	.catch((error) => console.log("error:", alert(error)));
		});
	</script>
<body>
    <div class="d-flex" id="wrapper">
        <!-- Sidebar-->
       	<div class="border-end bg-white" id="sidebar-wrapper">
            <jsp:include page="/WEB-INF/views/layout/side.jsp"/>
        </div>
        
        <!-- Page content wrapper-->
        <div id="page-content-wrapper">
            <!-- Top navigation-->
            <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
            	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
            </nav>
            <br>
            <!-- Page content-->
            <div class="table-responsive" style="padding: 20px;">
            	<div class="row">
	         		<div class="col"">
				    	<div style="width: 100%; height: 40vh;">
					        <canvas id="month"></canvas>
					    </div>
				  	</div>
				  	<div class="col">
					    <div style="width: 100%; height: 40vh;">
					        <canvas id="age"></canvas>
					    </div>
				  	</div>
	            </div><br><br><br>
	            <div class="row">
	         		<div class="col">
				    	<div style="width: 100%; height: 40vh;">
					        <canvas id="room"></canvas>
					    </div>
				  	</div>
				  	<div class="col">
					    <div style="width: 100%; height: 40vh;">
					        <canvas id="gender"></canvas>
					    </div>
				  	</div>
	            </div>
            </div>
            
        </div>
    </div>
    
</body>
</html>