<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
    
    <script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery-3.7.0.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
	<style type="text/css">
table thead {
	text-align: center;
}

table thead tr th:first-child {
	border-radius: 10px 0px 0px 0px;
}

table thead tr th:last-child {
	border-radius: 0px 10px 0px 0px;
}

.input-group-text {
	width: 100px;
	display: inline-block;
	text-align: center;
}

a {
	text-decoration: none;
}

.reservationIds {
	cursor: pointer;
	color: rgb(13, 110, 253);
}
</style>

<script type="text/javascript">

function formatDateToYYYYMMDD(date) {
    var year = date.getFullYear();
    var month = (date.getMonth() + 1).toString().padStart(2, '0');
    var day = date.getDate().toString().padStart(2, '0');
    
    return year + '-' + month + '-' + day;
}

// ==============================================================
$(() => {
    $("#saveBtn").click(function() {
        // 입력 필드에서 값을 가져옵니다.
        var room_choice = $("#room_choice").val();
        var start_date = $("#start_date").val();
        var end_date = $("#end_date").val();
        var member_id = $("#member_id").val();
        var countpeople = $("#countpeople").val();

        if (
            (room_choice !== null && room_choice !== undefined && room_choice !== '') &&
            (start_date !== null && start_date !== undefined && start_date !== '') &&
            (end_date !== null && end_date !== undefined && end_date !== '') &&
            (member_id !== null && member_id !== undefined && member_id !== '') &&
            (countpeople !== null && countpeople !== undefined && countpeople !== '')
        ) {
            var data = {
                room_choice: room_choice,
                start_date: start_date,
                end_date: end_date,
                member_id: member_id,
                countpeople: countpeople
            };

            if (confirm("예약를 저장하시겠습니까?")) {
                $.ajax({
                    url: "<%= request.getContextPath() %>/admin/reservationInsert.do",
                    method: "POST",
                    data: JSON.stringify(data),
                    dataType: "json",
                    contentType: "application/json",
                    success: function(response) {
                        if (response.result == "success") {
                            alert("예약이 성공적으로 저장되었습니다!");
                            window.location.reload();
                        }
                    },
                    error: function(xhr, status, error) {
                        alert("예약 저장에 실패했습니다: " + error);
                    }
                });
            } else {
                alert("취소 되었습니다.");
            }
        } else {
            alert('공백인 데이터가 있습니다.');
        }
    });

    $("#allCheck").click(function() {
        if ($(this).is(":checked")) {
            $(".check").prop("checked", true);
        } else {
            $(".check").prop("checked", false);
        }
    });

    $(".check").click(function() {
        if (!$(this).is(":checked")) {
            $("#allCheck").prop("checked", false);
        }
    });

    $("#del").click(function() {
        var delIds = "";
        $(".check").each(function(index) {
            if ($(this).is(":checked")) {
                delIds += "," + $(this).val();
            }
        });

        if (delIds == "") {
            alert("삭제 할 예약을 체크하세요.");
        } else {
            if (confirm("삭제하시겠습니까?")) {
                var url = '<%= request.getContextPath() %>/admin/reservationDelete.do';

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
                            window.location = '<%= request.getContextPath() %>/admin/reservation.do';
                        }
                    })
                    .catch((error) => console.log("error:", alert(error)));
            }
        }
    });

    $("#reservationModal").on("hidden.bs.modal", function() {
        $("#idx").val("");
        $("#room_choice").val("");
        $("#start_date").val("");
        $("#end_date").val("");
        $("#member_id").val("");
        $("#countpeople").val("");
    });
});

function showADD() {
    $("#saveBtn").show();
    $("#updateBtn").hide();
}

function reservationUpdate(idx) {
    $("#saveBtn").hide();
    $("#updateBtn").show();
    $("#idx").val(idx);
    // 데이터를 저장하기 위한 AJAX 요청 수행
    $.ajax({
        url: "<%= request.getContextPath() %>/getreservation.do",
        method: "GET",
        data: {
            idx: idx
        },
        success: function(response) {
            var startDate = new Date(response.start_date);
            var endDate = new Date(response.end_date);

            $("#start_date").val(formatDateToYYYYMMDD(startDate));
            $("#end_date").val(formatDateToYYYYMMDD(endDate));

            $("#room_choice").val(response.room_choice);
            $("#member_id").val(response.member_id);
            $("#countpeople").val(response.countpeople);
        },
        error: function(xhr, status, error) {
            // 저장 실패 시 처리
            alert("가져오기 실패했습니다: " + error);
        }
    });

    $("#updateBtn").click(function() {
	    var idx = $("#idx").val();
        var room_choice = $("#room_choice").val();
        var start_date = $("#start_date").val();
        var end_date = $("#end_date").val();
        var member_id = $("#member_id").val();
        var countpeople = $("#countpeople").val();
	   
        var modification_date = new Date(); // 현재 날짜 및 시간 정보를 가지는 Date 객체 생성
	    var formattedRewrite = modification_date.toISOString();
		//var registration_date = $("#registration_date").val();
		
        if (
            room_choice !== null &&
            room_choice !== undefined &&
            room_choice !== '' &&
            start_date !== null &&
            start_date !== undefined &&
            start_date !== '' &&
            end_date !== null &&
            end_date !== undefined &&
            end_date !== '' &&
            member_id !== null &&
            member_id !== undefined &&
            member_id !== '' &&
            countpeople !== null &&
            countpeople !== undefined &&
            countpeople !== ''
        ) {
            // Get the current timestamp
            //var currentTimestamp = new Date().getTime();

            var data = {
	            idx: idx,
                room_choice: room_choice,
                start_date: start_date,
                end_date: end_date,
                member_id: member_id,
                countpeople: countpeople,
                modification_date: modification_date
                //modification_date: currentTimestamp // Add the modification_date
                //registration_date: registration_date
            };

            if (confirm("수정 하시겠습니까?")) {
                $.ajax({
                    url: "<%= request.getContextPath() %>/admin/reservationUpdate.do",
                    method: "POST",
                    data: JSON.stringify(data),
                    dataType: "json",
                    contentType: "application/json",
                    success: function(response) {
                        var json = response;
                        if (json.result == "success") {
                            alert("예약이 성공적으로 수정되었습니다!");
                            window.location.reload();
                        }
                    },
                    error: function(xhr, status, error) {
                        alert("수정에 실패했습니다: " + error);
                    }
                });
            } else {
                alert("취소 되었습니다.");
            }
        } else {
            alert('수정 데이터 중 공백인 데이터가 있습니다.');
        }
    });

};

	function addreservation() {
	    window.location.href = './reservationInsert.jsp';
	}

	function updateReservationStatus(idx, newStatus) {
	    // Get the current timestamp
	    var currentTimestamp = new Date().getTime();
		
	    var data = {
	        idx: idx,
	        reservation_status: newStatus,
	        modification_date: currentTimestamp
	    };

	    $.ajax({
	        url: "<%= request.getContextPath() %>/admin/updateReservationStatus.do",
	        method: "POST",
	        data: JSON.stringify(data),
	        dataType: "json",
	        contentType: "application/json",
	        success: function(response) {
	            if (response.result == "success") {
	                alert("예약 상태가 성공적으로 업데이트되었습니다.");
	                window.location.reload();
	            }
	        },
	        error: function(xhr, status, error) {
	            alert("예약 상태 업데이트에 실패했습니다: " + error);
	        }
	    });
	}

	<%-- function updateReservationStatus(idx, newStatus) {
		
	    var data = {
	        idx: idx,
	        reservation_status: newStatus,
            modification_date: modification_date
	    };

	    $.ajax({
	        url: "<%= request.getContextPath() %>/admin/updateReservationStatus.do",
	        method: "POST",
	        data: JSON.stringify(data),
	        dataType: "json",
	        contentType: "application/json",
	        success: function(response) {
	            if (response.result == "success") {
	                alert("예약 상태가 성공적으로 업데이트되었습니다.");
	                window.location.reload();
	            }
	        },
	        error: function(xhr, status, error) {
	            alert("예약 상태 업데이트에 실패했습니다: " + error);
	        }
	    });
	} --%>



	// ==============================================================
		


	</script><body>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar-->
		<div class="border-end bg-white" id="sidebar-wrapper">
			<jsp:include page="/WEB-INF/views/layout/side.jsp" />
		</div>

		<!-- Page content wrapper-->
		<div id="page-content-wrapper">
			<!-- Top navigation-->
			<nav
				class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
				<jsp:include page="/WEB-INF/views/layout/header.jsp" />
			</nav>
			<br>

			<%-- <%
				out.println(request.getAttribute("list"));
            %>
            회원 --%>

			<!-- <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
            	
           	</nav> -->
			<div class="table-responsive" style="padding: 20px;">
				<form action="<%= request.getContextPath() %>/admin/reservation.do"
					method="get">
					<div class="input-group" style="margin-bottom: 30px;">
						<span class="input-group-text">객실 선택</span> 
						<input type="text" aria-label="First name" class="form-control" name="room_choice"	value="${param.room_choice}"> 
						<span class="input-group-text">고객 아이디</span>
						<input type="text" aria-label="Last name" class="form-control" 	name="member_id" value="${param.member_id}">
						<span class="input-group-text">예약 상태</span> <select class="form-select" name="reservation_status">
							<option value="ALL" ${ param.reservation_status == "ALL" ? "selected" : "" }>전체</option>
							<option value="Y" ${ param.reservation_status == "Y" ? "selected" : "" }>예약중</option>
							<option value="N" ${ param.reservation_status == "N" ? "selected" : "" }>예약취소</option>
						</select>
						<button class="btn btn-primary" type="submit" id="btnSearch" style="width: 100px;">검색</button>
					</div>
				</form>

				<div class="float-start" role="group" aria-label="Basic example"
					style="top: padding-top: 10px;">
					<span>전체: ${requestScope.totalCount} 개</span>
				</div>
				<div class="btn-group float-end" role="group"
					aria-label="Basic example">
					<button id="add" class="btn btn-primary" data-bs-toggle="modal"
						data-bs-target="#reservationModal" style="width: 100px;"  onclick="showADD()">추가</button>
					<button id="del" class="btn btn-danger" style="width: 100px;">삭제</button>
				</div>
				<br> <br>

				<table class="table table-striped table-hover">
					<thead class="table-dark">
						<tr>
							<th><input type="checkbox" id="allCheck" /></th>
							<th>예약 번호</th>
							<th>객실 선택</th>
							<th>체크인</th>
							<th>체크아웃</th>
							<th>고객 아이디</th>
							<th>인원수</th>
							<th>예약 상태</th>
							<th>예약일</th>
							<th>수정일</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
					<c:forEach var="item" items="${list}">
						<tr>
							<th><input type="checkbox" class="check" value="${item.idx}" /></th>
							<td align="center">${item.idx}</td>
							<td align="center">
								<c:set var="room_choice" value="${fn:replace(item.room_choice, '<', '&lt;')}" />
								<c:set var="room_choice" value="${fn:replace(room_choice, '>', '&gt;')}" />
								${room_choice}
							</td>
							<td align="center">
								<fmt:formatDate value="${item.start_date}" pattern="yyyy:MM:dd(E) a h:mm:ss" />
							</td>
							<td align="center">
								<fmt:formatDate value="${item.end_date}" pattern="yyyy:MM:dd(E) a h:mm:ss" />
							</td>
							<td>
	            				<span class="reservationIds" onclick="reservationUpdate(${item.idx})" 
	            					data-bs-toggle="modal" data-bs-target="#reservationModal">${item.member_id}
	            				</span>
            				</td>
							<td align="center">${item.countpeople}</td>
							<td align="center">
							 <select name="reservation_status" onchange="updateReservationStatus(${item.idx}, this.value)">
							    <option value="Y" ${item.reservation_status eq 'Y' ? 'selected' : ''}>예약중</option>
							    <option value="N" ${item.reservation_status eq 'N' ? 'selected' : ''}>예약취소</option>
							    <option value="" hidden="" ${item.reservation_status ne 'Y' && item.reservation_status ne 'N' ? 'selected' : ''}>선택</option>
							</select>

							</td>
							
							<!-- 날짜 포멧 이쁘게 진행  -->
							<td align="center">
								<fmt:formatDate value="${item.registration_date}" pattern="yyyy:MM:dd(E) a h:mm:ss" />
							</td>
							<td align="center">
								<fmt:formatDate value="${item.modification_date}" pattern="yyyy:MM:dd(E) a h:mm:ss" />
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
<div class="modal fade" id="reservationModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">예약관리</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
			</div>
			<div class="modal-body">
					<input type="hidden" id="idx">
					<div class="input-group mb-3">
			             <div class="form-floating">
			               <input type="text" class="form-control vaildation" id="room_choice" placeholder="객실선택" name="room_choice" maxlength="20">
			               <label for="floatingName">객실선택</label>
			             </div>
		          	</div>
					<div class="mb-3">
			             <div class="form-floating">
			               <input type="text" class="form-control vaildation" id="start_date" placeholder="체크인" name="start_date" maxlength="20">
			               <label for="floatingstart_date">체크인</label>
			             </div>
		          	</div>
					<div class="mb-3">
			             <div class="form-floating">
			               <input type="text" class="form-control vaildation" id="end_date" placeholder="체크아웃" name="end_date" maxlength="20">
			               <label for="floatingend_date">체크아웃</label>
			             </div>
		          	</div>
					<div class="input-group mb-3">
			             <div class="form-floating">
			               <input type="text" class="form-control vaildation" id="member_id" placeholder="고객 아이디" name="member_id" maxlength="100">
			               <label for="floatingSubject">고객 아이디</label>
			             </div>
		          	</div>
					<div class="input-group mb-3">
			             <div class="form-floating">
			               <input type="text" class="form-control vaildation" id="countpeople" placeholder="인원수" name="countpeople" maxlength="100">
			               <label for="floatingSubject">인원수</label>
			             </div>
		          	</div>
				</div>
		<%-- 	<div style="width: 1000px; margin-left: auto; margin-right: auto;">
				<table class="table" style="width: 900px; float: left;">
					<tr style="width: 100px;">
						<th class="align-middle table-primary" style="width: 100px;" colspan="2">
							<label for="room_choice">객실선택</label>
						</th>
						<td style="700px;"><input id="room_choice"
							class="form-control form-control-sm" type="text" name="room_choice"
							style="width: 100%; " maxlength="20" /></td>
					</tr>
					<tr style="width: 100px;">
						<th class="align-middle table-primary" style="width: 100px;" colspan="2">
							<label for="start_date">체크인</label>
						</th>
						<td style="700px;"><input id="start_date"
							class="form-control form-control-sm" type="text" name="start_date"
							style="width: 100%; " maxlength="20" /></td>
					</tr>
					<tr style="width: 100px;">
						<th class="align-middle table-primary" style="width: 100px;" colspan="2">
							<label for="end_date">체크아웃</label>
						</th>
						<td style="700px;"><input id="end_date"
							class="form-control form-control-sm" type="text" name="end_date"
							style="width: 100%; " maxlength="20" /></td>
					</tr>
					<tr style="width: 100px;">
						<th class="align-middle table-primary" style="width: 100px;" colspan="2">
							<label for="member_id">고객 아이디</label>
						</th>
						<td style="700px;"><input id="member_id"
							class="form-control form-control-sm" type="text" name="member_id"
							style="width: 100%; " maxlength="20" value="${sessionScope.ID}"/></td>
					</tr>
					<tr style="width: 100px;">
						<th class="align-middle table-primary" style="width: 100px;" colspan="2">
							<label for="countpeople">인원수</label>
						</th>
						<td style="700px;"><input id="countpeople"
							class="form-control form-control-sm" type="text" name="countpeople"
							style="width: 100%; " maxlength="20" /></td>
					</tr>
				</table>
			</div> --%>
			<div class="modal-footer">
				<button id="saveBtn" type="button" class="btn btn-primary">저장</button>
				<button id="updateBtn" type="button" class="btn btn-primary">수정</button>
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				<!-- <input type="text" id="dd" class="form-control vaildation"> -->
				
			</div>
		</div>
	</div>
</div>

<!-- jQuery 3.7.0 -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<!-- jQuery UI -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
  $(function() {
	  //$("#start_date").datepicker();	
	  
	  
    // 체크인 날짜 달력 설정
    $("#start_date").datepicker({
      dateFormat: "yy-mm-dd",
      minDate: 0, // 오늘 이전 날짜는 선택 불가능
      onSelect: function(selectedDate) {
        // 체크인 날짜 선택 시, 체크아웃 날짜는 체크인 이후 날짜만 선택 가능
        var minEndDate = new Date(selectedDate);
        minEndDate.setDate(minEndDate.getDate() + 1);
        $("#end_date").datepicker("option", "minDate", minEndDate);
      }
    });

    // 체크아웃 날짜 달력 설정
    $("#end_date").datepicker({
      dateFormat: "yy-mm-dd",
      minDate: 1, // 체크인 날짜 다음 날짜부터 선택 가능
      onSelect: function(selectedDate) {
        // 체크아웃 날짜 선택 시, 체크인 날짜는 체크아웃 이전 날짜만 선택 가능
        var maxStartDate = new Date(selectedDate);
        maxStartDate.setDate(maxStartDate.getDate() - 1);
        $("#start_date").datepicker("option", "maxDate", maxStartDate);
      }
    });
  });
</script>
</body>
</html>