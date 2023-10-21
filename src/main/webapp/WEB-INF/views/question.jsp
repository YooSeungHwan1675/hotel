<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!--          meta 선언          -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="<%= request.getContextPath()%>/img/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
	<!--          script 선언          -->
	<script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery-3.7.0.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
	
    <style type="text/css">
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
    <script type="text/javascript">
        $(() => {
            $("#saveBtn").click(function() {
                // 입력 필드에서 값을 가져옵니다.
                var idx = $("#idx").val();
                var type = $("#type").val();
                var title = $("#title").val();
                var contents = $("#contents").val();
                var answer = $("#answer").val();
                var userID = '${sessionScope.memberID}';
                

                if ((title !== null && title !== undefined && title !== '') &&
                    (contents !== null && contents !== undefined && contents !== '') &&
                    (userid !== null && userid !== undefined && userid !== '')) {

                    var data = {
//                      idx: idx,
                        type: type,
                        title: title,
                        contents: contents,
                        userid: userID,
                        answer:answer
                    };
                    // 데이터를 저장하기 위한 AJAX 요청 수행
                    if (confirm("문의하시겠습니까?")) {
                        $.ajax({
                        	url: "<%= request.getContextPath() %>/questionInsert.do",
                            method: "POST",
      				     	data: data,
                            success: function(response) {
                                var json = response;
//                                 alert(json);
                                if (json.result == "success") {
                                    alert("문의가 접수되었습니다!");
                                    window.location.reload();
// 	                                console.log(data);
                                }
                            },
                            error: function(xhr, status, error) {
                                alert("문의 등록에 실패했습니다: " + error);
                            }
                        });
                    } else {
                        alert("취소 되었습니다.");
                    }
                } else {
                    alert('공백인 데이터가 있습니다.');
                }
            });

            function addCount(obj) {
                if ($(obj).attr("aria-expanded")) {
                    var idx = $(obj).parents(".accordion-item").find("[id^='question']").attr("id").substring(6);
                    var hit = $(obj).parents(".accordion-item").find("span.hit-value").text();

                    var data = {
                        idx: idx,
                        answer: answer
                    };

                    $.ajax({
                        url: "<%= request.getContextPath() %>/question.do",
                        method: "post",
                        data: data,
                        success: function(response) {
                            var json = JSON.parse(response);
                            if (json.result == "success") {
                                window.location.reload();
                            }
                        },
                        error: function(xhr, status, error) {
                        }
                    });
                }
            }
        });
    </script>
    <title>QnA</title>
</head>
<body>
	<div class="row">
		<div class="col-md-2" id="side">
	    	<h3><strong>문의 사항</strong></h3>
	  	</div>
		<div class="accordion accordion-flush col-md-10">
		  	<c:forEach var="item" items="${list}">
	  		<div class="accordion-item">	
	         	<h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
			      data-bs-target="#question${item.idx}" aria-expanded="false" aria-controls="question${item.idx}" onclick="addCount(this)">
			        ${item.title} 
			        </button>
			    </h2>
			    <div id="question${item.idx}" class="accordion-collapse collapse" data-bs-parent="#accordionFlush">
			      <div class="accordion-body"><pre>${item.contents}</pre></div>
			    </div>
          	</div>
          	</c:forEach>
          	<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
				</div>
				<div class="modal-body">
					<input type="hidden" id="idx">
					<br>
		          	<div class="input-group mb-3">
			             <select class="form-select" id="type" name="type" style="height: 58px;">
								<option>예약</option>
								<option>불만</option>
								<option>기타</option>
							</select>
		          	</div>
		          	<div class="input-group mb-3">
			             <div class="form-floating">
			               <input type="text" class="form-control vaildation" readonly="readonly" id="userid" placeholder="이름" name="userName" value="${sessionScope.memberName}" maxlength="20">
			               <label for="floatingName">이름</label>
			             </div>
		          	</div>
					<div class="input-group mb-3">
			             <div class="form-floating">
			               <input type="text" class="form-control vaildation" id="title" placeholder="제목" name="title" maxlength="100">
			               <label for="floatingSubject">제목</label>
			             </div>
		          	</div>
		          	<div class="input-group mb-3">
			             <div class="form-floating">
			               <textarea class="form-control" id="contents" placeholder="내용" id="contents" style="height: 180px;"></textarea>
			               <label for="floatingSubject">내용</label>
			             </div>
		          	</div>
		          	<input type="text" hidden="hidden" value="미확인" id="answer">
				</div>
				<div class="modal-footer">
					<button id="saveBtn" type="button" class="btn btn-primary" >접수</button>
				</div>
			</div>
		</div>
	</div>
</body>

</html>