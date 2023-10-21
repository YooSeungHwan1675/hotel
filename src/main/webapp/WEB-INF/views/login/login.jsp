<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.7.0.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath()%>/js/common.js"></script>
	 
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
 	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<style type="text/css">
		/* .btn {
			background-color: rgb(29, 128, 159);
		}
		
		.btn:hover {
			background-color: rgba(29, 128, 159, 0.8);
		} */
	</style>
	<script type="text/javascript">
		$(() => {
			var cookies = document.cookie.split('; ');
			var remember = "";
			var memberID = "";
			
			$.each(cookies, function (index, item) {
				var cookie = item.split('=');
				
				if (cookie[0] == "remember") {
					remember = cookie[1]; 
				}
				
				if (cookie[0] == "memberID") {
					memberID = cookie[1]; 
				}
			});
			
			if (remember == "Y") {
				$("#floatingInput").val(memberID);
				$("#flexCheckDefault").attr("checked", "checked");
			}
			
			var msg = "${msg}";
			
			if (msg != "") {
				alert(msg);
				window.location.href= "<%= request.getContextPath()%>/login/login.do";
			}
		});
	</script>
</head>
<body>
	<div class="container-sm" style="height: 100vh;">
		<main class="form-signin w-60 m-auto" align="center" style="width: 500px; position: relative; top: 25%">
		  <form action="<%= request.getContextPath()%>/login/login.do" method="post" onsubmit="return onSubmit()">
		    <img class="mb-4" src="<%= request.getContextPath() %>/images/logo.png" alt="" width="400">
		    
		    <div class="form-floating">
		      <input type="text" class="form-control vaildation" id="floatingInput" placeholder="아이디" name="id">
		      <label for="floatingInput">아이디</label>
		    </div><br>
		    <div class="form-floating">
		      <input type="password" class="form-control vaildation" id="floatingPassword" placeholder="비밀번호" name="password">
		      <label for="floatingPassword">비밀번호</label>
		    </div>
		
		    <div class="form-check text-start my-3">
		      <input class="form-check-input" type="checkbox" value="Y" id="flexCheckDefault" name="remember">
		      <label class="form-check-label" for="flexCheckDefault">아이디 기억</label>
		    </div>
		    <button class="btn btn-primary w-100 py-2" type="submit">로그인</button>
		    
		    <div class="row" style="margin-top: 10px;">
			  <div class="col">
			    
			    <!-- 네이버 로그인 버튼 노출 영역 -->
  				<div id="naver_id_login">
                    <button type ="button" class = "btn" onclick="location.href='${url}'">
                    		<img src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"
							width="233"/>
                    </button>
  				</div>
			  	</div>
			  	
			</div>
			
		    
		    <br>
		    <p class="mt-5 mb-3 text-body-secondary" style="display: inline; margin-top: 10px;">
		    	<label style="float: left;">더조은 호텔에 오신 것을 환영합니다.</label>
		    	<a href="<%= request.getContextPath() %>/login/register.do" style="float: right; text-decoration: none;">회원가입</a>
	    	</p>
		  </form>
		</main>
	</div>
</body>
</html>