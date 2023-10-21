<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>직원 관리</title>
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
	<style type="text/css">
		.userIds {
			cursor: pointer;
			color: rgb(13,110,253);
		}
	</style>
	
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
					alert("삭제 할 사원을 체크하세요.");
				} else {
					if (confirm("삭제하시겠습니까?")) {
						var url = '<%= request.getContextPath() %>/admin/userDelete.do';
						
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
					  			window.location= '<%= request.getContextPath() %>/admin/user.do';
					  		}
					  	})
					  	.catch((error) => console.log("error:", alert(error)));
					}
				}
				
			});
			
			$("#userModal").on("hidden.bs.modal", function () {
		  		$("#idx").val("");
		  		$("#id").val("");
		  		$("#password").val("");
		  		$("#position").val("");
		  		$("#name").val("");
		  		$("#phone").val("");
		  		$("#email").val("");
			});
			
		});
		
		function getUser(idx) {
			$("#idx").val(idx);
			
			var url = '<%= request.getContextPath() %>/admin/userInfo.do?idx=' + idx;
			
			fetch(url, {method: "get"})
	  		.then((response) => {
			  	return response.json();
		  	})
		  	.then((json) => {
		  		//alert(JSON.stringify(json));
		  		
		  		$("#idx").val(json.idx);
	  			$("#id").val(json.id);
		  		$("#password").val(json.password);
		  		$("#position").val(json.position);
		  		$("#name").val(json.name);
		  		$("#phone").val(json.phone);
		  		$("#email").val(json.email);
		  	})
		  	.catch((error) => console.log("error:", alert(error)));
			
		}
		
		function lengthCheck(obj) {
			if (obj.value.length > obj.maxLength){
				obj.value = obj.value.slice(0, obj.maxLength);
		    }   
		}
		  	
	 	function userSave() {
     		var submitBool = onSubmit();
         	if (submitBool) {
            	if (confirm("저장 하시겠습니까?")) {
	                //var para = new URLSearchParams({
	               var para = {
	            		idx: $("#idx").val(),
	    	           	id: $("#id").val(),
	    	            password: $("#password").val(),
	    	            position: $("#position").val(),
	    	            name: $("#name").val(),
	    	            phone: $("#phone").val(),
	    	            email: $("#email").val(),
               		};
	               console.log(para)
	               //var url = '<%= request.getContextPath() %>/admin/userInsert.do';
	               var url = '<%= request.getContextPath() %>/admin/' + ($("#idx").val()=="" ? 'userInsert.do' : 'userUpdate.do');
	               
	               	fetch(url, {method: $("#idx").val()=="" ? 'POST' : 'PUT',
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
	                       	var modal = bootstrap.Modal.getInstance($('#userModal'));
                     		modal.toggle();
	                     
	                       	window.location.reload();
	                    }
	                })
	                .catch((error) => console.log("error:", alert(error)));
               }
            }
         }
	        
	</script>
</head>
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
            	<form action="<%= request.getContextPath() %>/admin/user.do" method="get">
            	<div class="input-group" style="margin-bottom: 30px;">
            		<span class="input-group-text">사번</span>
			  		<input type="text" aria-label="First name" class="form-control" name="id" value="${param.id}">
				  	<span class="input-group-text">이름</span>
				  	<input type="text" aria-label="Last name" class="form-control" name="name" value="${param.name}">
				  	<span class="input-group-text">휴대폰번호</span>
				  	<input type="text" aria-label="Last name" class="form-control" name="phone" value="${param.phone}">
				  	<button class="btn btn-primary" type="submit" id="btnSearch" style="width: 100px;">검색</button>
				</div>
				</form>
				
				<div class="float-start" role="group" aria-label="Basic example" style="padding-top: 10px;">
					<span>전체: ${requestScope.totalCount} 개</span>
            	</div>
				<div class="btn-group float-end" role="group" aria-label="Basic example">
					<button id="add" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#userModal" style="width: 100px;">추가</button>
				    <button id="del" class="btn btn-danger" style="width: 100px;">삭제</button>
            	</div><br><br>
				
            	<table class="table table-striped table-hover">
	            	<thead class="table-dark">
	            		<tr>
	            			<th><input type="checkbox" id="allCheck"/></th>
	            			<th>사번</th>
	            			<th>비밀번호</th>
	            			<th>직급</th>
	            			<th>이름</th>
	            			<th>휴대폰번호</th>
	            			<th>Email</th>
	            		</tr>
	            	</thead>
	            	<tbody class="table-group-divider">
	            		<c:forEach var="item" items="${list}">
	            		<tr>
	            			<td><input type="checkbox" class="check" value="${item.idx}"/></td>
	            			<td>
	            				<span class="userIds" onclick="getUser(${item.idx})" 
	            					data-bs-toggle="modal" data-bs-target="#userModal">${item.id}
	            				</span>
            				</td>
	            			<%-- <td>${item.id}</td> --%>
	            			<td>${item.password}</td>
	            			<td>${item.position}</td>
	            			<td>${item.name}</td>
	            			<td>${item.phone}</td>
	            			<td>${item.email}</td>
	            		</tr>
	            		</c:forEach>
	            	</tbody>
	            </table>
	            
            	<nav aria-label="Page navigation">${ paging }</nav>
            </div>
            
        </div>
    </div>
    
	<!-- Modal -->
	<div class="modal fade" id="userModal" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="ModalLabel">직원 정보</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
    	 <div class="modal-body">
			<input type="hidden" id="idx"/>
            <div class="input-group mb-3">
             	<div class="form-floating">
	               <input type="text" class="form-control vaildation" id="id" placeholder="사번" name="id" maxlength="20"/>
	               <label for="floatingInput">사번</label>
             	</div>
         	</div>
          	<div class="input-group mb-3">
	             <div class="form-floating">
	               <input type="text" class="form-control vaildation" id="password" placeholder="비밀번호" name="password" maxlength="20">
	               <label for="floatingName">비밀번호</label>
	             </div>
          	</div>
          	<div class="input-group mb-3">
	             <div class="form-floating">
	               <input type="text" class="form-control vaildation" id="position" placeholder="직급" name="position" maxlength="20">
	               <label for="floatingName">직급</label>
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
	               <input type="number" class="form-control vaildation" id="phone" placeholder="휴대폰번호" name="phone" maxlength="11" oninput="lengthCheck(this)">
	               <label for="floatingName">휴대폰번호</label>
	             </div>
          	</div>
          	<div class="input-group mb-3">
	             <div class="form-floating">
	               <input type="text" class="form-control vaildation" id="email" placeholder="이메일" name="email" maxlength="40">
	               <label for="floatingName">이메일</label>
	             </div>
          	</div>
    	  </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary" onclick="userSave()">저장</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
</body>
</html>




