<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="/javascript/page.js"></script>
<link rel="stylesheet" href="/css/page.css">
<style>

p  {
    border-style: solid;
    border-bottom-color: #ff0000;
}

</style>

<div class="well row" style="margin: 0; padding: 0;">
	<div class="col-md-9"
		style="height: 86.5%; background-color: white; width: 75%" id="map">
	</div>

	<div class="col-md-3"
		style="height: 100%; margin: 0; padding: 0; background-color: white">
		<div style="height: 5%; background-color: #222222; font-size: 14px; vertical-align: bottom; 
			color: white; line-height: 38px; padding-left: 3%">
			&gt 검색결과 <span id="ln"></span>개
		</div>

		<!-- 방리스트 -->
		<div style="overflow-x: hidden; overflow-y: auto; height: 87%"  >
			<div style="overflow-x: hidden; overflow-y: auto; height: 87%">
				<div id="sh" style="padding: 5px;"></div>
			</div>
			
			<!-- 전/후 -->
			<nav class="navbar navbar-inverse" style="padding: 0%; margin: 0%; border-radius: 0px; height: 5%">
				<div class="container-fluid">
					<div align="center">
						<div id="snav"
							style="width: 100%; border-radius: 0%; background-color: #222222; line-height: 48px">
							<div id="paging"></div>
						</div>
					</div>
				</div>
			</nav>
		</div>
	</div>

</div>

<script>

var info="default";
var markersub = "default";
var arr =[];
var arr2= [];

$(document).on("mouseenter", ".roomInfo", function() {
	//markersub.setMap(null);
	//info.close();
	console.log("info==>"+ typeof(markersub.infowindow));
	console.log("off");
	if (typeof(markersub.infowindow) === "undefined"){
			console.log("undefined 입니다")
		}else{
			
			markersub.infowindow.close();
		}
	$(this).css({
		"background-color" : "#EBFFFB",
		"cursor" : "pointer"
	});
	var jorm;
	if( $(this).attr("mpay")*1 == 0) {
		jorm = "전세";
	} else {
		jorm = "월세";
	}
	//ALIGN="Left"
	console.log("num="+$(this).attr("num")*1);
	//var rnum = $(this).attr("num")*1;
		var src = "/images/사진/"+ $(this).attr("num")*1 + "/0.jpg";
		var tag  =  '<IMG BORDER="90" ALIGN="Left" SRC="'+ src +'"  width="105" height="105">' 
		
	    tag += "<b style='color: #FF5733; font-size: 20px; vertical-align: middle;'>&nbsp;"
		tag += $(this).attr("depo")*1 +"/" + $(this).attr("mpay")*1
		tag +=  "</b>&nbsp"
		tag +=  "<span style='padding: 3px; background-color: #04B486;border-radius: 5px; color: white;'>"
		tag +=  jorm
		tag +=  "</span><br/>"
		tag +=  $(this).attr("binfo")
		tag += "<br/><br/>"
		tag += 'Room number:' +$(this).attr("num")*1 +'<br/>'

	var myLatLng = {lat:$(this).attr("lng")*1, lng: $(this).attr("lat")*1};
	markersub = new google.maps.Marker({
	    position: myLatLng,
	    map: map,
	   
	 });
	 arr.push(markersub);
	 info = new google.maps.InfoWindow({
		    content: tag 
		    //maxWidth: 300
     });
	 info.open(markersub.get('map'),markersub);
	 arr2.push(info);
	
});

$(document).on("mouseleave", ".roomInfo", function() {
	console.log("마커의 배열 = "+ arr.length + " 인포의 길이="+ arr2.length);
	//markersub.setMap(null);
	// info.close();
	if(arr.length==50) {
		
		arr = [];
		
	}
	if(arr2.length==50) {
		arr2= [];
	}
	for(var i=0; i < arr.length ;i++){
		arr[i].setMap(null);
	}
	for(var i=0; i < arr2.length ; i++){
		arr2[i].close();
	}
	$(this).css({
		"background-color" : "white",
		"cursor" : "default"
	});
});

$(document).ready(function() {
	//alert(${location.lat }+","+${location.lng});
	$("#log").append(PagingHelper.log(${location.lat }));
	$("#lag").append(PagingHelper.lag(${location.lng }));
    $("#dn").append(PagingHelper.dn(${dn }));
    $("#nj").append(PagingHelper.nj(${nj }));
    $("#jpglist").append(PagingHelper.jpglist(${mpic }));
    $("#arrlist").append(PagingHelper.arrlist(${mlist }));
    $("#paging").append(PagingHelper.pagingHtml(${msize }));
    $("#gotopage").append(PagingHelper.gotoPage(1));
});
</script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=${apiKey }&callback=initMap&libraries=places,visualization"
	async defer>
</script>
	
<!--  <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"> -->
<!--     </script> -->
<!--    <script async defer -->
<!--    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBS-83LLE8F1nvtVtsy1Adu-j4LeS9qAQg&callback=initMap"> -->
<!--   </script> -->
