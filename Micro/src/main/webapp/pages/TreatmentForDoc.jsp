<html>
<link rel="stylesheet" href="../webjars/bootstrap/3.3.7-1/css/bootstrap.min.css">
<script src="../webjars/jquery/2.1.4/jquery.min.js"></script>
    <link rel="stylesheet" href="../webjars/angular-material/1.1.1/angular-material.min.css"> 
    
    <script src="../webjars/angularjs/1.5.8/angular.js"></script>
    <script src="../webjars/angularjs/1.5.8/angular-sanitize.js"></script>  
    <script src="../webjars/angularjs/1.5.8/angular-animate.min.js"></script>
    <script src="../webjars/angularjs/1.5.8/angular-aria.min.js"></script>
    <script src="../webjars/angularjs/1.5.8/angular-messages.min.js"></script>
    <script src="../webjars/angular-material/1.1.1/angular-material.min.js"></script>

<script>
var hf1;
var hf2;
$(document).ready(function() {
	var base_url = window.location.href.substr(0, window.location.href.indexOf('Micro')+6);
    $('#iframe-container-2').attr('src',base_url+'Payments');
    $('#iframe-container-1').attr('src',base_url+'Treatments');

    //$("f2").contents().find("body").onclick = function() { alert('hhjgh') };
})

window.addEventListener('message', function(e) {
	var data = e.data.split('-'),
		scroll_height = data[0],
		iframe_id = data[1];

	// Check message from which iframe
	if(iframe_id == 'iframe1')
		document.getElementById('iframe-container-1').style.height = scroll_height + 'px'; 
	else if(iframe_id == 'iframe2')
		document.getElementById('iframe-container-2').style.height = scroll_height + 'px'; 
} , false);


function onMyFrameLoad() {
	if (typeof (parent.document.getElementById("iframe-container-1").contentWindow.populateChild) == "function")
        parent.document.getElementById("iframe-container-1").contentWindow.populateChild();
	
	alert(scope);
	};
</script>
<style type="text/css">
	
#iframe-container-1 {
	width: 100%;
	border: none;
	margin: 0 0 30px 0;
}

#iframe-container-2 {
	width: 100%;
	border: none;
}

</style>
<head>
    <title>Treatment Types</title>
</head>
<body >

<iframe  id="iframe-container-1" >
</iframe>
<div > 
 </div> 

<!--  <div class="embed-responsive embed-responsive-16by9"> -->
<iframe  id="iframe-container-2" onload="onMyFrameLoad(this)">
</iframe>
<!--  </div> -->
</body>
</html>
