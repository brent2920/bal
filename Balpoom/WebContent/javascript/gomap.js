

/**
 * go map!
 */

/*
 * Map variables
 */
var map;
var infoWindow;
var service;
var list = [];// 마커를 찍기위한 리스트
var plist = [];
var mapBound;
var locationtemp;
var markers = [];

var allData = {
	"mKind" : "allPay", // 매물종류
	"rKind" : [ "all_room" ], // 방종류
	"deposit_from" : "0 만원", // 보증금
	"deposit_to" : "9999999 만원",
	"mpay_from" : "0 만원", // 월세
	"mpay_to" : "9999999 만원",
	"parking" : null, // 주자가능
	"pet" : null, // 애완동물가능
	"lhok" : null, // LH가능
	"area" : [], // 평수(면적)
	"floor" : [], // 층수

	"east" : 127.14252173859859,
	"west" : 126.65294349152828,
	"south" : 37.390248965317404,
	"north" : 37.614135362297105
};
var allDataTemp = {
	"mKind" : "allPay", // 매물종류
	"rKind" : [ "all_room" ], // 방종류
	"deposit_from" : "0 만원", // 보증금
	"deposit_to" : "9999999 만원",
	"mpay_from" : "0 만원", // 월세
	"mpay_to" : "9999999 만원",
	"parking" : null, // 주자가능
	"pet" : null, // 애완동물가능
	"lhok" : null, // LH가능
	"area" : [], // 평수(면적)
	"floor" : [], // 층수

	"east" : 127.14252173859859,
	"west" : 126.65294349152828,
	"south" : 37.390248965317404,
	"north" : 37.614135362297105
};
function initMap() {
	// console.log("initmap");

	map = new google.maps.Map(document.getElementById('map'), {
		center : {
			lat : 37.5326049,
			lng : 126.8646878
		// lat : log,
		// lng : lag
		},

		zoom : 15,
		styles : [ {
			stylers : [ {
				visibility : 'simplified'
			} ]
		}, {
			elementType : 'labels',
			stylers : [ {
				visibility : 'off'
			} ]
		} ]
	});

	infoWindow = new google.maps.InfoWindow();
	service = new google.maps.places.PlacesService(map);
	map.addListener('idle', performSearch);

}
function performSearch() {
	// console.log("performSearch()");
	// allDataTemp = allData;
	jd = JSON.parse(JSON.stringify(allData));
	jdt = JSON.parse(JSON.stringify(allDataTemp));

	if (// 만약 네브바 가 감지 된다면 지도는 고정
			(jd.rKind[0]) != (jdt.rKind[0]) ||
			(jd.mKind     != (jdt.mKind  )) ||
			(jd.deposit_from != jdt.deposit_from) ||
			(jd.parking != jdt.parking)  ||
			(jd.pet != jdt.pet) ||
			(jd.lhok != jdt.lhok)
			

	) {
		allDataTemp = allData;
		console.log("네브바 클릭 변경  탐지");
		$.ajax({

			"url" : "/gomapin",
			"type" : "post",
			"dataType" : "json",
			"async" : false,
			"data" : allData

		}).done(function(listajax) { // 위치 정도 geometry.locaiton
			console.log("클릭후 새로운 정보 : " + listajax.length);

			list = [];
			list = listajax;
			locationtemp = listajax;
			// console.log("add_marker 끝" + JSON.stringify(list));
			console.log("클릭후 리스트 사이즈 : list.length : " + list.length);
		});

	} else {// 네브바는 고정 지도가 움직인다면
		console.log("지도 경로 변경 탐지");
		mapBound = map.getBounds().toJSON();
		allData.east = mapBound.east;
		allData.west = mapBound.west;
		allData.south = mapBound.south;
		allData.north = mapBound.north;

	}

	var request = {
		bounds : map.getBounds(),
		keyword : 'best view'
	};
	service.radarSearch(request, callback);
}
function callback(results, status) {

	// console.log("callback" + results);
	// console.log("call back 지도 바뀐다:" + list.length);

	addMarker(temp);// 처음 디폴트 값으로 찍어 줘야함
	addMarker(temp3);

	if (list.length == 0) {
		$("#sh").html("");
		// console.log("njj.size = " + njj.length);
		arrl = [];
		njj = [];
		PagingHelper.gotoPage(1);
	} else {
		
		deleteMarkers(); // 리스트는 이제
		markers = [];
		for (var i = 0; i < list.length; i++) {

			if (list.length != 0) {// ==========================================================================

				// console.log("addmarker");
				addMarker(list[i]);
				// console.log("마커스:"+JSON.stringify(markers));

			}

			if (i == list.length - 1) {
				
				//console.log("다뿌려줬고 이제 새로운 리스트를 불러오자");
				plist = list;
				list = [];

				$.ajax({
					"url" : "/gsearchTest",
					"type" : "POST",
					"dataType" : "json",
					"async" : false,
					"data" : allData

				}).success(function(listajax) {

					if (listajax.length != 0) {

						arrl = listajax;
						njj = []
						for (var i = 0; i < arrl.length; i++) {

							var obj = arrl[i];
							njj.push(obj["SELL_NUM"]);

						}
					} else {
						arrl = [];
					}

				});
			
				console.log("새로운 callback 리스트= " + list.length);
				console.log("마커스 사이즈는 : "+ markers.length);
				//console.log("callback arrl size:" + arrl.length);

				PagingHelper.gotoPage(1);
			}
		}
	}

}
function clearMarkers() {
	setMapOnAll(null);
}
function showMarkers() {
	setMapOnAll(map);
}
function deleteMarkers() {
	clearMarkers();
}
function setMapOnAll(map) {
	console.log("=======setMapOnAll========= "+ markers.length);

	for (var i = 0; i < markers.length; i++) {
		
		markers[i].setMap(map);
	}
}
function addMarker(place) {
	var marker = new google.maps.Marker({
		position : place.geometry.location,
		map : map,
		icon : {
			url : 'http://maps.gstatic.com/mapfiles/circle.png',
			anchor : new google.maps.Point(10, 10),
			scaledSize : new google.maps.Size(10, 17)
		}
	});
	markers.push(marker);

	for (var i = 0; i < markers.length; i++) {

		markers[i].setMap(map);
	}

	function createMarker(place) {
		var placeLoc = place.geometry.location;
		var marker = new google.maps.Marker({
			map : map,
			position : place.geometry.location
		});

		google.maps.event.addListener(marker, 'click', function() {
			infowindow.setContent(place.name);
			infowindow.open(map, this);
		});
	}

	if (list.length == 0) {

		$.ajax({

			"url" : "/gomapin",
			"type" : "post",
			"dataType" : "json",
			"async" : false,
			"data" : allData

		}).done(function(listajax) { // 위치 정도 geometry.locaiton
			console.log("새로운 맵 정보 : " + listajax.length);

			list = [];
			list = listajax;
			locationtemp = listajax;
			// console.log("add_marker 끝" + JSON.stringify(list));
			console.log("addmerker : list.length : " + list.length);
		});

	}


}

/**
 * **************** * paging! * * * ****************
 * 
 * 
 * 
 * *************************************************
 */

/*
 * paging variables
 */

var arrl = "empty";
var arrlTemp = "empty";
var jpgs = "empty";
var njj = "empty"; // 사진 url 정보 얻어올 값
var listajax = "empty";
var json = "empty";
var dn = 7750005;
var start = 0;
var end = 3;
var curr = 0;
var jsonarr = [];
var log;// 검색결과의 위도
var lag;// 검색결과의 경도
var PagingHelper = {

	'data' : {
		currentPage : 1

		,
		pageSize : 3,
		maxListCount : 5,
		startnum : 1 // 시작 글번호
		,
		lastnum : 700 // 마지막 글번호
		,
		totalCnt : 0 // 전체 글의 갯수.
		,
		totalPageCnt : 0
	// 전체 페이지 수
	},
	'setOption' : function(opt) {
		if (typeof opt != 'object')
			return;
		for (key in opt) {
			if (key in this.data) {
				this.data[key] = opt[key]; // data에 입력받은 설정값 할당.
			}
		}
	},
	'nj' : function(arr) {

		njj = arr;
	},
	'dn' : function(dnn) {

		dn = dnn;
	},
	'log' : function(a) {
		log = a;
	},
	'lag' : function(a) {
		lag = a;
	},
	'arrlist' : function(arr) {

		arrl = arr;

	},
	'jpglist' : function(jpg) {
		jpgs = jpg;

	},
	'allData' : function(all) {
		allData = all;
	},
	'linkajax' : function(num) {
		location.href = '/detail?num=' + njj[num];

	},
	'shHtml_google' : function(list) {
		var _ = this;

	},
	'shHtml' : function(n_block) {

		// console.log("shHtml");
		var _ = this;
		if (typeof n_block == 'undefined')
			n_block = curr;

		var sb = '';
		var sbTemp = '';

		if (arrl == 'empty') {
			curr = 1;
		} else {
			curr = n_block
		}
		end = (curr * 4) - 1;
		start = end - 3;
		if (end >= _.data.totalCnt) {
			end = _.data.totalCnt - 1;
		}

		var count = 0;
		if (arrl.length == 0) {
			sb = '';
			arrl = [];
			njj = [];

		} else {
			for (var i = start; i <= end; i++) {
				var obj = arrl[i];
				var obj2 = json[count];
				sb += "<div style='min-height: 125px; background-color: white; margin: 2%'>";
				sb += "<table>"
				sb += "<tr>";
				sb += "<td rowspan='3'>";

				sb += "<li class='first' onclick='PagingHelper.linkajax(" + i
						+ ");'>";
				sb += "<img src=" + obj2
						+ " style='height: 120px; width: 120px;'>";
				sb += "</li>";

				sb += "</td>";
				sb += "<td style='padding-left: 10px; vertical-align: bottom;'>";
				sb += "<span style='padding: 3px; background-color: #04B486;border-radius: 5px; color: white;'>"
						+ obj['B_MPAY'] + "</span>";
				sb += "<b style='color: #29B172; font-size: 20px; vertical-align: middle;'>"
						+ "2000/30" + "</b>";
				sb += "</td>";
				sb += "</tr>";

				sb += "<tr>";

				sb += "<td style='padding-left: 10px; font-size: 14px;'>";
				sb += "귀한 반전세 풀옵션 원룹입니다<br/>";
				sb += obj['B_TITLE'];
				sb += "</td>";
				sb += "</tr>";

				sb += "<tr>";
				sb += "<td style='padding-left: 10px; font-size: 12px; color: gray; vertical-align: text-top;'>";
				sb += obj['B_RKIND'] + "|" + "3층  관리비 5만원";
				sb += "</td>";
				sb += "</tr>";
				sb += "</table>";
				sb += "</div>";

				sb += "<hr style='margin: 30px;'/>";
				count++;
			}
		}
		jsonarr = [];
		return sb;

	},
	'button' : function() {
		if ($('#btt').data('clicked')) {
		} else {
		}

	},
	'pagingHtml' : function(pTotalCnt) {
		
		this.data.totalPageCnt = arrl.length;
		var _ = this;

		_.data['totalCnt'] = pTotalCnt ? pTotalCnt : _.data['totalCnt'];
		if (_.data['totalCnt'] == 0) {
			return "";
		}
		// 총페이지수 구하기 : 페이지 출력 범위 (1|2|3|4|5)
		_.data.totalPageCnt = Math.ceil(_.data.totalCnt / _.data.maxListCount);
		// 현재 블럭 구하기
		var n_block = Math.ceil(_.data.currentPage / _.data.pageSize);
		// 페이징의 시작페이지와 끝페이지 구하기
		var s_page = (n_block - 1) * _.data.pageSize + 1; // 현재블럭의 시작 페이지
		var e_page = n_block * _.data.pageSize; // 현재블럭의 끝 페이지
		if (e_page == _.data.currentPage) {
			s_page = s_page + 2;
			e_page = e_page + 2;
		}
		var sb = '';
		var sbTemp = '';

		// 블럭의 페이지 목록 및 현재페이지 강조
		for (var j = s_page; j <= e_page; j++) {
			if (j > _.data.totalPageCnt)
				break;
			if (j == _.data.currentPage) {
				sbTemp += "<li class='selected'>[<font color='red'>" + j
						+ "</font>]</li>";
			} else {
				sbTemp += "<li onclick='PagingHelper.gotoPage(" + j + ");'>["
						+ j + "]</li>";
			}
		}

		// 이전페이지 버튼
		sb = "<ul>"
		if (_.data.currentPage > s_page
				|| _.data.totalCnt > _.data.maxListCount && s_page > 1) {
			sb += "<li class='first' onclick='PagingHelper.gotoPage(1);'>처음</li >"
			sb += "<li class='previous' onclick='PagingHelper.gotoPage("
					+ (_.data.currentPage - 1) + ");'>이전</li>"
		}

		// 현재블럭의 페이지 목록
		sb += sbTemp

		// 다음페이지 버튼
		if (_.data.currentPage < _.data.totalPageCnt) {
			sb += "<li class='next' onclick='PagingHelper.gotoPage("
					+ (_.data.currentPage + 1) + ");'>다음</li>"
			sb += "<li class='last' onclick='PagingHelper.gotoPage("
					+ (_.data.totalPageCnt) + ");'>마지막</li >"
		}
		sb += "</ul>";
		this.shHtml(this.data.currentPage);

		//console.log("plist=" + plist.length + "list=" + list.length);
		jd = JSON.parse(JSON.stringify(allData));
		jdt = JSON.parse(JSON.stringify(allDataTemp));
		//console.log(jd.rKind[0]);
		//console.log(jdt.rKind[0]);

		if (
				
				(jd.rKind[0]) != (jdt.rKind[0]) ||
				(jd.mKind     != (jdt.mKind  )) ||
				(jd.deposit_from != jdt.deposit_from) ||
				(jd.parking != jdt.parking)  ||
				(jd.pet != jdt.pet) ||
				(jd.lhok != jdt.lhok)
		
		
		
		) {
			console
					.log("==================================================notperformsearch Entered");
			// notperformSearch();

			performSearch();

		}

		return sb;
	},
	"makeNum" : function(className, content) {
		return "<li class='" + className + "''>[" + content + "]</li>";
	},
	'setStartnumEndnum' : function() {
		// 시작 글번호
		this.data.startnum = (this.data.currentPage - 1)
				* this.data.maxListCount + 1;

		// 마지막 글번호
		var tmp = this.data.currentPage * this.data.maxListCount;
		this.data.lastnum = (tmp > this.data.totalCnt ? this.data.totalCnt
				: tmp);
	},// hiㅇ
	'gotoPage' : function(pageNum) {

		json = "empty";// 받은 정보를 바탕으로 이미지 주소를 다운 받는다
		this.data.currentPage = pageNum;
		this.setStartnumEndnum();

		var ends = (this.data.currentPage) * 4 - 1;// 3
		var starts = ends - 3;//
		var njjTemp = [];

		PagingHelper.data.totalPageCnt = njj.length;

		for (var i = starts; i < ends; i++) {

			njjTemp.push(njj[i]);
		}
		$("#ln").html(njj.length);
		if (njjTemp.length != 0) {
			$.ajax(
					{

						"type" : "get",
						"dataType" : "json",
						"async" : false,
						"url" : "/testing?curr=" + this.data.currentPage
								+ "&list=" + njjTemp

					}).success(function(listajax) {

				// json : 이미지 주소들
				json = JSON.parse(JSON.stringify(listajax));
				// console.log("json::"+JSON.stringify(json));

			});

			$("#paging").html(this.pagingHtml(this.data.totalPageCnt));
			$("#sh").html(this.shHtml());

		} else {
		}

	},
	'gotoPage_nav' : function(pageNum) {

		json = "empty";// 받은 정보를 바탕으로 이미지 주소를 다운 받는다
		this.data.currentPage = pageNum; // 현재 페이지를 세팅한다
		this.setStartnumEndnum();

		var ends = (this.data.currentPage) * 4 - 1;// 3
		var starts = ends - 3;//
		var njjTemp = [];
		// console.log("njj=>"+ JSON.stringify(njj));
		// console.log("njj size = " + njj.length);
		PagingHelper.data.totalPageCnt = njj.length;

		for (var i = starts; i < ends; i++) {

			njjTemp.push(njj[i]);
		}

		$("#ln").html(njj.length);
		if (njjTemp.length != 0) {
			$.ajax(
					{

						"type" : "get",
						"dataType" : "json",
						"async" : false,
						"url" : "/testing?curr=" + this.data.currentPage
								+ "&list=" + njjTemp

					}).done(function(listajax) {

				// json : 이미지 주소들
				json = JSON.parse(JSON.stringify(listajax));

			});
			// console.log("this.data.toalPageCnt Before enter paging="
			// + this.data.totalPageCnt);
			// console.log("리스트 의 길이는 =" + list.length);
			$("#paging").html(this.pagingHtml(this.data.totalPageCnt));
			$("#sh").html(this.shHtml());
		}
	}
}
var temp = {
	"geometry" : {
		"location" : {
			"lat" : 37.5326049,
			"lng" : 126.8646878

		}
	},
	"id" : "2e3dec069aed3a50278a0f8556d7520d84d3c4e6",
	"place_id" : "ChIJZ934S0KuEmsR_0lxV3PTR4M",
	"reference" : "CmRSAAAA63xm_pqSZSM6v3eVji64Ael9avkjcYNxKRPNVlA_06Mi5TfIhXHdJ6JJCvjUgjfqQ0H-uFA8odt17_NB-fGBXv2XpbI_NnCKxnFqcsUXmQLiUP1ATfoANN2feZfObRW1EhAdYjAWa3tqFP8aV_1zaMVlGhSYN-eSQxYD3WyPaxKj1u2VYMBdCg",
	"html_attributions" : [

	]
};
var temp2 = {
	"geometry" : {
		"location" : {
			"lat" : -33.8615479,
			"lng" : 152.20760719999998
		}
	},
	"id" : "2e3dec069aed3a50278a0f8556d7520d84d3c4e6",
	"place_id" : "ChIJZ934S0KuEmsR_0lxV3PTR4M",
	"reference" : "CmRSAAAA63xm_pqSZSM6v3eVji64Ael9avkjcYNxKRPNVlA_06Mi5TfIhXHdJ6JJCvjUgjfqQ0H-uFA8odt17_NB-fGBXv2XpbI_NnCKxnFqcsUXmQLiUP1ATfoANN2feZfObRW1EhAdYjAWa3tqFP8aV_1zaMVlGhSYN-eSQxYD3WyPaxKj1u2VYMBdCg",
	"html_attributions" : [

	]
};
var temp3 = {
	"reference" : "CmRSAAAA63xm_pqSZSM6v3eVji64Ael9avkjcYNxKRPNVlA_06Mi5TfIhXHdJ6JJCvjUgjfqQ0H-uFA8odt17_NB-fGBXv2XpbI_NnCKxnFqcsUXmQLiUP1ATfoANN2feZfObRW1EhAdYjAWa3tqFP8aV_1zaMVlGhSYN-eSQxYD3WyPaxKj1u2VYMBdCg",
	"html_attributions" : [

	],
	"geometry" : {
		"location" : {
			"lng" : 126.7348962,
			"lat" : 37.5386459
		}
	},
	"id" : "2e3dec069aed3a50278a0f8556d7520d84d3c4e6",
	"place_id" : "ChIJZ934S0KuEmsR_0lxV3PTR4M"
};

// <div style="min-height: 125px; background-color: white; margin: 2%">
// <table>
// <tr>
// <td rowspan="3"><img src="/images/room.jpg"
// style="height: 120px; width: 120px;"></td>
// <td style="padding-left: 10px; vertical-align: bottom;"><span
// style="padding: 3px; background-color: #04B486; border-radius: 5px; color:
// white;">월세</span>
// <b
// style="color: #29B172; font-size: 20px; vertical-align: middle;">
// 2000/30 </b></td>
// </tr>
// <tr>
// <td style="padding-left: 10px; font-size: 14px;">
// 귀한 반전세 풀옵션 원룸입니다
//
//
//
// </td>
// </tr>
// <tr>
// <td
// style="padding-left: 10px; font-size: 12px; color: gray; vertical-align:
// text-top;">
// 원룸 | 3층 | 21.4m<sup>2</sup> | 관리비 5만원
// </td>
// </tr>
// </table>
// </div>
// <hr style="margin: 5px;" />
//
// <div style="min-height: 125px; background-color: white; margin: 2%">
// <table>
// <tr>
// <td rowspan="3"><img src="/images/room2.jpg"
// style="height: 120px; width: 120px;"></td>
// <td style="padding-left: 10px; vertical-align: bottom;"><span
// style="padding: 3px; background-color: #04B486; border-radius: 5px; color:
// white;">월세</span>
// <b
// style="color: #29B172; font-size: 20px; vertical-align: middle;">
// 2000/30 </b></td>
// </tr>
// <tr>
// <td style="padding-left: 10px; font-size: 14px;">귀한 반전세 풀옵션
// 원룸입니다</td>
// </tr>
// <tr>
// <td
// style="padding-left: 10px; font-size: 12px; color: gray; vertical-align:
// text-top;">
// 원룸 | 3층 | 21.4m<sup>2</sup> | 관리비 5만원
// </td>
//
// </tr>
// </table>
//
// </div>
// <div style="min-height: 125px; background-color: white; margin: 2%">
// <table>
// <tr>
// <td rowspan="3"><img src="/images/room.jpg"
// style="height: 120px; width: 120px;"></td>
// <td style="padding-left: 10px; vertical-align: bottom;"><span
// style="padding: 3px; background-color: #04B486; border-radius: 5px; color:
// white;">월세</span>
// <b
// style="color: #29B172; font-size: 20px; vertical-align: middle;">
// 2000/30 </b></td>
// </tr>
// <tr>
// <td style="padding-left: 10px; font-size: 14px;">
// 귀한 반전세 풀옵션 원룸입니다
//
//
//
// </td>
// </tr>
// <tr>
// <td
// style="padding-left: 10px; font-size: 12px; color: gray; vertical-align:
// text-top;">
// 원룸 | 3층 | 21.4m<sup>2</sup> | 관리비 5만원
// </td>
// </tr>
// </table>
// </div>
// <hr style="margin: 5px;" />
//
// <div style="min-height: 125px; background-color: white; margin: 2%">
// <table>
// <tr>
// <td rowspan="3"><img src="/images/room2.jpg"
// style="height: 120px; width: 120px;"></td>
// <td style="padding-left: 10px; vertical-align: bottom;"><span
// style="padding: 3px; background-color: #04B486; border-radius: 5px; color:
// white;">월세</span>
// <b
// style="color: #29B172; font-size: 20px; vertical-align: middle;">
// 2000/30 </b></td>
// </tr>
// <tr>
// <td style="padding-left: 10px; font-size: 14px;">귀한 반전세 풀옵션
// 원룸입니다</td>
// </tr>
// <tr>
// <td
// style="padding-left: 10px; font-size: 12px; color: gray; vertical-align:
// text-top;">
// 원룸 | 3층 | 21.4m<sup>2</sup> | 관리비 5만원
// </td>
//
// </tr>
// </table>
//
// </div>

// <div style="min-height: 125px; background-color: white; margin: 2%">
// <table>
// <tr>
// <td rowspan="3"><img src="/images/room.jpg"
// style="height: 120px; width: 120px;"></td>
// <td style="padding-left: 10px; vertical-align: bottom;"><span
// style="padding: 3px; background-color: #04B486; border-radius: 5px; color:
// white;">월세</span>
// <b
// style="color: #29B172; font-size: 20px; vertical-align: middle;">
// 2000/30 </b></td>
// </tr>
// <tr>
// <td style="padding-left: 10px; font-size: 14px;">
// 귀한 반전세 풀옵션 원룸입니다
//
//
//
// </td>
// </tr>
// <tr>
// <td
// style="padding-left: 10px; font-size: 12px; color: gray; vertical-align:
// text-top;">
// 원룸 | 3층 | 21.4m<sup>2</sup> | 관리비 5만원
// </td>
// </tr>
// </table>
// </div>
// <hr style="margin: 5px;" />
//
// <div style="min-height: 125px; background-color: white; margin: 2%">
// <table>
// <tr>
// <td rowspan="3"><img src="/images/room2.jpg"
// style="height: 120px; width: 120px;"></td>
// <td style="padding-left: 10px; vertical-align: bottom;"><span
// style="padding: 3px; background-color: #04B486; border-radius: 5px; color:
// white;">월세</span>
// <b
// style="color: #29B172; font-size: 20px; vertical-align: middle;">
// 2000/30 </b></td>
// </tr>
// <tr>
// <td style="padding-left: 10px; font-size: 14px;">귀한 반전세 풀옵션
// 원룸입니다</td>
// </tr>
// <tr>
// <td
// style="padding-left: 10px; font-size: 12px; color: gray; vertical-align:
// text-top;">
// 원룸 | 3층 | 21.4m<sup>2</sup> | 관리비 5만원
// </td>
//
// </tr>
// </table>
//
// </div>
// var map;
// var infoWindow;
// var service;
// function initMap() {
// // var pos = { lat : ${json.results[0].geometry.location.lat },lng :
// // ${json.results[0].geometry.location.lng } };
// var map = new google.maps.Map(document.getElementById('map'), {
// "center" : {
// lat : 37.5172363,
// lng : 127.0473248
// }, // 변수명으로 설정 가능
// "scrollwheel" : true, // false 로 할경우 마우스 휠 작동이 안된다
// "zoom" : 15,
// styles: [{
// stylers: [{ visibility: 'simplified' }]
// }, {
// elementType: 'labels',
// stylers: [{ visibility: 'off' }]
// }]
// });
// var marker = new google.maps.Marker({
// "map" : map, // 이 map 은 위에 var map
// "position" : {
// lat : 37.5172363,
// lng : 127.0473248
// }, // 변수명으로 설정 가능
// "title" : '${param.addr}'
// });
// infoWindow = new google.maps.InfoWindow();
// service = new google.maps.places.PlacesService(map);
// map.addListener('idle', performSearch);
// }
//
// function performSearch() {
// var request = {
// bounds: map.getBounds(),
// keyword: 'best view'
// };
// service.radarSearch(request, callback);
// }
//
// setTimeout(initMap, 1000);
