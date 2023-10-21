<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="<%= request.getContextPath()%>/img/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/styles.css"/>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/common.css"/>
    
    <script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery-3.7.0.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath()%>/js/common.js"></script> 
	
	
	<script type="text/javascript">
		$(() => {
			$("#allCheck").click(function () {
				if ($(this).is(":checked")) {
					$(".check").prop("checked", true);
				} else {
					$(".check").prop("checked", false);
				}
			});
			
			$(".check").click(function () {
				if (!$(this).is(":checked")) {
					$("#allCheck").prop("checked", false);
				}
			});
			
			$("#del").click(function () {
				var delIds = "";
				$(".check").each(function (index) {
					if ($(this).is(":checked")) {
						delIds += "," + $(this).val();
						//delIds += ",'" + $(this).val() + "'";
					}
				});
				
				if (delIds == "") {
					alert("삭제 할 회원을 체크하세요.");
				} else {
					if (confirm("삭제하시겠습니까?")) {
						var url = '<%= request.getContextPath() %>/admin/memberDelete.do';
						
						fetch(url, {method: "delete",
							headers: {
				            	'Accept': 'application/json', 
				            	'Content-Type': 'application/json'
				          	},
					        body: delIds.substr(1, delIds.length)
						})
				  		.then((response) => {
						  	return response.json();
					  	})
					  	.then((json) => {
					  		if (json.result == "success") {
					  			window.location= '<%= request.getContextPath() %>/admin/member.do';
					  		}
					  	})
					  	.catch((error) => console.log("error:", alert(error)));
					}
				}
				
			});
			
			$("#memberModal").on("hidden.bs.modal", function () {
				$("#idx").val("");
				$("#id").val("");
		  		$("#name").val("");
		  		$("#password").val("");
		  		$("#jumin1").val("");
		  		$("#jumin2").val("");
		  		$("#postcode").val("");
		  		$("#addr1").val("");
		  		$("#addr2").val("");
		  		$("#email1").val("");
		  		$("#email2").val("");
		  		$("#phone").val("");
		  		$("#useYN").val("");
		  		$("#regdate").val("");
			});
			
		});
		
		function getMember(idx) {
			$("#idx").val(idx);
			
			var url = '<%= request.getContextPath() %>/admin/memberInfo.do?idx=' + idx;
			
			fetch(url, {method: "get"})
	  		.then((response) => {
	  			
			  	return response.json();
		  	})
		  	.then((json) => {
		  		//alert(JSON.stringify(json));
		  		
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
		  	})
		  	.catch((error) => console.log("error:", alert(error)));
			
		}
		
		function lengthCheck(obj) {
			if (obj.value.length > obj.maxLength){
				obj.value = obj.value.slice(0, obj.maxLength);
		    }   
		}
		
		function emailChange(obj) {
			$("#email2").val(obj.value);
		}
		
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
			
			var warning = $("<span style='color:red; position: absolute; top: 8px; left: 280px; z-index:3;'>문자,숫자,특수문자 포함 8~12자리를 입력하세요.</span>");
			$(obj).after(warning);
			
			var pw = $(obj).val();
			var num = pw.search(/[0-9]/g);
			var eng = pw.search(/[a-z]/ig);
			var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
			
			if (pw.length > 7 && (num>-1 && eng>-1 && spe>-1)) {
				$(obj).next().remove("span");
			}
		}
		
		function memberSave() {
			var pwdValidation = false;
			var pw = $("#password").val();
			var num = pw.search(/[0-9]/g);
			var eng = pw.search(/[a-z]/ig);
			var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
			if (pw.length > 7 && (num>-1 && eng>-1 && spe>-1)) {
				pwdValidation = true;
			}
			
			var submitBool = onSubmit();
			if (submitBool && pwdValidation) {
				if (confirm("저장 하시겠습니까?")) {
					var para = {
			        	idx: $("#idx").val(),
			        	id: $("#id").val(),
						name: $("#name").val(),
						password: $("#password").val(),
						jumin1: $("#jumin1").val(),
						jumin2: $("#jumin2").val(),
						postcode: $("#postcode").val(),
						addr1: $("#addr1").val(),
						addr2: $("#addr2").val(),
						email1: $("#email1").val(),
						email2: $("#email2").val(),
						phone: $("#phone").val(),
						useYN: $("#useYN").val(),
						regdate: $("#regdate").val()
			        };
					
					var url = '<%= request.getContextPath() %>/admin/memberUpdate.do';
					<%-- var url = '<%= request.getContextPath() %>/admin/member.do?' + para; --%>
					
					fetch(url, {method: "PUT",
						headers: {
			            	'Accept': 'application/json', 
			            	'Content-Type': 'application/json'
			          	},
				        body: JSON.stringify(para)
					})
			  		.then((response) => {
					  	return response.json();
				  	})
				  	.then((json) => {
				  		//alert(JSON.stringify(json));
				  		
				  		if (json.result == "success") {
				  			var modal = bootstrap.Modal.getInstance($('#memberModal'));
							modal.toggle();
							
					  		window.location.reload();
				  		}
				  		
				  	})
				  	.catch((error) => console.log("error:", alert(error)));
				  	
				}
			}
			
		}
		
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
            
            <%-- <%
				out.println(request.getAttribute("list"));
            %>
            회원 --%>
            
            <div class="table-responsive" style="padding: 20px;">
            	<form action="<%= request.getContextPath() %>/admin/member.do" method="get">
            	<div class="input-group" style="margin-bottom: 30px;">
			  		<span class="input-group-text">아이디</span>
			  		<input type="text" aria-label="First name" class="form-control" name="id" value="${param.id}">
				  	<span class="input-group-text">이름</span>
				  	<input type="text" aria-label="Last name" class="form-control" name="name" value="${param.name}">
				  	<span class="input-group-text">휴대폰번호</span>
				  	<input type="text" aria-label="Last name" class="form-control" name="phone" value="${param.phone}">
				  	<span class="input-group-text">회원유무</span>
				  	<select class="form-select" name="useYN">
					  	<option value="ALL" ${ param.useYN == "ALL" ? "selected" : "" }>전체</option>
					    <option value="Y" ${ param.useYN == "Y" ? "selected" : "" }>회원</option>
					    <option value="N" ${ param.useYN == "N" ? "selected" : "" }>탈퇴</option>
				  	</select>
				  	<button class="btn btn-primary" type="submit" id="btnSearch" style="width: 100px;">검색</button>
				</div>
				</form>
				
				<div class="float-start" role="group" aria-label="Basic example" style="padding-top: 10px;">
					<span>전체: ${requestScope.totalCount} 개</span>
            	</div>
				<div class="btn-group float-end" role="group" aria-label="Basic example">
					<!-- <button id="add" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#memberModal" style="width: 100px;">추가</button> -->
				    <button id="del" class="btn btn-danger" style="width: 100px;">삭제</button>
            	</div><br><br>
				
            	<table class="table table-striped table-hover">
	            	<thead class="table-dark">
	            		<tr>
	            			<th width="50"><input type="checkbox" id="allCheck"/></th>
	            			<th>아이디</th>
	            			<th>성명</th>
	            			<th>비밀번호</th>
	            			<th>주민번호1</th>
	            			<th>주민번호2</th>
	            			<th>우편번호</th>
	            			<th>주소1</th>
	            			<th>주소2</th>
	            			<th>이메일</th>
	            			<th>휴대폰번호</th>
	            			<th>회원유무</th>
	            			<th>등록일</th>
	            			<th>수정일</th>
	            		</tr>
	            	</thead>
	            	<tbody class="table-group-divider">
	            		<c:forEach var="item" items="${list}">
	            		<tr>
	            			<td width="50"><input type="checkbox" class="check" value="${item.idx}"/></td>
	            			<td>
	            				<span class="memberIds" onclick="getMember(${item.idx})" 
	            					data-bs-toggle="modal" data-bs-target="#memberModal">${item.id}
	            				</span>
            				</td>
	            			<td>${item.name}</td>
	            			<td>${item.password}</td>
	            			<td align="center">${item.jumin1}</td>
	            			<td align="center">${item.jumin2}</td>
	            			<td>${item.postcode}</td>
	            			<td>${item.addr1}</td>
	            			<td>${item.addr2}</td>
	            			<td><c:out value="${item.email1}@${item.email2}"/></td>
	            			<td>${item.phone}</td>
	            			<td align="center">${item.useYN == "Y" ? "회원" : "탈퇴"}</td>
	            			<td align="center">${item.regdate}</td>
	            			<td align="center">${item.updatedate}</td>
	            		</tr>
	            		</c:forEach>
	            	</tbody>
	            </table>
	            
            	<nav aria-label="Page navigation">${ paging }</nav>
            </div>
            
        </div>
    </div>
    
	<!-- Modal -->
	<div class="modal fade" id="memberModal" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="ModalLabel">회원 정보</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
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
			  <span class="input-group-text" style="padding-top: 15px;">@</span>
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
			  	<input type="button" id="btnPostCode" class="btn btn-outline-primary" onclick="postCode()" value="우편번호 찾기"/>
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
	  		
	  		<div class="input-group mb-3">
		  		<div class="form-floating">
		  			<select class="form-select" name="useYN" id="useYN">
					    <option value="Y">회원</option>
					    <option value="N">탈퇴</option>
				  	</select>
		  			<label for="floatingInput">회원 유무</label>
		  		</div>
	  		</div>
	  		
	  		<div class="input-group mb-3">
				<div class="form-floating">
		  			<input type="text" class="form-control vaildation" id="regdate" placeholder="회원 가입일" name="regdate" disabled="disabled">
		  			<label for="floatingInput">회원 가입일</label>
		  		</div>
	  		</div>
	  		
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary" onclick="memberSave()">저장</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
</body>
</html>




