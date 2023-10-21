<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/common.css"/>
    
    <script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery-3.7.0.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath()%>/js/common.js"></script> 
	<style type="text/css">
		.roomnos {
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
					alert("삭제 할 방을 체크하세요.");
			} else {
				if (confirm("삭제하시겠습니까?")) {
					var url = '<%= request.getContextPath() %>/admin/deleteroom.do';
					
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
				  			window.location= '<%= request.getContextPath() %>/admin/room.do';
				  		}
				  	})
				  	.catch((error) => console.log("error:", alert(error)));
					}
				}
				
			});
			
			$("#roomModal").on("hidden.bs.modal", function () {
				$("#idx").val("");
				$("#roomno").val("");
				$("#type").val("");
		  		$("#size").val("");
		  		$("#capacity").val("");
		  		$("#price").val("");
		  		$("#number").val("");
		  		$("#regdate").val("");
			});
		});
		
		function getRoom(idx) {
			$("#idx").val(idx);
			
			var url = '<%= request.getContextPath() %>/admin/getroom.do?idx=' + idx;
			
			fetch(url, {method: "get"})
	  		.then((response) => {
			  	return response.json();
		  	})
		  	.then((json) => {
		  		//alert(JSON.stringify(json));
		  		  		
		  	 	$("#roomno").val(json.roomno);
            	$("#type").val(json.type);
            	$("#size").val(json.size);
            	$("#capacity").val(json.capacity);
            	$("#price").val(json.price);
            	$("#number").val(json.number);
            	$("#regdate").val(json.regdate);
		  	})
		  	.catch((error) => console.log("error:", alert(error)));
			
		}
		
		function roomSave() {
					    // onSubmit() 함수 실행 및 결과 저장 -> 어디있는 함수지?? 커먼.
					    var submitBool = onSubmit();
					    
					    // 만약 onSubmit()이 true이고 비밀번호 검증도 통과하면 아래 코드 실행 && pwdValidation
					    if (submitBool) {
					        if (confirm("저장 하시겠습니까?")) {
			            		//var para = new URLSearchParams({
			            		var para = {
			            			idx: $("#idx").val(),
					            	roomno: $("#roomno").val(),
					            	type: $("#type").val(),
					            	size: $("#size").val(),
					            	capacity: $("#capacity").val(),
					            	price: $("#price").val(),
					            	number: $("#number").val(),
					             	regdate: $("#regdate").val(),
					            };
					            
					            // 서버로 데이터 전송을 위한 URL 설정
	         			      var url = '<%= request.getContextPath() %>/admin/' + ($("#idx").val()=="" ? 'insertroom.do' : 'updateroom.do');
					            
					            // fetch를 이용하여 데이터 전송
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
	        	                       	var modal = bootstrap.Modal.getInstance($('#roomModal'));
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
            	<form action="<%= request.getContextPath() %>/admin/room.do" method="get">
            	<div class="input-group" style="margin-bottom: 30px;">
			  		<span class="input-group-text">객실 번호</span>
			  		<input type="text" aria-label="First name" class="form-control" name="roomno" value="${param.roomno}">
				  	<span class="input-group-text">객실 type</span>
				  	<input type="text" aria-label="Last name" class="form-control" name="type" value="${param.type}">
				  	<span class="input-group-text">인원(명)</span>
				  	<input type="text" aria-label="Last name" class="form-control" name="capacity" value="${param.capacity}">
				  	<span class="input-group-text">가격</span>
				  	<input type="text" aria-label="Last name" class="form-control" name="price" value="${param.price}">
<%-- 나중에 가격범위 얼마 이상 이런거 검색 용 인풋 하나 만들기			
				  	<select class="form-select" name="useYN">
					  	<option value="ALL" ${ param.useYN == "ALL" ? "selected" : "" }>전체</option>
					    <option value="Y" ${ param.useYN == "Y" ? "selected" : "" }>회원</option>
					    <option value="N" ${ param.useYN == "N" ? "selected" : "" }>탈퇴</option>
				  	</select> --%>
				  	<button class="btn btn-primary" type="submit" id="btnSearch" style="width: 100px;">검색</button>
				</div>
				</form>
				
				<div class="float-start" role="group" aria-label="Basic example" style="padding-top: 10px;">
					<span>전체: ${requestScope.totalCount} 개</span>
            	</div>
				<div class="btn-group float-end" role="group" aria-label="Basic example">
					<!-- 
					Bootstrap의 모달 기능을 이용하여 클릭 시 roomModal이라는 ID를 가진 요소가 모달로 나타나도록 설정되어 있는 버튼 -->
					<button id="add" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#roomModal" style="width: 100px;">추가</button>
				    <button id="del" class="btn btn-danger" style="width: 100px;">삭제</button>
            	</div><br><br>
				
            	<table class="table table-striped table-hover">
	            	<thead class="table-dark">
	            		<tr>
	            			<th><input type="checkbox" id="allCheck"/></th>
	            			<th>객실 번호</th>
	            			<th>객실 type</th>
	            			<th>객실 크기(m2)</th>
	            			<th>수용 가능 인원(명)</th>
	            			<th>금액(원)</th>
	            			<th>객실 수(개)</th>
	            			<th>등록일</th>
	            			<th>수정일</th>
	            		</tr>
	            	</thead>
	            	<tbody class="table-group-divider">
	            		<c:forEach var="item" items="${list}">
	            		<tr>
	            			<td><input type="checkbox" class="check" value="${item.idx}"/></td>
	            			<td>
	            				<span class="roomnos" onclick="getRoom(${item.idx})" 
	            					data-bs-toggle="modal" data-bs-target="#roomModal">${item.roomno}
	            				</span>
            				</td>
	            			<td>${item.type}</td>
	            			<td>${item.size}</td>
	            			<td>${item.capacity}</td>
	            			<td>${item.price}</td>
	            			<td>${item.number}</td>
	            			<td>${item.regdate}</td>
	            			<td>${item.updatedate}</td>
	            		</tr>
	            		</c:forEach>
	            	</tbody>
	            </table>
	            
            	<nav aria-label="Page navigation">${ paging }</nav>
            </div>
            
        </div>
    </div>

	<!-- 추가 Modal -->
	<div class="modal fade" id="roomModal" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="ModalLabel">객실 추가</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<input type="hidden" id="idx">
          	<div class="input-group mb-3">
		    	<div class="form-floating">
			      <input type="text" class="form-control vaildation" id="roomno" placeholder="객실 번호" name="roomno"/>
			      <label for="floatingInput">객실 번호</label>
			    </div>
			</div>
          	<div class="input-group mb-3">
			    <div class="form-floating">
			      <input type="text" class="form-control vaildation" id="type" placeholder="객실 type" name="type" >
			      <label for="floatingPassword">객실 type</label>
			    </div>
		    </div>
		    <div class="input-group mb-3">
			    <div class="form-floating">
			      <input type="text" class="form-control vaildation" id="size" placeholder="객실 크기(m2)" name="size" maxlength="20">
			      <label for="floatingName">객실 크기(m2)</label>
			    </div>
		    </div>
		    <div class="input-group mb-3">
			    <div class="form-floating">
			      <input type="number" class="form-control vaildation" id="capacity" placeholder="수용 가능 인원(명)" name="capacity" maxlength="11" >
			      <label for="floatingPhoneNumber">수용 가능 인원(명)</label>
			    </div>
		    </div>
		    <div class="input-group mb-3">
			    <div class="form-floating">
			      <input type="number" class="form-control vaildation" id="price" placeholder="금액(원)" name="price" maxlength="11" >
			      <label for="floatingPhoneNumber">금액(원)</label>
			    </div>
		    </div>
		    <div class="input-group mb-3">
			    <div class="form-floating">
			      <input type="number" class="form-control vaildation" id="number" placeholder="객실 수(개)" name="number" maxlength="11" >
			      <label for="floatingPhoneNumber">객실 수(개)</label>
			    </div>
		    </div>
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary" onclick="roomSave()">저장</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
</body>
</html>




