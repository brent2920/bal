<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- �޷� -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>

td, th {
	height: 40px;
	font-size: 12px;
	font-family: �������;
	padding: 10px;
}

#title {
	width: 160px;
	background-color: #E6FFF7;
	font-size: 15px;
}

#memo {
	/* 			width: 300px; */
	width: 300px;
}

#memo4 {
/* 	width: 220px; */
}

#memo3 {
	width: 250px;
}

#memo1 {
	width: 60px;
}

#memo6 {
	width: 760px;
}

#title1 {
	height: 250px;
	background-color: #E6FFF7;
	font-size: 15px;
}

#title2 {
	height: 100px;
	background-color: #E6FFF7;
}

#title3 {
	height: 100px;
	width: 920px;
	font-size: 13px;
}

#memo7 {
	width: 920px;
	height: 500px;
}

.mCost>td {
	vertical-align: middle;
}
</style>


<div style="padding-left: 19%; padding-right: 19%; padding-top: 5%">
<form action="/roominsert" method="post" enctype="multipart/form-data">
	<div style="padding: 0; margin: 0; width: 1000px; height: 50px">
		<h2>����</h2>
	</div>
	<div class="well" style="margin-bottom: 50px;">
		<font>
			 - ����� �� ������ ���ŷ� �Ź��� ��ϵǸ�, �ִ� 30�ϱ��� ���� �� �ŷ��Ϸ� ���·� ��ȯ�˴ϴ�.<br />
			 - �� ����� �Ϸ�� �Ź��� �� ������ ȸ������(����ó, ���� ��)�� �Բ� ����˴ϴ�.<br />
			 - �ŷ��Ϸ�� �Ź��� �Ϸ�ó������ ���� ��� �����Ź� ������� �̿��� ���ѵ� �� �ֽ��ϴ�<br />
			 - �Ź� ���������� ���� �ǰų� �Ű�� �Ź��� ����� �Ǵ� ����ó���Ǹ� ��� �� ������ġ�� ���� �� �ֽ��ϴ�.<br />
		</font>
		<b style="color: #FA5858">
			- �ε��� �߰���� ���ŷ� �Ź��� ����� �� ������, �����߰���ȸ�� ���� �� �̿��Ͻñ� �ٶ��ϴ�.
		</b>
	</div>


	<h3>��ġ ����</h3>
	<hr style="margin: 0px;"/>
	<input type="hidden" name="b_latitude" id="b_lat"/>
	<input type="hidden" name="b_longitude" id="b_lng"/>
	<table>
		<tr>
			<td id="title" rowspan="5">�ּ�</td>
			<td id="memo4">
				<span class="glyphicons glyphicons-exclamation-sign"></span>
				���θ�, �ǹ���, ������ ���� ���հ˻��� �����մϴ�.</td>
			<td id="memo1"></td>
			<td id="map" rowspan="5" style="width: 400px; height: 250px; padding: 10px;">
			</td>
		</tr>
		<tr>
			<td id="memo"><input type="text" id="sample4_postcode"
				placeholder="�����ȣ" class="form-control" style="width: 70%;">
			</td>
			<td id="memo4">
				<input type="button" onclick="sample4_execDaumPostcode()"
				value="�ּҰ˻�" class="btn btn-default" style="
					color: #54B594; border-color: 54B594;">
			</td>
		</tr>
		<tr>
			<td id="memo" colspan="2"><input type="text"
				id="sample4_roadAddress" placeholder="���θ��ּ�" class="form-control"
				style="width: 100%;"></td>
		</tr>
		<tr>
			<td id="memo" colspan="2"><input type="text"
				id="sample4_jibunAddress" placeholder="�����ּ�" class="form-control"
				style="width: 100%" name="b_title"></td>
		</tr>
		<tr>
			<td id="memo" colspan="2"><input type="text" id=""
				placeholder="���ּ�" class="form-control" style="width: 100%"></td>
		</tr>
	</table>
	<hr style="margin-top: 0px; margin-bottom: 100px;"/>


	<h3>�⺻ ����</h3>
	<hr style="margin: 0px;"/>
	<table>
		<tr>

			<td id="title">�� ����</td>
			<td id="memo"><select class="form-control" style="width: 85%" name="b_rkind">
					<option selected>����������</option>
					<option value="����">����</option>
					<option value="1.5��">1.5��</option>
					<option value="����">����</option>
					<option value="������">������</option>
					<option value="���ǽ���">���ǽ���</option>
					<option value="����Ʈ">����Ʈ</option>
			</select></td>
			<td id="momo" colspan="3">
				��ǰ������ ��ÿ�(��)���� ��ÿ��� �Ź� ����� �����մϴ�(������ġ)
			</td>
		</tr>

		<tr>
			<td id="title" rowspan="2">�ŷ� ����</td>
			<td id="memo" colspan="4">
				<button type="button" class="btn btn-primary" id="wolseadd">
					���� �߰�
				</button>
			</td>
		</tr>


		<tr>

			<td id="memo" colspan="4"><font style="color: red">�ݾ��� �Է����ּ���</font>


				<div style="display: none; height: 50px" id="junse">
					<input type="number"
						style="width: 25%; float: left; text-align: right;"
						class="form-control" placeholder="����">
					<button type="button" id="btn1" style="float: left;" class="btn">���</button>
				</div>


				<div style="display: none; height: 50px;" id="wolse">
					<input type="number"
						style="width: 25%; float: left; text-align: right;"
						class="form-control" placeholder="������" name="b_deposit"> <input
						type="number" style="width: 25%; float: left; text-align: right;"
						class="form-control" placeholder="����" name="b_mpay">
					<button type="button" id="btn2" style="float: left;" class="btn">���</button>
				</div>

				<div style="display: none; height: 50px" id="mubojeung">
					<input type="number"
						style="width: 25%; float: left; text-align: right;"
						class="form-control" placeholder="��ġ��"> <input
						type="number" style="width: 25%; float: left; text-align: right;"
						class="form-control" placeholder="����">
					<button type="button" id="btn3" style="float: left;" class="btn">���</button>
				</div></td>
		</tr>

		<tr>
			<td id="title" rowspan="2">�ǹ� ����</td>
			<td id="memo" colspan="2"><select class="form-control"
				style="width: 85%" name="b_floor_all">
					<option selected="�ǹ� ���� ����">�ǹ� ���� ����</option>
					<c:forEach begin="1" end="50" var="i">
						<option value="${i }��">${i }��</option>
					</c:forEach>
			</select></td>
			<td id="title" rowspan="2">�ǹ�ũ��<br /> (1P = 3.3058��)
			</td>
			<td id="memo"><input type="number" class="form-control"
				style="width: 50%" placeholder="���" name="b_size" id="b_size"></td>
		</tr>


		<tr>

			<td id="memo" colspan="2"><select class="form-control"
				style="width: 85%" name="b_floor">
					<option selected="�ǹ� ���� ����">�ش� ���� ����</option>
					<option value="������">������</option>
					<option value="��ž">��ž</option>
					<c:forEach begin="1" end="50" var="i">
						<option value="${i }��">${i }��</option>
					</c:forEach>
			</select></td>

			<td id="memo"><input type="text" class="form-control"
				style="width: 50%" placeholder="����" name="b_size_m2" readonly value="" id="bsm2"></td>
		</tr>
	</table>
	<hr style="margin-top: 0px; margin-bottom: 100px;"/>
	

	<h3>�߰� ����</h3>
	<hr style="margin: 0px;"/>
	<table>
		<tr>
			<td id="title" rowspan="2">������</td>
			<td id="memo" colspan="3">
				<table style="margin-left: -10px;">
					<tr class="mCost">
						<td><input type="text" class="form-control"
							style="width: 100%; margin-right: 12px; text-align: right;" disabled id="b_gpay3" name="b_gpay"></td>
						<td><font size="2px" style="padding-right: 10px">����</font></td>
						<td><input type="checkbox" style="padding-right: 10px" id="b_gpay1">����</td>
						<td><input type="checkbox" checked="checked"
							style="margin-left: 10px" id="b_gpay2" name="b_gpay" value="����">����</td>
					</tr>
				</table>
			</td>

		</tr>

		<tr>
			<td id="memo" colspan="3">���� �׸� ���� : <input type="checkbox"
				style="margin-left: 10px" name="b_glist" value="���ͳ�">���ͳ� <input type="checkbox"
				style="margin-left: 10px"  name="b_glist" value="���� TV">���� TV <input type="checkbox"
				style="margin-left: 10px"  name="b_glist" value="û�Һ�">û�Һ� <input type="checkbox"
				style="margin-left: 10px"  name="b_glist" value="������">������ <input type="checkbox"
				style="margin-left: 10px"  name="b_glist" value="���ð���">���ð��� <input type="checkbox"
				style="margin-left: 10px"  name="b_glist" value="���⼼">���⼼
			</td>

		</tr>

		<tr>
			<td id="title">���� ����</td>
			<td id="memo" colspan="3">
				<span>
					<span class="mCost">
						<input type="checkbox" id="b_parking1" name="b_parking" value="����">����
						<input type="checkbox" checked="checked"
							style="margin-left: 10px" id="b_parking2" name="b_parking" value="�Ұ���">����
					</span>
				</span>
			</td>
		</tr>

		<tr>
			<td id="title">����������</td>
			<td id="memo"><input type="checkbox" id="b_eleve1" name="b_eleve" value="����">���� <input
				type="checkbox" checked="checked" style="margin-left: 10px" id="b_eleve2" name="b_eleve" value="����">����

			</td>
			<td id="title">�ݷ�����</td>
			<td id="memo"><input type="checkbox" name="b_petpossible" id="b_petpossible1" value="����">���� <input
				type="checkbox" checked="checked" style="margin-left: 10px" name="b_petpossible" id="b_petpossible2" value="�Ұ���">�Ұ���
			</td>
		</tr>

		<tr>
			<td id="title">���� ������</td>
			<td id="memo" colspan="3">
				<span>
					<span class="mCost">
						<input type="text" id="datepicker"
							placeholder="��¥�� �������ּ���" class="form-control" name="b_enterdate">
					</span>
				</span>
			</td>

		</tr>

		<tr>
			<td id="title">��ó��</td>
			<td colspan="3">
				<input type="text" name="b_nstation" class="form-control" placeholder="��ó�� �ִ� ���� �Է����ּ���">
			</td>
			
		</tr>
		<tr>
			<td id="title" rowspan="2">�ɼ��׸�</td>
			<td id="memo" colspan="3"><input type="checkbox"
				style="margin-left: 10px" name="b_option" value="������">������ <input type="checkbox"
				style="margin-left: 10px" name="b_option" value="��Ź��">��Ź�� <input type="checkbox"
				style="margin-left: 10px" name="b_option" value="ħ��">ħ�� <input type="checkbox"
				style="margin-left: 10px" name="b_option" value="å��">å�� <input type="checkbox"
				style="margin-left: 10px" name="b_option" value="����">���� <input type="checkbox"
				style="margin-left: 10px" name="b_option" value="TV">TV <input type="checkbox"
				style="margin-left: 10px" name="b_option" value="�Ź���">�Ź��� <input type="checkbox"
				style="margin-left: 10px" name="b_option" value="�����">����� <input type="checkbox"
				style="margin-left: 10px" name="b_option" value="����������">���������� <input type="checkbox"
				style="margin-left: 10px" name="b_option" value="�δ���">�δ���</td>
		</tr>

		<tr>
			<td id="memo" colspan="3">
				<input type="checkbox" style="margin-left: 10px"
					value="���ڷ�����" name="b_option">���ڷ�����
				<input type="checkbox" style="margin-left: 10px" 
					value="���ڵ����" name="b_option">���ڵ���� 
				<input type="checkbox" style="margin-left: 10px" 
					value="��" name="b_option">��
			</td>
		</tr>
	</table>
	<hr style="margin: 0px;"/>
	<div align="right" style="margin-bottom: 100px; padding-right: 7%; padding-top: 1%">
		<font color="red">�� LH ���� ����</font>
		<input type="checkbox" name="b_lhok" id="b_lhok1" value="����">����
		<input type="checkbox" name="b_lhok" checked id="b_lhok2" value="�Ұ���">�Ұ���
	</div>
	


	<h3>�� ����</h3>
	<hr style="margin: 0px;"/>
	<table>
		<tr>
			<td id="title">�� ����</td>
			<td id="memo6"><input type="text" class="form-control"
				placeholder="�� ) �ų����� ���� 5�аŸ�, ȥ�� ��� ���� �� �Դϴ�." name="b_rinfo"></td>

		</tr>

		<tr>
			<td id="title1">�� ����</td>
			<td>
				<textarea rows="15px" cols="90px"
					placeholder="�濡 ���� �߰� ������ �����ּ���. " class="form-control" name="b_detail"></textarea>
			</td>
		</tr>
	</table>
	<hr style="margin: 0px; margin-bottom: 100px;"/>

	<h3>���� ���ε�</h3>
	<table>
		<tr>
			<td id="title3">
				- ������ ���η� ���� ������ �����մϴ�. (���� ������ �ּ� 800�ȼ�)<br />
				- ���� �뷮�� ���� 1��� 10MB���� ����� �����մϴ�.<br />
				- ������ �ּ� 3�� �̻� ����ؾ��ϸ�, �ִ�
				15����� �����մϴ�. �� �̻� ����� ��� ���ε� �ð��� �ټ� ������ �� �ֽ��ϴ�.
			</td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td id="memo7" style="padding: 0%; margin: 0%; text-align: center;">
				<c:forEach begin="1" end="15" var="i">
					<div style="float: left; width: 170px; height: 200px; margin: 5px;"
						align="left">
						<img alt="" src="" style="width: 170px; height: 150px; background-color: #EEEEEE;"
							id="img${i }"> <input type="file" id="file${i }"
							style="display: none" name="file">
						<div align="center" style="padding-top: 10px;">
							<button type="button" id="bbt${i }" 
								class="btn btn-default" style="color: #646464;
								border-color: #646464">�߰�</button>
							<button type="button" id="cbt${i }" 
								class="btn btn-default"  style="color: #646464;
								border-color: #646464">���</button>
						</div>
					</div>
				</c:forEach>
			</td>
		</tr>
	</table>
	<br/>
	<div align="center" style="margin-top: 20px; margin-bottom: 80px;">
		<button type="submit" class="btn btn-primary" 
			style="font-size: 20px; padding-left: 20px; padding-right: 20px;
			padding-top: 10px; padding-bottom: 10px;">���</button>
		<a href="/">
			<button type="submit" class="btn btn-danger" 
				style="font-size: 20px; padding-left: 20px; padding-right: 20px;
				padding-top: 10px; padding-bottom: 10px;">���</button>
		</a>
	</div>
</form>
</div>




<script>
	$("#junseadd").click(function() {
		$("#junse").fadeIn(500);
	})
	$("#btn1").click(function() {
		$("#junse").fadeOut(500);

	})

	$("#wolseadd").click(function() {
		$("#wolse").fadeIn(500);
	})
	$("#btn2").click(function() {
		$("#wolse").fadeOut(500);

	})

	$("#mubojeungadd").click(function() {
		$("#mubojeung").fadeIn(500);
	})
	$("#btn3").click(function() {
		$("#mubojeung").fadeOut(500);

	})
</script>

<script>

// ������
$("#b_gpay1").click(function() {
		console.log($(this).prop("checked"));
	if ($(this).prop("checked")) {
		console.log($(this).prop("checked"));
		$("#b_gpay2").prop("checked", false);
		$("#b_gpay3").prop("disabled",false)
	} else {
		$("#b_gpay2").prop("checked", true);
		
	}
});

$("#b_gpay2").click(function() {
		console.log($(this).prop("checked"));
	if ($(this).prop("checked")) {
		console.log($(this).prop("checked"));
		$("#b_gpay1").prop("checked", false);
		$("#b_gpay3").prop("disabled",true);
	} else {
		$("#b_gpay1").prop("checked", true);
	}
});

// ��������


$("#b_parking1").click(function() {
	console.log($(this).prop("checked"));
if ($(this).prop("checked")) {
	console.log($(this).prop("checked"));
	$("#b_parking2").prop("checked", false);
} else {
	$("#b_parking2").prop("checked", true);
}
});

$("#b_parking2").click(function() {
	console.log($(this).prop("checked"));
if ($(this).prop("checked")) {
	console.log($(this).prop("checked"));
	$("#b_parking1").prop("checked", false);
} else {
	$("#b_parking1").prop("checked", true);
}
});

// ����������


$("#b_eleve1").click(function() {
	console.log($(this).prop("checked"));
if ($(this).prop("checked")) {
	console.log($(this).prop("checked"));
	$("#b_eleve2").prop("checked", false);
} else {
	$("#b_eleve2").prop("checked", true);
}
});

$("#b_eleve2").click(function() {
	console.log($(this).prop("checked"));
if ($(this).prop("checked")) {
	console.log($(this).prop("checked"));
	$("#b_eleve1").prop("checked", false);
} else {
	$("#b_eleve1").prop("checked", true);
}
});


// �ݷ�����
$("#b_petpossible1").click(function() {
	console.log($(this).prop("checked"));
if ($(this).prop("checked")) {
	console.log($(this).prop("checked"));
	$("#b_petpossible2").prop("checked", false);
} else {
	$("#b_petpossible2").prop("checked", true);
}
});

$("#b_petpossible2").click(function() {
	console.log($(this).prop("checked"));
if ($(this).prop("checked")) {
	console.log($(this).prop("checked"));
	$("#b_petpossible1").prop("checked", false);
} else {
	$("#b_petpossible1").prop("checked", true);
}
});


//LH ���� ����

$("#b_lhok1").click(function() {
	console.log($(this).prop("checked"));
if ($(this).prop("checked")) {
	console.log($(this).prop("checked"));
	$("#b_lhok2").prop("checked", false);
} else {
	$("#b_lhok2").prop("checked", true);
}
});

$("#b_lhok2").click(function() {
	console.log($(this).prop("checked"));
if ($(this).prop("checked")) {
	console.log($(this).prop("checked"));
	$("#b_lhok1").prop("checked", false);
} else {
	$("#b_lhok1").prop("checked", true);
}
});
</script>



<script>
// ���� / ��� ���
$("#b_size").click(function() {
	var  area = 3.3058 * $(this).val();
	
	$("input[name='b_size_m2']").val(area);
});
$("#b_size").keyup(function() {
	var  area = 3.3058 * $(this).val();
	
	$("input[name='b_size_m2']").val(area);
});
</script>

<script>
	<c:forEach begin="1" end="15" var="i">
	$("#bbt${i}").click(function() {
		$("#file${i}").trigger("click");

	});
	$("#file${i}").change(function() {
		console.log(this);
		readURL(this);
	});

	$("#cbt${i}").click(function() {
		$("#img${i}").attr("src", "")

	})

	</c:forEach>

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$(input).prev().attr("src", e.target.result); // prev �� ���� �ִ�.. next �� �Ʒ��� �ִ�..
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>

<script>
	// �޷� 
	$(function() {
		$("#datepicker").datepicker();
	});
</script>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//�� ���������� ���θ� �ּ� ǥ�� ��Ŀ� ���� ���ɿ� ����, �������� �����͸� �����Ͽ� �ùٸ� �ּҸ� �����ϴ� ����� �����մϴ�.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					autoClose : true,
					oncomplete : function(data) {
						var fullRoadAddr = data.roadAddress; // ���θ� �ּ� ����
						var extraRoadAddr = ''; // ���θ� ������ �ּ� ����
						if (data.bname !== '' && /[��|��|��]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// ���θ�, ���� ������ �ּҰ� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// ���θ�, ���� �ּ��� ������ ���� �ش� ������ �ּҸ� �߰��Ѵ�.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
						document.getElementById('sample4_postcode').value = data.zonecode; //5�ڸ� �������ȣ ���
						document.getElementById('sample4_roadAddress').value = fullRoadAddr;
						document.getElementById('sample4_jibunAddress').value = data.jibunAddress;
						//===================================================================
						resetMap();	
						//=============================================================	
					}
				}).open();
	}
	function resetMap() {
		var xhr = new XMLHttpRequest();
		xhr.open("get", "/roomMap?map=" + $("#sample4_roadAddress").val(), true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.status == 200 && xhr.readyState == 4) {
				var obj = JSON.parse(xhr.responseText);
				console.log(obj);
					llat = obj.results[0].geometry.location.lat;
					llng = obj.results[0].geometry.location.lng;
					$("#b_lat").val(llat);
					$("#b_lng").val(llng);
				initMap1(llat, llng);
			}
		}
	}
	function initMap1(llat, llng) {
		var pos1 = {
			lat : llat == "" ? 37.5172363 : llat,
			lng : llng == "" ? 127.0473248 : llng
		};
		// Create a map object and specify the DOM element for display.
		var map1 = new google.maps.Map(document.getElementById('map'), {
			"center" : pos1,
			"scrollwheel" : true,
			"zoom" : 16
		});
		var marker = new google.maps.Marker({
			"map" : map1,
			"position" : pos1,
			"title" : ''
		});
	}
</script>


<!-- ���� // script �� �� �Ʒ� �� ���´� -->
<script
	src="https://maps.googleapis.com/maps/api/js?key=${apiKey }&callback=initMap1"
	async defer></script>
