<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
	<style type="text/css">
		
	</style>
	<script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery-3.7.0.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath()%>/js/common.js"></script> 
	<script>
		$(() => {
			var pwd = prompt("비밀번호를 입력하세요.");
			
			if (pwd == null) {
				window.history.back();
			} else {
				//var url = '<%= request.getContextPath() %>/member/info.do?id=${sessionScope.memberID}';
				var url = '<%= request.getContextPath() %>/member/info.do?id=${sessionScope.memberID}&password=' + pwd;
				
				fetch(url, {method: "get"})
		  		.then((response) => {
				  	return response.json();
			  	})
			  	.then((json) => {
			  		//alert(JSON.stringify(json));
			  		if (json.result == "failed") {
						alert("비밀번호를 확인하세요.");
						window.location.reload();
					} else {
						$("#idx").val(json.idx);
			  			$("#id").val(json.id);
				  		$("#name").val(json.name);
				  		$("#password").val(json.password);
				  		$("#jumin1").val(json.jumin1);
				  		$("#jumin2").val(json.jumin2);
				  		$("#postcode").val(json.postcode);
				  		$("#addr1").val(json.addr1);
				  		$("#addr2").val(json.addr2);
				  		$("#email1").val(json.email1);
				  		$("#email2").val(json.email2);
				  		$("#phone").val(json.phone);
				  		$("#useYN").val(json.useYN);
				  		$("#regdate").val(json.regdate);
					}
			  	})
			  	.catch((error) => console.log("error:", alert(error)));
			}
			
		});
		
		function postCode() {
			new daum.Postcode({
		        oncomplete: function(data) {
		            $("input[name=postcode]").val(data.zonecode);
		            $("input[name=addr1]").val(data.address);
		        }
		    }).open();
			
			return;
		}
		
		function passwordValidation(obj) {
			$(obj).next().remove("span");
			
			var warning = $("<span style='color:red; position: absolute; top: 8px; left: 300px;'>문자,숫자,특수문자 포함 8~12자리를 입력하세요.</span>");
			$(obj).after(warning);
			
			var pw = $(obj).val();
			var num = pw.search(/[0-9]/g);
			var eng = pw.search(/[a-z]/ig);
			var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
			
			if (pw.length > 7 && (num>-1 && eng>-1 && spe>-1)) {
				$(obj).next().remove("span");
			}
		}
		
		function passwordCheck(obj) {
			$(obj).next().remove("span");
			
			var warning = $("<span style='color:red; position: absolute; top: 20px; left: 300px;'>비밀번호를 확인하세요.</span>");
			$(obj).after(warning);
			
			if ($("#password").val() == $(obj).val()) {
				$(obj).next().remove("span");
			}
		}
		
		function lengthCheck(obj) {
			if (obj.value.length > obj.maxLength){
				obj.value = obj.value.slice(0, obj.maxLength);
		    }   
		}
		
		function emailChange(obj) {
			$("#email2").val(obj.value);
		}
		
		function submitConfirm() {
			if ($("#password").val() == $("#passwordConfirm").val()) {
				$("#postcode").attr("disabled", false);
				$("#addr1").attr("disabled", false);
				
				var submitBool = onSubmit();	
				if (submitBool) {
					if (confirm("수정 하시겠습니까?")) {
						return submitBool;
					}
					return false;
				} else {
					$("#postcode").attr("disabled", true);
					$("#addr1").attr("disabled", true);
				}
				
				return submitBool;
			} else {
				alert("비밀번호를 확인하세요.");
				return false;
			}
			
			return false;
		}
		
		function onWithdraw() {
			if (confirm("탈퇴하시겠습니까?")) {
				var url = '<%= request.getContextPath() %>/member/info.do';
				
				fetch(url, {method: "POST",
					body: new URLSearchParams({idx: "night"})
				})
		  		.then((response) => {
				  	return response.json();
			  	})
			  	.then((json) => {
			  		alert(JSON.stringify(json));
			  		
		  			if (json.result == "success") {
						
					}
			  	})
			  	.catch((error) => console.log("error:", alert(error)));
			}
		}
	</script>
</head>
<body>
	<div class="container-sm">
		<main class="form-signin w-60 m-auto" align="center" style="width: 500px;">
		  <img class="mb-4" src="<%= request.getContextPath() %>/images/logo.png" alt="" width="280" style="position:relative; top:30px;">
		  <form action="<%= request.getContextPath()%>/login/register.do" method="post" onsubmit="return submitConfirm()">
		  	<img class="mb-4" src="<%= request.getContextPath()%>/images/logo.gif" alt="" width="200">
		  	
		  	<input type="hidden" id="idx">
		  	
		  	<div class="input-group mb-3">
		    	<div class="form-floating">
			      <input type="text" class="form-control vaildation" id="id" placeholder="아이디" name="id" disabled="disabled"/>
			      <label for="floatingInput">아이디</label>
			    </div>
			</div>
			<div class="input-group mb-3">
			    <div class="form-floating">
			      <input type="password" class="form-control vaildation" id="password" placeholder="패스워드" name="pwd" maxlength="12" onfocus="passwordValidation(this)" onchange="passwordValidation(this)">
			      <label for="floatingPassword">비밀번호</label>
			    </div>
		    </div>
		    <div class="input-group mb-3">
			    <div class="form-floating">
			      <input type="password" class="form-control vaildation" id="passwordConfirm" placeholder="패스워드 확인" name="pwd2" maxlength="12" onfocus="passwordCheck(this)" onchange="passwordCheck(this)">
			      <label for="floatingPassword">비밀번호 확인</label>
			    </div>
		    </div>
		    <div class="input-group mb-3">
			    <div class="form-floating">
			      <input type="text" class="form-control vaildation" id="name" placeholder="이름" name="name" maxlength="20">
			      <label for="floatingName">이름</label>
			    </div>
		    </div>
		    <div class="input-group mb-3">
			    <div class="form-floating">
			      <input type="number" class="form-control vaildation" id="phone" placeholder="핸드폰 번호" name="phone" maxlength="11" oninput="lengthCheck(this)">
			      <label for="floatingPhoneNumber">핸드폰 번호</label>
			    </div>
		    </div>
		    <div class="input-group mb-3">
			  <div class="form-floating">
			      <input type="text" class="form-control vaildation" id="email1" placeholder="email1" name="email1">
			      <label for="floatingEmail">이메일</label>
			  </div>
			  <span class="input-group-text">@</span>
			  <div class="form-floating">
			      <input type="text" class="form-control vaildation" id="email2" placeholder="email2" name="email2">
			      <label for="floatingEmail">이메일</label>
			  </div>
			  <select class="form-select" aria-label="메일 선택" onchange="emailChange(this)">
			  	<option value="" selected>직접 입력</option>
			  	<option value="naver.com">naver.com</option>
			  	<option value="gmail.com">gmail.com</option>
			  	<option value="nate.com">nate.com</option>
			  </select>
			</div>
		    <div class="input-group mb-3">
		    	<div class="form-floating">
			      <input type="number" class="form-control vaildation" id="jumin1" placeholder="주민번호1" name="jumin1" maxlength="6" oninput="lengthCheck(this)">
			      <label for="floatingJumin1">주민번호1</label>
			    </div>
			  	<div class="form-floating">
			      <input type="password" class="form-control vaildation" id="jumin2" placeholder="주민번호2" name="jumin2" maxlength="7">
			      <label for="floatingJumin2">주민번호2</label>
			    </div>
			</div>
		    <div class="input-group mb-3">
		    	<div class="form-floating">
		  			<input type="text" class="form-control vaildation" id="postcode" placeholder="우편번호" name="postcode" disabled="disabled">
		  			<label for="floatingInput">우편번호</label>
		  		</div>
			  	<span class="input-group-text" id="basic-addon2">
			  		<input type="button" id="btnPostCode" class="btn btn-outline-primary" onclick="postCode()" value="우편번호 찾기"/>
		  		</span>
			</div>
			<div class="input-group mb-3">
				<div class="form-floating">
		  			<input type="text" class="form-control vaildation" id="addr1" placeholder="주소" name="addr1" disabled="disabled">
		  			<label for="floatingInput">주소</label>
		  		</div>
	  		</div>
	  		<div class="input-group mb-3">
		  		<div class="form-floating">
		  			<input type="text" class="form-control vaildation" id="addr2" placeholder="상세 주소" name="addr2">
		  			<label for="floatingInput">상세 주소</label>
		  		</div>
	  		</div>
			
			<div class="row">
			  <div class="col">
			    <button class="btn btn-primary w-100 py-2" type="submit">수정</button>
			  </div>
			  <div class="col">
			    <button class="btn btn-danger w-100 py-2" type="button" onclick="onWithdraw()">탈퇴</button>
			  </div>
			</div>
		    
		    <br><br>
		  </form>
		</main>
	</div>
</body>
</html>