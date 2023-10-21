<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의</title>
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
			$("#updateBTN").click(function() {
			    // 입력 필드에서 값을 가져옵니다.
			    
			    var idx = $("#idx").val();
			    var type = $("#type").val();
			    var title = $("#title").val();
			    var contents = $("#contents").val();
			    var userid = $("#userid").val();
			    var answer = $("#answer").val();
			    var updatedate = new Date(); // 현재 날짜 및 시간 정보를 가지는 Date 객체 생성
			    var formattedupdatedate = updatedate.toISOString();
			    
			    var data = {
			    		idx: idx,
			    		type: type,
			    		title: title,
			    		contents: contents,
			    		userid: userid,
			    		answer: answer,
			    		updatedate: updatedate
			        };
			    // 데이터를 저장하기 위한 AJAX 요청 수행
			   if(confirm("처리 상태를 변경하시겠습니까 ?")){
			    $.ajax({
			      url: "<%= request.getContextPath() %>/admin/updatequestion.do", // 저장 처리를 담당하는 URL로 변경해야 합니다.
	                method: "POST",
	                data: JSON.stringify(data),
	                contentType: "application/json",
	                dataType: "json",
			      success: function(response) {
// 			       var json = JSON.parse(response);
			        var json = response;
// 			        alert(json);
			        if (json.result == "success") {
			        	//alert("공지가 성공적으로 저장되었습니다!");
				        //window.location.href = "<%= request.getContextPath() %>/admin/question.do";
				        window.location.reload();
					}
			      },
			      error: function(xhr, status, error) {
			        // 저장 실패 시 처리
			        alert("처리 상태 변경에  실패했습니다: " + error);
			      }
			    });
// 			    alert(idx);
				    }else{
				        alert("취소 되었습니다.");
				    }
			  });
			
			
			
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
					alert("삭제 할 이벤트를 체크하세요.");
				} else {
					if (confirm("삭제하시겠습니까?")) {
						//var url = '<%= request.getContextPath() %>/admin/deleteQuest.do?delData=' + delIds.substr(1, delIds.length);
						var url = '<%= request.getContextPath() %>/admin/deleteQuest.do';
						
						fetch(url, {
							method: "delete",
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
					  			window.location= '<%= request.getContextPath() %>/admin/question.do';
					  		}
					  	})
					  	.catch((error) => console.log("error:", alert(error)));
					}
				}
				
			});
			
			$("#questionModal").on("hidden.bs.modal", function () {
				$("#title").val("");
				$("#content").val("");
		  		$("#url").val("");
		  		$("#file").val("");
			});
			
		});
	// 데이터 가져오기 	
		function questionget(idx) {
			$("#idx").val(idx);
			// 데이터를 저장하기 위한 AJAX 요청 수행
		    $.ajax({
		      url: "<%= request.getContextPath() %>/getquestion.do", // 저장 처리를 담당하는 URL로 변경해야 합니다.
		      method: "GET",
		      data: {
		    	  idx: idx
		      },
		      success: function(response) {
			       
// 			       var json = JSON.parse(response);
					var json = response;
// 					alert(json);
		        	$("#userid").val(json.userid);
		        	$("#title").val(json.title);
		        	$("#contents").val(json.contents);
		        	$("#type").val(json.type);
		        	$("#answer").val(json.answer);
		        	
		        	$("#name").val(json.name);
		        	$("#phone").val(json.phone);
		        	
		        	$("#email").attr("href", "mailto:" + json.email);
		      },
		      error: function(xhr, status, error) {
		        alert("내용 수정 실패했습니다: " + error);
		      }
		    });
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
            	<form action="<%= request.getContextPath() %>/admin/question.do" method="get">
            	<div class="input-group" style="margin-bottom: 30px;">
            		<span class="input-group-text">유형</span>
            		<select class="form-select" name="type">
					  	<option value="ALL" ${ param.type == "ALL" ? "selected" : "" }>전체</option>
					    <option value="예약" ${ param.type == "예약" ? "selected" : "" }>예약</option>
					    <option value="불만" ${ param.type == "불만" ? "selected" : "" }>불만</option>
					    <option value="기타" ${ param.type == "기타" ? "selected" : "" }>기타</option>
				  	</select>
			  		<span class="input-group-text">제목</span>
			  		<input type="text" aria-label="title" class="form-control" name="title" value="${param.title}">
			  		<span class="input-group-text">아이디</span>
			  		<input type="text" aria-label="userid" class="form-control" name="userid" value="${param.userid}">
			  		<span class="input-group-text">상태</span>
            		<select class="form-select" name="answer">
					  	<option value="ALL" ${ param.answer == "ALL" ? "selected" : "" }>전체</option>
					    <option value="미확인" ${ param.answer == "미확인" ? "selected" : "" }>미확인</option>
					    <option value="처리중" ${ param.answer == "처리중" ? "selected" : "" }>처리중</option>
					    <option value="답변완료" ${ param.answer == "답변완료" ? "selected" : "" }>답변완료</option>
				  	</select>
				  	<button class="btn btn-primary" type="submit" id="btnSearch" style="width: 100px;">검색</button>
				</div>
				</form>
				
				<div class="float-start" role="group" aria-label="Basic example" style="padding-top: 10px;">
					<span>전체: ${requestScope.totalCount} 개</span>
            	</div>
				<div class="btn-group float-end" role="group" aria-label="Basic example">
				    <button id="del" class="btn btn-danger" style="width: 100px;">삭제</button>
            	</div><br><br>
				
            	<table class="table table-striped table-hover">
	            	<thead class="table-dark">
	            		<tr>
	            			<th width="50"><input type="checkbox" id="allCheck"/></th>
	            			<th>타입</th>
	            			<th>제목</th>
	            			<th>내용</th>
	            			<th>아이디</th>
	            			<th>회원명</th>
	            			<th>전화번호</th>
	            			<th>이메일</th>
	            			<th>상태</th>
	            			<th>등록일</th>
	            			<th>답변일</th>
	            		</tr>
	            	</thead>
	            	<tbody class="table-group-divider">
	            		<c:forEach var="item" items="${list}">
	            		<tr>
	            			<td width="50"><input type="checkbox" class="check" value="${item.idx}"/></td>
	            			<td>${item.type}</td>
	            			<td align="center">
								<c:set var="title" value="${fn:replace(item.title, '<', '&lt;')}" />
								<c:set var="title" value="${fn:replace(title, '>', '&gt;')}" />
								${title}
							</td>
							<td align="center">
								<c:set var="contents" value="${fn:replace(item.contents, '<', '&lt;')}" />
								<c:set var="contents" value="${fn:replace(contents, '>', '&gt;')}" />
								${contents}
							</td>
	            			<td>${item.userid}</td>
	            			<td>${item.name}</td>
	            			<td>${item.phone}</td>
	            			<td>${item.email}</td>
	            			<td><span class="questionIds" style="color: blue; cursor: pointer;" onclick="questionget(${item.idx})" data-bs-toggle="modal" data-bs-target="#questionModal">${item.answer}</span></td>
	            			<td align="center">
								<fmt:formatDate value="${item.regdate}" pattern="yyyy:MM:dd(E)" />
							</td>
							<td align="center">
								<fmt:formatDate value="${item.updatedate}" pattern="yyyy:MM:dd(E)" />
							</td>
	            		</tr>
	            		</c:forEach>
	            	</tbody>
	            </table>
	            
            	<nav aria-label="Page navigation">${ paging }</nav>
            </div>
            
        </div>
    </div>
    
	<!-- Modal -->
	<div class="modal fade" id="questionModal" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="ModalLabel">문의 내용</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<input type="hidden" id="idx">
          	<div class="input-group mb-3">
		    	<div class="form-floating">
			      <input type="text" class="form-control vaildation" readonly="readonly" id="userid" placeholder="아이디" name="userid" maxlength="20"/>
			      <label for="floatingInput">아이디</label>
			    </div>
			</div>
			<div class="input-group mb-3">
		    	<div class="form-floating">
			      <input type="text" class="form-control vaildation" readonly="readonly" id="name" placeholder="이름" name="name" maxlength="20"/>
			      <label for="floatingInput">이름</label>
			    </div>
			</div>
			<div class="input-group mb-3">
		    	<div class="form-floating">
			      <input type="text" class="form-control vaildation" readonly="readonly" id="phone" placeholder="전화번호" name="phone" maxlength="20"/>
			      <label for="floatingInput">전화번호</label>
			    </div>
			</div>
          	<div class="input-group mb-3">
			    <div class="form-floating">
			      <input type="text" class="form-control vaildation" readonly="readonly" id="title" placeholder="제목" name="title" maxlength="100">
			      <label for="floatingInput">제목</label>
			    </div>
		    </div>
		    <div class="input-group mb-3">
				<div class="form-floating">
					<textarea class="form-control" id="contents" name="contents" readonly="readonly" placeholder="내용" id="floatingTextarea" style="height: 300px; resize: none;"></textarea>
					 <label for="floatingSubject">내용</label>
				</div>
		    </div>
			<div class="input-group mb-3">
			  <div class="form-floating">
			    <select class="form-select" id="answer" name="answer">
			      <option value="미확인">미확인</option>
			      <option value="처리중">처리중</option>
			      <option value="답변완료">답변완료</option>
			    </select>
			    <label for="answer">상태</label>
			  </div>
			</div>
	      </div>
	      <div class="modal-footer">
	      	<a href="mailto:" class="btn btn-warning" id="email">답변</a>
	      	<button type="button" class="btn btn-primary" id="updateBTN" >저장</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
</body>
</html>




