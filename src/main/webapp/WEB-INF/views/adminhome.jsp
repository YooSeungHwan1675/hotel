<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>채팅방</title>
	<meta charset="UTF-8"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<!-- 	<link rel="stylesheet" href="./css/home.css"> -->
<style>
	body {
		font-family: Arial, sans-serif;
		background-color: #f0f0f0;
		margin: 0;
		padding: 0;
	}

	#chatForm, #chat {
		background-color: #fff;
		margin: 10px;
		padding: 10px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	}

    #chatForm {
		display: flex;
		justify-content: space-between;
	}

	#message {
		flex-grow: 1;
		padding: 8px;
		border: 1px solid #ccc;
		border-radius: 4px;
		margin-right: 10px;
	}

	button {
		background-color: #007bff;
		color: #fff;
		border: none;
		border-radius: 4px;
		padding: 8px 16px;
		cursor: pointer;
	}

	#chatArea {
		width: 100%;
		height: 300px;
		border: 1px solid #ccc;
		padding: 10px;
		box-sizing: border-box;
		background-color: #f9f9f9;
		font-family: Arial, sans-serif;
		font-size: 14px;
		color: #333;
		overflow-y: scroll;
	}

   .user-message {
       background-color: #b5d692;
       border-radius: 20px;
       color: #fff;
       padding: 7px 12px;
       margin-bottom: 10px;
       max-width: 230px;
       float: left;
       clear: both;
   }
   
   .admin-message {
       background-color: #ea5936;
       border-radius: 20px;
       color: #fff;
       padding: 7px 12px;
       margin-bottom: 10px;
       max-width: 230px;
       float: right;
       clear: both;
   }
   
   .default-message {
       background-color: #b5d692;
       border-radius: 20px;
       color: #fff;
       padding: 7px 12px;
       margin-bottom: 10px;
       max-width: 230px;
       float: left;
       clear: both;
   }
   
   .message-box {
       /* 공통 스타일을 정의할 수 있습니다. */
       padding: 7px 12px;
       margin-bottom: 10px;
       max-width: 230px;
       clear: both;
       border-radius: 20px;
   }
        
	#out {
            background-color: #dc3545;
    }
        
	.left {
		justify-content: flex-end;
	}

	.right {
		justify-content: flex-start;
	}

</style>
</head>
<body>
	<div>
		<h1
			style="font-size: 30px; color: #007bff; text-align: center; margin-top: 10px;">실시간 문의
		</h1>
	</div>
<div id="chat">
	<div id="chatArea" style="resize: none; overflow-y: scroll; height: 300px;"></div>
</div>
	
<form id="chatForm" style="resize: none;">
	<input type="text" id="message" />
	<button>send</button>
	<button id="out">채팅나가기</button>
</form>
<script>
$(document).ready(function(){
    // 사용자용 SockJS 연결
    var userSock = new SockJS("/project/user/echo");
    userSock.onmessage = function(e){
        var message = e.data; // 메시지 변수 정의
        appendMessage(message, true); // 사용자 메시지로 설정
        // 메시지를 로컬 스토리지에 저장
        saveChatMessage(message);
        scrollToBottom();
    }

    // 관리자용 SockJS 연결
    var adminSock = new SockJS("/project/admin/echo");
    adminSock.onmessage = function(e){
        var message = e.data; // 메시지 변수 정의
        appendMessage2(message, false); // 관리자 메시지로 설정
        saveChatMessage(message);
        scrollToBottom();
    }
    
    $("#clearData").click(function() {
   	 localStorage.removeItem("chatHistory"); // 또는 sessionStorage를 사용할 수도 있습니다.
        // 데이터가 삭제되면 화면에서도 삭제된 상태를 반영합니다.
        $("#chatArea").text("");
   });
   
	// 지울지말지 고민
//     adminSock.onopen = function() {
//         sendMessage("관리자님 입장했습니다.");
//     };
    

    $("#out").click(function() {
        window.close();
    });

    function sendMessage(message) {
        // 관리자에게 메시지를 보내려면 추가 코드를 여기에 작성하세요.
        adminSock.send(message);
        $("#message").val('').focus();
    } 
    
    function closeConnection(sock) {
        if (sock) {
            sock.onclose = function() {
                if (sock === userSock) {
                } else if (sock === adminSock) {
                }
                scrollToBottom();
            };
            sock.close();   
        }
    }
    
    $("#chatForm").submit(function(event){
        event.preventDefault();
        var message = $("#message").val(); // 메시지 가져오기
        sendMessage(message);
    });
    
    function appendMessage(message, isUserMessage, isAdminMessage) {
        var messageClass;
        var messagePosition;

        if (isUserMessage) {
            messageClass = "user-message";
            messagePosition = "left"; // 사용자 채팅은 왼쪽에 표시
        } else if (isAdminMessage) {
            messageClass = "admin-message";
            messagePosition = "right"; // 관리자 채팅은 오른쪽에 표시
        } else {
            messageClass = "default-message";
            messagePosition = "center";
        }

        var messageBox = '<div class="message-box ' + messageClass + '">' + message + '</div>';

        // 새 메시지를 추가할 때 messagePosition에 따라 스타일 클래스를 추가합니다.
        if (messagePosition === "left") {
            messageBox = '<div class="left">' + messageBox + '</div>';
        } else if (messagePosition === "right") {
            messageBox = '<div class="right">' + messageBox + '</div>';
        }

        $('#chatArea').append(messageBox);
        scrollToBottom();
    }
    
    function saveChatMessage(message) {
        // 현재 시간을 포함하여 메시지를 저장합니다.
        var timestamp = new Date().toLocaleString();
        var chatHistory = localStorage.getItem("chatHistory") || "";
        chatHistory += timestamp + " - " + message + "\n";
        localStorage.setItem("chatHistory", chatHistory);
    }

    function appendMessage2(message, isUser) {
        var messageClass = isUser ? "user-message" : "admin-message";
        var messagePosition = isUser ? "left" : "right"; // 사용자 채팅은 왼쪽에, 관리자 채팅은 오른쪽에 표시

        var messageBox = '<div class="message-box ' + messageClass + '">' + message + '</div>';

        // 새 메시지를 추가할 때 messagePosition에 따라 스타일 클래스를 추가합니다.
        if (messagePosition === "left") {
            messageBox = '<div class="left">' + messageBox + '</div>';
        } else if (messagePosition === "right") {
            messageBox = '<div class="right">' + messageBox + '</div>';
        }

        $('#chatArea').append(messageBox);
        scrollToBottom();
    }
    
    
    // 페이지 로드 시 이전 채팅 기록을 로컬 스토리지에서 불러와서 표시합니다.
    function loadChatHistory() {
        var chatHistory = localStorage.getItem("chatHistory");
        if (chatHistory) {
            var messages = chatHistory.split("\n"); // 개행 문자(\n)로 기록을 분할
            for (var i = 0; i < messages.length; i++) {
                var message = messages[i].trim(); // 공백 제거
                if (message !== "") {
                    var isUserMessage = message.indexOf("- 사용자:") !== -1;
                    var isAdminMessage = message.indexOf("- 관리자:") !== -1;
                    appendMessage(message, isUserMessage, isAdminMessage);
                }
            }
            scrollToBottom();
        }
    }

    
     loadChatHistory(); // 페이지 로드 시 이전 채팅 기록을 표시합니다.
     
     function scrollToBottom() {
         var chatArea = $("#chatArea");
         chatArea.scrollTop(chatArea.prop("scrollHeight"));
     }
     
 });
	</script>
</body>
</html>