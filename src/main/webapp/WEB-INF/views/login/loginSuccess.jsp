<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 로그인 성공</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.7.0.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath()%>/js/common.js"></script> 
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script type="text/javascript">
	</script>
	<script type="text/javascript">
		$(() => {
			
		});
	</script>
</head>
<body>
	<div class="container-sm" style="height: 100vh;">
		<main class="form-signin w-60 m-auto" align="center" style="width: 500px; position: relative; top: 25%">
			<img class="mb-4" src="<%= request.getContextPath() %>/images/logo.png" alt="" width="280" style="position:relative; top:30px;">
		    <br><br><br>
		    
		    
	    	<h3>${memberName}님 <br>네이버 아이디로<br> 로그인이 완료되었습니다.<br></h3>
	    	
			<br><br>
			<div class="row">
			  <div class="col">
			    <a href="<%= request.getContextPath() %>" class="btn btn-warning w-100 py-2">홈으로</a>
			    
			  </div>
			</div>
		</main>
	</div>
</body>
</html>
