<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>객실 예약</title>
<link rel="icon" type="image/x-icon" href="<%= request.getContextPath()%>/img/favicon.ico" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--          link 선언          -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!--          script 선언          -->
<script src="https://kit.fontawesome.com/e1bd1cb2a5.js"></script>
<script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery-3.7.0.js"></script> 
<script src="./js/script.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
 
 
  <script>
  $(() => {
	    document.getElementById("add").addEventListener("click", function () {
	        var checkinDate = document.getElementById("checkin-datepicker").value;
	        var checkoutDate = document.getElementById("checkout-datepicker").value;
	        var countpeople = $("#countpeople").val();
	        var roomno = $("#roomno").val();
	        var memberId = "${sessionScope.memberName}";

	        var startDate = new Date(checkinDate);
	        var endDate = new Date(checkoutDate);

	        document.getElementById("startdate").value = new Date(checkinDate).toISOString().split('T')[0];
	        document.getElementById("enddate").value = new Date(checkoutDate).toISOString().split('T')[0];

	        $("#peoplecount").val(countpeople);
	        $("#id").val(memberId);
	        $("#roomno").val(roomno);
	    });

	    $(".check").click(function () {
	        $(".check").not(this).prop("checked", false);
	    });

	    $.datepicker.setDefaults({
	        dateFormat: 'yy-mm-dd',
	        prevText: '이전 달',
	        nextText: '다음 달',
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        showMonthAfterYear: true,
	        yearSuffix: '년'
	    });

	    // 체크인 달력
	    $("#checkin-datepicker").datepicker({
	        dateFormat: "yy-mm-dd",
	        minDate: 0,
	        closeText: "닫기",
	        currentText: "오늘",
	        showButtonPanel: true,
	        showMonthAfterYear: true,
	        onSelect: function (selectedDate) {
	            // 체크아웃 날짜 선택기의 최소 날짜를 선택한 체크인 날짜로 설정합니다.
	            $("#checkout-datepicker").datepicker("option", "minDate", selectedDate);
	        }
	    });

	    // 체크아웃 날짜 선택기
	    $("#checkout-datepicker").datepicker({
	        dateFormat: "yy-mm-dd",
	        minDate: 0,
	        showButtonPanel: true,
	        closeText: "닫기",
	        currentText: "오늘",
	        showMonthAfterYear: true,
	    });

	    $("#search-btn").click(function () {
	        if ($("#checkin-datepicker").val() == "" || $("#checkout-datepicker").val() == "") {
	            alert("체크인 아웃 날짜를 선택하세요.");
	        } else {
	            $("#bottom-table-container").show();
	        }
	    });

	    $("#add").click(function () {
	        var checkboxes = document.querySelectorAll(".check");
	        var isChecked = false;
	        for (var i = 0; i < checkboxes.length; i++) {
	            if (checkboxes[i].checked) {
	                isChecked = true;
	                break;
	            }
	        }

	        if (!isChecked) {
	            alert("체크된 항목이 없습니다. 방을 선택해주세요.");
	            var modal = bootstrap.Modal.getInstance($('#reservationModal'));
	            modal.dispose();
	        }
	    });

	    // IMP 초기화 코드는 이 위치에 있어도 됩니다.
	    var IMP = window.IMP; // 생략 가능
	    IMP.init("imp10626336");
	// 예약    
	    $("#roomreservation").click(function () {
	        var countpeople = parseInt($("#countpeople").val());

	        // 선택된 체크박스를 선택
	        var checkedCheckbox = $(".check:checked");

	        if (checkedCheckbox.length === 0) {
	            alert("객실을 선택하세요.");
	        } else {
	            // 체크된 첫 번째 체크박스의 부모 <tr> 요소
	            var parentRow = checkedCheckbox.eq(0).closest("tr");

	            // amount 값을 가져옵니다.
	            var amount = parseFloat(parentRow.find("#price").text());
	            var name = parentRow.find("#types").text();

	            // capacity 값을 가져옵니다. db인원수
	            var capacity = parseInt(parentRow.find("#capacity").text());

	            if (capacity < countpeople) {
	                alert("선택한 객실은 수용 가능한 인원보다 적습니다. 다른 객실을 선택해주세요.");
	            } else {
	                function executeReservation() {
	                    // 입력 필드에서 값을 가져옵니다.
	                    var startdate = $("#startdate").val();
	                    var enddate = $("#enddate").val();
	                    var peoplecount = $("#peoplecount").val();
	                    var roomno = checkedCheckbox.prop("check", true).val();
	                    var id = "${sessionScope.memberID}";

	                    if ((startdate !== null && startdate !== undefined && startdate !== '') &&
	                        (enddate !== null && enddate !== undefined && enddate !== '') &&
	                        (peoplecount !== null && peoplecount !== undefined && peoplecount !== '') &&
	                        (id !== null && id !== undefined && id !== '')) {

	                        var data = {
	                            startDate: new Date(startdate),
	                            endDate: new Date(enddate),
	                            countPeople: peoplecount,
	                            memberId: id,
	                            roomChoice: roomno
	                        };
	                        console.log(data);

	                        $.ajax({
	                            url: "<%=request.getContextPath()%>/userreservationInsert.do",
	                            method: "POST",
	                            data: data,
	                            success: function (response) {
	                                var json = response;
	                                if (json.result == "success") {
	                                    alert("예약이 정상적으로 되었습니다!");
	                                    window.location.reload();
	                                }
	                            },
	                            error: function (xhr, status, error) {
	                                alert("예약에 실패했습니다: " + error);
	                            }
	                        });
	                    } else {
	                        alert('공백인 데이터가 있습니다.');
	                    }
	                }

	                var IMP = window.IMP;
	                IMP.request_pay({
	                    pg: 'kakaopay',
	                    pay_method: 'card',
	                    merchant_uid: 'merchant_' + new Date().getTime(),
	                    name: name,
	                    amount: amount,
	                    buyer_email: 'ktym14452@naver.com',
	                    buyer_name: '${sessionScope.memberName}',
	                    buyer_tel: '010-2563-1675',
	                    buyer_addr: 'addr',
	                    buyer_postcode: '123-456'
	                }, function (data) {
	                    if (data.success) {
	                        var msg = "결제 완료";
	                        msg += '고유ID : ' + data.imp_uid;
	                        msg += '// 상점 거래ID : ' + data.merchant_uid;
	                        msg += '// 결제 금액 : ' + data.paid_amount;
	                        msg += '// 카드 승인번호 : ' + data.apply_num;

	                        executeReservation();
	                    } else {
	                        var msg = "결제 실패: " + data.error_msg;
	                        alert(msg);
	                        window.location.reload();
	                    }
	                });
	            }
	        }
	    });
});

  </script>
  <style>
    .ui-datepicker {
      font-size: 12px;
      width: 220px;
    }
    th {
      width: 20%;
    }
	.row {
		width: 100%;
		height: 100vh;
		margin: 0px;
	}
	
	#side {
		background-color: #1D809F; 
		color: #fff; 
		padding: 30px;
	}
		
	@media (max-width: 1000px) {
		.row {
			height: 100%;
		}
			
		#side {
			width: 100%;
		}
			
	.accordion {
		width: 100%;
		}
	}
  </style>
</head>

<body>
	<div class="row">
		<div class="col-md-2" id="side" style="height: 100%;">
			<h3>
				<strong>예약 하기</strong>
			</h3>
		</div>
		<!-- 예약 리스트 -->
		<div class="accordion accordion-flush col-md-10">
			<table id="staffListContent" class="table table-striped">
				<tr>
					<th style="width: 25%;">체크인</th>
					<th style="width: 25%;">체크아웃</th>
					<th style="width: 25%;">인원수</th>
					<th style="width: 25%;">검색</th>
				</tr>
				<tr>
					<td><input type="text" id="checkin-datepicker" readonly>
					</td>
					<td><input type="text" id="checkout-datepicker" readonly>
					</td>
					<td><select id="countpeople" name="countpeople" size="1">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
					</select>명</td>
					<td>
						<button id="search-btn" class="btn btn-primary">검색</button>
					</td>
				</tr>
			</table>

			<!--  아래 창은 검색 누를 때 나오게끔 -->

			<div id="bottom-table-container"
				style="display: none; max-height: 400px; height: 400px;">
				<table style="position: relative; width: 100%;"
					class="table table-striped table-hover">
					<colgroup>
						<col style="width: 10%;">
						<col style="width: 22.5%;">
						<col style="width: 22.5%;">
						<col style="width: 22.5%;">
						<col style="width: 22.5%;">
					</colgroup>
					<thead style="background-color: black; color: white;">
						<tr align="center">
							<th>객실 선택</th>
							<th>객실 type</th>
							<th>객실 크기(m<sup>2</sup>)
							</th>
							<th>수용 가능 인원(명)</th>
							<th>금액(원)</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<c:forEach var="item" items="${list}">
							<tr>
								<th align="center"><input type="checkbox" class="check"
									value="${item.roomno}" style="width: 100%;" /></th>
								<td id="types" align="center">${item.type}</td>
								<td id="size" align="center">${item.size}</td>
								<td id="capacity" align="center">${item.capacity}</td>
								<td id="price" align="center">${item.price}</td>
								<td id="roomno" align="center"  hidden="hidden">${item.roomno}</td> <!--  방번호 -->
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div>
					<button id="add" class="btn btn-primary" data-bs-toggle="modal"
						data-bs-target="#reservationModal" style="width: 100px;">예약하기</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="reservationModal" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="ModalLabel">예약 확인</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <input type="hidden" id="idx">
                <div class="input-group mb-3">
                    <div class="form-floating">
                        <input type="date" class="form-control validation" id="startdate" placeholder="시작일" name="startdate" readonly="readonly">
                        <label for="startdate">시작일</label>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <div class="form-floating">
                        <input type="date" class="form-control validation" id="enddate" placeholder="체크 아웃" name="enddate" readonly="readonly">
                        <label for="enddate">체크 아웃</label>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <div class="form-floating">
                        <input type="text" class="form-control validation" id="peoplecount" placeholder="인원수" name="peoplecount" maxlength="20" readonly="readonly">
                        <label for="peoplecount">인원수</label>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <div class="form-floating">
                        <input type="text" class="form-control validation" id="id" placeholder="아이디" name="id" maxlength="11" readonly="readonly">
                        <label for="id">고객 이름</label>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="roomreservation">예약</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
	
</body>

</html>
