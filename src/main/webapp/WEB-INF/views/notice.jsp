<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!--          meta 선언          -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="<%= request.getContextPath()%>/img/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
	<!--          script 선언          -->
	<script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery-3.7.0.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
	
	<style type="text/css">
		.row {
			width: 100%;
			height: 100vh;
			margin: 0px;
		}
		
		#side {
			background-color: #1D809F; 
			color: #fff; 
			padding: 30px;
		}
		
		@media (max-width: 1000px) {
			.row {
				height: auto;
			}
			
			#side {
				width: 100%;
			}
			
			.accordion {
				width: 100%;
			}
		}
	</style>
	<script type="text/javascript">
		function addCount(obj) {
			//alert($(obj).attr("aria-expanded"));
			if ($(obj).attr("aria-expanded")) {
				
			}
		}
	</script>
<title>공지사항</title>
</head>
<body>
	<div class="row">
		<div class="col-md-2" id="side">
	    	<h3><strong>공지사항</strong></h3>
	  	</div>
		<div class="accordion accordion-flush col-md-10">
		  	<c:forEach var="item" items="${list}">
	  		<div class="accordion-item">	
	         	<h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
			      data-bs-target="#notice${item.idx}" aria-expanded="false" aria-controls="notice${item.idx}" onclick="addCount(this)">
			        ${item.subject}
			      </button>
			    </h2>
			    <div id="notice${item.idx}" class="accordion-collapse collapse" data-bs-parent="#accordionFlush">
			      <div class="accordion-body"><pre>${item.context}</pre></div>
			    </div>
          	</div>
          	</c:forEach>
		</div>
	</div>
</body>

</html>