function onSubmit() {
	var result = true;
	$(".vaildation").each(function (index, item) {
		if ($(this).val() == "") {
			alert($(this).attr("placeholder") + "를 입력하세요.");
			$(this).focus();
			result = false;
			return false;
		}
	});
	
	return result;
}