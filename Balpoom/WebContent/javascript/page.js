
//<div style="min-height: 125px; background-color: white; margin: 2%">
//<table>
//	<tr>
//		<td rowspan="3"><img src="/images/room.jpg"
//			style="height: 120px; width: 120px;"></td>
//		<td style="padding-left: 10px; vertical-align: bottom;"><span
//			style="padding: 3px; background-color: #04B486; border-radius: 5px; color: white;">월세</span>
//			<b
//			style="color: #29B172; font-size: 20px; vertical-align: middle;">
//				2000/30 </b></td>
//	</tr>
//	<tr>
//		<td style="padding-left: 10px; font-size: 14px;">
//										귀한 반전세 풀옵션 원룸입니다
//
//
//
//		</td>
//	</tr>
//	<tr>
//		<td
//			style="padding-left: 10px; font-size: 12px; color: gray; vertical-align: text-top;">
//			원룸 | 3층 | 21.4m<sup>2</sup> | 관리비 5만원
//		</td>
//	</tr>
//</table>
//</div>
//<hr style="margin: 5px;" />
//
//<div style="min-height: 125px; background-color: white; margin: 2%">
//<table>
//	<tr>
//		<td rowspan="3"><img src="/images/room2.jpg"
//			style="height: 120px; width: 120px;"></td>
//		<td style="padding-left: 10px; vertical-align: bottom;"><span
//			style="padding: 3px; background-color: #04B486; border-radius: 5px; color: white;">월세</span>
//			<b
//			style="color: #29B172; font-size: 20px; vertical-align: middle;">
//				2000/30 </b></td>
//	</tr>
//	<tr>
//		<td style="padding-left: 10px; font-size: 14px;">귀한 반전세 풀옵션
//			원룸입니다</td>
//	</tr>
//	<tr>
//		<td
//			style="padding-left: 10px; font-size: 12px; color: gray; vertical-align: text-top;">
//			원룸 | 3층 | 21.4m<sup>2</sup> | 관리비 5만원
//		</td>
//
//	</tr>
//</table>
//
//</div>

function initMap() {
	// var pos = { lat : ${json.results[0].geometry.location.lat },lng :
	// ${json.results[0].geometry.location.lng } };
	var map = new google.maps.Map(document.getElementById('map'), {
		"center" : {
			lat : 37.5172363,
			lng : 127.0473248
		}, // 변수명으로 설정 가능
		"scrollwheel" : true, // false 로 할경우 마우스 휠 작동이 안된다
		"zoom" : 15
	});
	var marker = new google.maps.Marker({
		"map" : map, // 이 map 은 위에 var map
		"position" : {
			lat : 37.5172363,
			lng : 127.0473248
		}, // 변수명으로 설정 가능
		"title" : '${param.addr}'
	});
}

setTimeout(initMap, 1000);
var arrl = "empty";
var jpgs = "empty";
var start = 0;
var end = 3;
var curr = 0;
var njj = "empty";
var dn = 7750005;
var listajax  = "empty";
var json = "empty";
var jsonarr = [];




var PagingHelper = {

	'data' : {
		currentPage : 1 // 현재페이지
		// ,startPage : 1 // 시작페이지
		,
		pageSize : 3 // 페이지 사이즈 (화면 출력 페이지 수)
		,
		maxListCount : 5 // (보여질)최대 리스트 수 (한페이지 출력될 항목 갯수)
		,
		startnum : 1 // 시작 글번호
		,
		lastnum : 50 // 마지막 글번호
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
	'nj' : function(arr){
		//console.log("njj addded")
		njj = arr;
	},
	'dn' : function(dnn){
		//console.log("njj addded")
		dn = dnn;
	},

	'arrlist' : function(arr) {
		//console.log("arrlist1");
		arrl = arr;
	},
	'jpglist' : function(jpg){
		console.log('jpg.list.entered');
		jpgs = jpg;
		//var obj = arrl[i];
		//sb+= obj['B_RKIND'] 
		for(var i = 0; i < 2; i++){
			var obj = jpgs[i];
			//console.log(jpgs.length);
			//console.log(obj);
		}
	},
	'linkajax' : function(num){
		//console.log("linkajax "+num  +" menu=" + njj[num]);
		location.href='/detail?num='+njj[num];
			
	
	},

	'shHtml' : function(n_block) {
		var _ = this;
		if (typeof n_block == 'undefined')n_block = curr;
		console.log("shHtml");

		var sb = '';
		var sbTemp = '';
	
		if (arrl == 'empty') {
			curr = 1;
		} else {
			curr = n_block
		}
		end = (curr * 4) - 1;
		start = end - 3;
		console.log("total_count="+_.data.totalCnt + " end="+ end);
		if(end >= _.data.totalCnt) {end = _.data.totalCnt -1; }

		//console.log("curr=" + curr + " start=" + start + " end=" + end );
		//console.log(arrl);
		//console.log("obj2=>"+ jpgs);
		//console.log("jsonarr=>"+jsonarr);
		var count = 0;
		for (var i = start; i <= end; i++) {
			var obj = arrl[i];
			//var obj2 = jpgs[count];
			var obj2 = json[count];
			sb+="<div style='min-height: 125px; background-color: white; margin: 2%'>";
			sb+="<table>"
			sb+="<tr>";
			sb+="<td rowspan='3'>";
					//sb+="<img src="+'/images/room.jpg'+" style='height: 120px; width: 120px;'>";
			sb+= "<li class='first' onclick='PagingHelper.linkajax("+ i +");'>";		
			sb+="<img src="+obj2+" style='height: 120px; width: 120px;'>";
			sb+= "</li>";
			
			
			sb+="</td>";
			sb+="<td style='padding-left: 10px; vertical-align: bottom;'>";
			sb+="<span style='padding: 3px; background-color: #04B486;border-radius: 5px; color: white;'>" + obj['B_MPAY'] +"</span>";
			sb+="<b style='color: #29B172; font-size: 20px; vertical-align: middle;'>"+ "2000/30" + "</b>";
			sb+="</td>";
			sb+="</tr>";
			

			sb+="<tr>";
			
				sb+="<td style='padding-left: 10px; font-size: 14px;'>";
						sb+="귀한 반전세 풀옵션 원룹입니다<br/>";
						sb+= obj['B_TITLE'];
				sb+="</td>";
			sb+="</tr>";
			
			
			sb+="<tr>";
				sb+="<td style='padding-left: 10px; font-size: 12px; color: gray; vertical-align: text-top;'>";
				sb+= obj['B_RKIND'] + "|" + "3층  관리비 5만원";
				sb+= "</td>";
			sb+="</tr>";
			sb+="</table>";
			sb+="</div>";
		
			sb+="<hr style='margin: 30px;'/>";
			count++;
		}
		// console.log(sb);
		jsonarr= [];
		return sb;

	},
	

	'button' : function(){
		if($('#btt').data('clicked')){
			console.log("if");
		}else{
			console.log("else");
		}
		
		
	},
	

	'pagingHtml' : function(pTotalCnt) {

		//console.log("pagingHtml=> total count =>" + pTotalCnt);

		var _ = this;

		_.data['totalCnt'] = pTotalCnt ? pTotalCnt : _.data['totalCnt'];
		//console.log("totalCnt=>"+ _.data['totalCnt'] + " maxListCount=>"+ _.data.maxListCount);
		if (_.data['totalCnt'] == 0) {
			return "";
		}
		// 총페이지수 구하기 : 페이지 출력 범위 (1|2|3|4|5)
		_.data.totalPageCnt = Math.ceil(_.data.totalCnt / _.data.maxListCount);
		//console.log("total_page=>"+ _.data.totalPageCnt);
		// 현재 블럭 구하기
		var n_block = Math.ceil(_.data.currentPage / _.data.pageSize);
		console.log("n_block=>"+n_block + " currentPage=>"+ this.data.currentPage);
		// 페이징의 시작페이지와 끝페이지 구하기
		var s_page = (n_block - 1) * _.data.pageSize + 1; // 현재블럭의 시작 페이지
		var e_page = n_block * _.data.pageSize; // 현재블럭의 끝 페이지
		console.log("s_page=>"+s_page + " e_page=>"+e_page);
		if(e_page == _.data.currentPage){
			s_page = s_page+2;
			e_page = e_page+2;
		}
		var sb = '';
		var sbTemp = '';

		// 블럭의 페이지 목록 및 현재페이지 강조
		for (var j = s_page; j <= e_page; j++) {
			if (j > _.data.totalPageCnt)
				break;
			if (j == _.data.currentPage) {
				sbTemp += "<li class='selected'>[<font color='red'>" + j + "</font>]</li>";
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

		return sb;
	},
	"makeNum" : function(className, content) { // 필요없음.
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
	},
	'gotoPage' : function(pageNum) {
		console.log("gotoPage");
		json = "empty";
		this.data.currentPage = pageNum; // 입력받은 페이지번호를 현재페이지로 설정
		this.setStartnumEndnum(); // 입력받은 페이지의 startnum과 endnum구하기
	   	//console.log("currentPg=>"+this.data.currentPage + " 입력밭은");
		// 콘솔 출력 (삭제)
		console.log(this.data.currentPage + "/" + this.data.startnum + "/"
				+ this.data.lastnum);
		var ends = (this.data.currentPage) * 4 -1;//3
		var starts = ends-3;//
		var njjTemp = [];
		for(var i = starts ; i <= ends ; i++){
			console.log("njj[i]="+ njj[i]);
			njjTemp.push(njj[i]);
		}
		console.log("njjTemp=>"+ njjTemp);
		console.log("curr page =>"+ this.data.currentPage + " list=>"+ njjTemp);
	$.ajax({
			
			"type":"get",
			"dataType":"json",
			 "async": false,
			 "url": "/testing?curr="+this.data.currentPage+"&list="+njjTemp
			
		}).done(function(listajax){
			
			json= JSON.parse( JSON.stringify(listajax));
		
		});
	
		
		
		$("#paging").html(this.pagingHtml());
		$("#sh").html(this.shHtml());

	}
}


