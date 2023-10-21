<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Sidebar-->
<div class="sidebar-heading border-bottom bg-light">
	<a id="logo" href="#"></a>
	<img alt="logo" src="<%=request.getContextPath()%>/images/logo.png" width="200">
</div>

<%
	String[] url = request.getRequestURI().split("/");
	String select = url[url.length - 1];
%>

<div class="list-group list-group-flush">
    <a class="list-group-item list-group-item-action list-group-item-light p-3 <%= select.equals("member.jsp") ? "active" : "" %>" href="<%=request.getContextPath()%>/admin/member.do">회원관리</a>
    <a class="list-group-item list-group-item-action list-group-item-light p-3 <%= select.equals("reservation.jsp") ? "active" : "" %>" href="<%=request.getContextPath()%>/admin/reservation.do">예약관리</a>
    <a class="list-group-item list-group-item-action list-group-item-light p-3 <%= select.equals("room.jsp") ? "active" : "" %>" href="<%=request.getContextPath()%>/admin/room.do">객실관리</a>
	 <a class="list-group-item list-group-item-action list-group-item-light p-3 <%= select.equals("user.jsp") ? "active" : "" %>" href="javascript:void(0);" onclick="showPasswordForm()">직원관리</a>
<%-- 	<a class="list-group-item list-group-item-action list-group-item-light p-3 <%= select.equals("user.jsp") ? "active" : "" %>" href="javascript:void(0);" onclick="checkadm()">직원관리</a> --%>
    <a class="list-group-item list-group-item-action list-group-item-light p-3 <%= select.equals("notice.jsp") ? "active" : "" %>" href="<%=request.getContextPath()%>/admin/notice.do">공지관리</a>
    <a class="list-group-item list-group-item-action list-group-item-light p-3 <%= select.equals("event.jsp") ? "active" : "" %>" href="<%=request.getContextPath()%>/admin/event.do">이벤트</a>
    <a class="list-group-item list-group-item-action list-group-item-light p-3 <%= select.equals("question.jsp") ? "active" : "" %>" href="<%=request.getContextPath()%>/admin/question.do">문의</a>
    <a class="list-group-item list-group-item-action list-group-item-light p-3 <%= select.equals("statistics.jsp") ? "active" : "" %>" href="<%=request.getContextPath()%>/admin/statistics.do">통계</a>
</div>


<div id="passwordForm" style="display: none;">
    <form>
        <label for="password">비밀번호:</label>
        <input type="password" id="pw" placeholder="비밀번호를 입력하세요">
        <button type="button" onclick="checkPassword()">확인</button>
    </form>
</div>


<script type="text/javascript">
		
		function showPasswordForm() {
		    var passwordForm = document.getElementById('passwordForm');
		    passwordForm.style.display = 'block';
		}
		

	    function checkPassword() {
	        var enteredPassword = document.getElementById('pw').value;

	        // 비밀번호가 'a!123123!'와 일치하는지 확인합니다.
	        if (enteredPassword === 'a!123123!') {
	            // 올바른 비밀번호일 경우, 해당 링크로 이동합니다.
	            window.location.href = "<%=request.getContextPath()%>/admin/user.do";
	        } else {
	            // 잘못된 비밀번호일 경우, 오류 메시지를 표시하고 이동하지 않습니다.
	            alert("잘못된 비밀번호입니다. 접근이 거부되었습니다.");
	        }
	    }
	    
	    // 하단은 혹시모를 대비
	    
// 		function checkadm() {
// 		    var enteredPassword = prompt("비밀번호를 입력하세요:", "");
		
// 		    // 비밀번호가 'abcd'와 일치하는지 확인합니다.
// 		    if (enteredPassword === 'a!123123!') {
// 		        // 올바른 비밀번호일 경우, 해당 링크로 이동합니다.
<%-- 		        window.location.href = "<%=request.getContextPath()%>/admin/user.do"; --%>
// 		    } else {
// 		        // 잘못된 비밀번호일 경우, 오류 메시지를 표시하고 이동하지 않습니다.
// 		        alert("잘못된 비밀번호입니다. 접근이 거부되었습니다.");
// 		    }
// 		}

	
	

</script>