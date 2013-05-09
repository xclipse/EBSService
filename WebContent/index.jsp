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
max-width: 500px; min-width: 300px; position: inherit;margin-top: 10px;
-webkit-box-shadow: 0 0 5px #aaa;
padding-left: 5px;
padding-right: 5px;
}

#bodycenter { width: 1024px;margin-right: auto; margin-left: auto;overflow: auto; }  
#bodycenter #dv1 {float: left;width: 48%; height: 90%; padding: 5px; margin: 2px;}  
#bodycenter #dv2 {float: right;width: 48%; height: 90%; padding: 5px; margin: 2px;}
#bodycenter #dv3 {display:block; width: 98%; height: 90%; padding: 5px; margin: 2px;}  
</style>
<script type="text/javascript">
var sc = 0;
var bc = 0;
$(function() {
	$('input:text, input:password')
	.button()
	.css({
	        'font' : 'inherit',
	       'color' : 'inherit',
	  'text-align' : 'left',
	     'outline' : 'none',
	      'cursor' : 'text'
	});
	var handler = function(){
		$.getJSON('PollingData?id=1', function(data) {
			var arr = data.data;
			if(arr.length > 0 && arr[0].value != ""){
				for(var i in arr){
					var newdiv = $('<div class ="showdata ui-corner-all ui-widget ui-widget-content" style="max-width: 750px; color: ' + arr[i].color + ';" />');
					newdiv.append('<p> [' + getTime() + '] > ' + arr[i].value + ' </p>');
					$('#pimDiv').append(newdiv);				
				}
			}
			}).error(function() { alert("error"); });

		$.getJSON('PollingData?id=2', function(data) {
			var arr = data.data;
			if(arr.length > 0 && arr[0].value != ""){
				for(var i in arr){
					var newdiv = $('<div class ="showdata ui-corner-all ui-widget ui-widget-content" style="color: ' + arr[i].color + ';" />');
					newdiv.append('<p> [' + getTime() + '] > ' + arr[i].value + ' </p>');
					sc ++;
					if(sc > 2){
						$('#siebelDiv').empty();
						sc = 0;
					}
					$('#siebelDiv').append(newdiv);				
				}
			}
			}).error(function() { alert("error"); });
		
		$.getJSON('PollingData?id=3', function(data) {
			var arr = data.data;
			if(arr.length > 0 && arr[0].value != ""){
				for(var i in arr){
					var newdiv = $('<div class ="showdata ui-corner-all ui-widget ui-widget-content" style="color: ' + arr[i].color + ';" />');
					newdiv.append('<p> [' + getTime() + '] > ' + arr[i].value + ' </p>');
					bc ++;
					if(bc > 2){
						$('#brmDiv').empty();
						bc = 0;
					}
					$('#brmDiv').append(newdiv);				
				}
			}
			}).error(function() { alert("error"); });
    };
    setInterval( handler , 1000);
    
    
});
function brmReplyData(){
	$.getJSON('replyData?id=3', function(data) {
		}).error(function() { alert("error"); });
}
function siebelReplyData(){
	$.getJSON('replyData?id=2', function(data) {
		}).error(function() { alert("error"); });
}
</script>
</head>
<body id="bodycenter">
	<div id="mainDiv">
	</div>
<div style="height: 300px; display: block;">
<div id="dv1" class="ui-corner-all ui-widget ui-widget-content" > 
<div class ="showdata ui-corner-all ui-widget ui-widget-content"><p>Siebel Simulator:</p>
</div> 
<div id="siebelDiv">
</div>
<!-- 	<form action="javascript: siebelReplyData();" method="get">
		<button type="submit" id="siebelReplyBtn">Process Item</button>
	</form> -->
</div>
<div id="dv2" class="ui-corner-all ui-widget ui-widget-content"> 
<div class ="showdata ui-corner-all ui-widget ui-widget-content"><p>BPM Simulator:</p>
</div>
<div id="brmDiv">
</div>
<!-- 	<form action="javascript: brmReplyData();" method="get">
		<button type="submit" id="brmReplyBtn">Process Item</button>
	</form> -->
</div>
</div>
<div id="dv3" class="ui-corner-all ui-widget ui-widget-content" style="min-height: 300px;">
<div id="pimDiv">
<div class ="showdata ui-corner-all ui-widget ui-widget-content"><p>PIM Simulator:</p></div>
</div>
</div>
</body>
</html>