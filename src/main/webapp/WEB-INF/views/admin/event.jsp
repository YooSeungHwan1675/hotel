<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트</title>
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
					alert("삭제 할 이벤트를 체크하세요.");
				} else {
					if (confirm("삭제하시겠습니까?")) {
						//var url = '<%= request.getContextPath() %>/admin/eventDelete.do?delData=' + delIds.substr(1, delIds.length);
						var url = '<%= request.getContextPath() %>/admin/eventDelete.do';
						
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
					  			window.location= '<%= request.getContextPath() %>/admin/event.do';
					  		}
					  	})
					  	.catch((error) => console.log("error:", alert(error)));
					}
				}
				
			});
			
			$("#eventModal").on("hidden.bs.modal", function () {
				$("#title").val("");
				$("#content").val("");
		  		$("#url").val("");
		  		$("#file").val("");
			});
			
		});
		
		function onSave() {
			if (onSubmit()) {
				if (confirm("저장 하시겠습니까?")) {
					var formData = new FormData();
					formData.append("title", $("#title").val());
					formData.append("content", $("#content").val());
					formData.append("url", $("#url").val());
					formData.append("file", $("#file")[0].files[0]);
					
					var url = "<%= request.getContextPath() %>/admin/eventInsert.do"; 
					fetch(url, {method: "POST",
						headers: {},
	                    body: formData
	               	})
	               	.then((response) => {
	                    return response.json();
	                })
	                .then((json) => {
	                    //alert(JSON.stringify(json));
	                    
	                    if (json.result == "success") {
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
            	<form action="<%= request.getContextPath() %>/admin/event.do" method="get">
            	<div class="input-group" style="margin-bottom: 30px;">
			  		<span class="input-group-text">제목</span>
			  		<input type="text" aria-label="title" class="form-control" name="title" value="${param.title}">
			  		<span class="input-group-text">내용</span>
			  		<input type="text" aria-label="content" class="form-control" name="content" value="${param.content}">
			  		<span class="input-group-text">URL</span>
			  		<input type="text" aria-label="url" class="form-control" name="url" value="${param.url}">
				  	<button class="btn btn-primary" type="submit" id="btnSearch" style="width: 100px;">검색</button>
				</div>
				</form>
				
				<div class="float-start" role="group" aria-label="Basic example" style="padding-top: 10px;">
					<span>전체: ${requestScope.totalCount} 개</span>
            	</div>
				<div class="btn-group float-end" role="group" aria-label="Basic example">
					<button id="add" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#eventModal" style="width: 100px;">추가</button>
				    <button id="del" class="btn btn-danger" style="width: 100px;">삭제</button>
            	</div><br><br>
				
            	<table class="table table-striped table-hover">
	            	<thead class="table-dark">
	            		<tr>
	            			<th width="50"><input type="checkbox" id="allCheck"/></th>
	            			<th>제목</th>
	            			<th>내용</th>
	            			<th>파일명</th>
	            			<th>URL</th>
	            			<th>등록일</th>
	            		</tr>
	            	</thead>
	            	<tbody class="table-group-divider">
	            		<c:forEach var="item" items="${list}">
	            		<tr>
	            			<td width="50"><input type="checkbox" class="check" value="${item.idx}"/></td>
	            			<td>${item.title}</td>
	            			<td>${item.content}</td>
	            			<td>${item.filename}</td>
	            			<td>${item.url}</td>
	            			<td align="center" width="150">${item.regdate}</td>
	            		</tr>
	            		</c:forEach>
	            	</tbody>
	            </table>
	            
            	<nav aria-label="Page navigation">${ paging }</nav>
            </div>
            
        </div>
    </div>
    
	<!-- Modal -->
	<div class="modal fade" id="eventModal" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="ModalLabel">이벤트 입력</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<input type="hidden" id="idx">
          	<div class="input-group mb-3">
		    	<div class="form-floating">
			      <input type="text" class="form-control vaildation" id="title" placeholder="제목" name="title" maxlength="20"/>
			      <label for="floatingInput">제목</label>
			    </div>
			</div>
          	<div class="input-group mb-3">
			    <div class="form-floating">
			      <input type="text" class="form-control vaildation" id="content" placeholder="내용" name="content" maxlength="20">
			      <label for="floatingInput">내용</label>
			    </div>
		    </div>
		    <div class="input-group mb-3">
			    <div class="form-floating">
			      <input type="text" class="form-control vaildation" id="url" placeholder="URL" name="url" maxlength="50">
			      <label for="floatingName">URL</label>
			    </div>
		    </div>
		    <div class="input-group mb-3">
		    	<div style="width: 100%;">
		    		<input class="form-control form-control-lg vaildation" id="file" placeholder="파일" type="file" name="file">
		    	</div>
		    </div>
		    
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary" onclick="onSave()">저장</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
</body>
</html>




