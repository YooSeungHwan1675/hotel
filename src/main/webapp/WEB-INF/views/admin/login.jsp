<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>로그인</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.7.0.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath()%>/js/common.js"></script> 
	
	<script type="text/javascript">
		$(() => {
			var msg = "${msg}";
			
			if (msg != "") {
				alert(msg);
				window.location.href= "<%= request.getContextPath()%>/admin/login.do";
			}
		});
	</script>
</head>
<body>
	<div class="container-sm" style="height: 100vh;">
		<main class="form-signin w-60 m-auto" align="center" style="width: 500px; position: relative; top: 25%">
		  <form action="<%= request.getContextPath()%>/admin/login.do" method="post">
		    <img class="mb-4" src="<%= request.getContextPath() %>/images/logo.png" alt="logo" width="400">
		    <h1 class="h3 mb-3 fw-normal" align="left">관리자 로그인</h1>
		
		    <div class="form-floating">
		      <input type="text" class="form-control" id="floatingInput" placeholder="아이디 입력" name="id">
		      <label for="floatingInput">아이디</label>
		    </div><br>
		    <div class="form-floating">
		      <input type="password" class="form-control" id="floatingPassword" placeholder="패스워드 입력" name="password">
		      <label for="floatingPassword">비밀번호</label>
		    </div><br>
		    <button class="btn btn-primary w-100 py-2" type="submit">로그인</button>
		  </form>
		</main>
	</div>
</body>
</html>