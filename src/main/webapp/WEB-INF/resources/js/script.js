$(document).ready(function () {
    $(".menu_1").hover(function () {
        $(".menu_1_content").slideToggle("fast");
    });
    
    $(".menu_2").hover(function () {
        $(".menu_2_content").slideToggle("fast");
    });
    
    $(".menu_3").hover(function () {
        $(".menu_3_content").slideToggle("fast");
    });
});

function open3(){
  window.open("http://localhost:8080/start/trip2.jsp", "_blank", "width=900, height=300");
}