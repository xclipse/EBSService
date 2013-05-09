<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="css/smoothness/jquery-ui-1.10.1.custom.css">
	<script src="js/common.js"></script>
	<script src="js/jquery-1.9.1.js"></script>
	<script src="js/jquery-ui-1.10.1.custom.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>BPM Service</title>
<style type="text/css">
.showdata{
max-width: 700px; min-width: 300px; position: inherit;margin-top: 10px;
-webkit-box-shadow: 0 0 5px #aaa;
padding-left: 5px;
padding-right: 5px;
}
</style>
<script type="text/javascript">

$(function() {
	var handler = function(){
		$.getJSON('PollingData?id=2', function(data) {
			var arr = data.data;
			if(arr.length > 0 && arr[0].value != ""){
				for(var i in arr){
					var newdiv = $('<div class ="showdata ui-corner-all ui-widget ui-widget-content" style="color: ' + arr[i].color + ';" />');
					newdiv.append('<p> [' + getTime() + '] > ' + arr[i].value + ' </p>');
					$('#mainDiv').append(newdiv);				
				}
				$('#replyMsg').val("");
			}
			}).error(function() { alert("error"); });
    };
    setInterval( handler , 1000);
});

function replyData(){
	var msg = $('#replyMsg').val();
	$.getJSON('replyData?id=2'+ '&replyMsg=' + msg, function(data) {
		$('#replyMsg').val("");
		}).error(function() { alert("error"); });
}
</script>
</head>
<body>
	<div id="mainDiv">
	<div class ="showdata ui-corner-all ui-widget ui-widget-content"><p>EBS/PIM service Ready and waiting BPM call.</p></div>
	</div>
	<form action="javascript: replyData();" method="get">
		<input type="text" id="replyMsg" name="replyMsg"/>
		<button type="submit" id="replyBtn">Reply</button>
	</form>
</body>
</html>