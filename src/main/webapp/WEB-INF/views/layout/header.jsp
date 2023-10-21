<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- header-->
<div class="container-fluid">
	<button class="btn" id="sidebarToggle">
		<i class="bi bi-arrow-left-circle"></i>
	</button>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    	<span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
    	<span class="navbar-nav ms-auto mt-2 mt-lg-0">${sessionScope.Name} 님 환영합니다.</span>
        &nbsp;&nbsp;
        <a onclick="open3()"><i class="bi bi-chat-right-dots"></i></a>
        &nbsp;&nbsp;
        <button class="btn" id="logout">
    		<i class="bi bi-box-arrow-right"></i>
        </button>
    </div>
</div>

<script type="text/javascript">
	$(() => {
		var sidebarToggle = $("#sidebarToggle");
		
		if (sidebarToggle) {
			sidebarToggle.click(function () {
				event.preventDefault();
	            if (document.body.classList.toggle('sb-sidenav-toggled')) {
	            	$(".bi-arrow-left-circle").attr("class", "bi bi-arrow-right-circle");
	            } else {
	            	$(".bi-arrow-right-circle").attr("class", "bi bi-arrow-left-circle");
	            }
			});
		}
		
		var btnLogOut = $("#logout");
		
		if (btnLogOut) {
			btnLogOut.click(function () {
				if (confirm("로그아웃 하시겠습니까?")) {
					location.href = "<%=request.getContextPath()%>/admin/logout.do";
				}
			});
		}
	});
	function open3(){
		window.open("http://192.168.0.240:8080/project/adminchat", "_blank", "width=600, height=470");
	}
</script>