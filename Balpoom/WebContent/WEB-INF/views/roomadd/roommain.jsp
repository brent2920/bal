<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>





<!-- �޷� -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>




<style>
td, th {
	height: 40px;
	font-size: 12px;
	font-family: �������;
}

#title {
	width: 160px;
	background-color: #57ABDB;
}

#memo {
	/* 			width: 300px; */
	width: 300px;
}

#memo4 {
	width: 220px;
}

#memo3 {
	width: 250px;
}

#memo1 {
	width: 60px;
}

#map {
	width: 250px;
	background-color: #EEF2EA;
}

#memo6 {
	width: 760px;
}

#title1 {
	height: 250px;
	background-color: #57ABDB
}

#title2 {
	height: 100px;
	background-color: #57ABDB
}

#title3 {
	height: 100px;
	width: 920px;
}

#memo7 {
	width: 920px;
	height: 320px;
}

.mCost>td {
	vertical-align: middle;
}
</style>


<div style="padding-left: 19%; padding-right: 19%; padding-top: 5%">
	<div style="padding: 0; margin: 0; width: 1000px; height: 50px">
		<h2 style="font-family: �������;">&nbsp;���� �ϱ�</h2>
	</div>
	<div class="well" style="boder: 1px solid; background-color: black;">
		<font color="white"> - ����� �� ������ ���ŷ� �Ź��� ��ϵǸ�, �ִ� 30�ϱ��� ���� ��
			�ŷ��Ϸ� ���·� ��ȯ�˴ϴ�.<br /> - �� ����� �Ϸ�� �Ź��� �� ������ ȸ������(����ó, ���� ��)�� �Բ�
			����˴ϴ�.<br /> - �ŷ��Ϸ�� �Ź��� �Ϸ�ó������ ���� ��� �����Ź� ������� �̿��� ���ѵ� �� �ֽ��ϴ�<br />
			- �Ź� ���������� ���� �ǰų� �Ű�� �Ź��� ����� �Ǵ� ����ó���Ǹ� ��� �� ������ġ�� ���� �� �ֽ��ϴ�.<br />
		</font> <b style="color: #00BFFF">- �ε��� �߰���� ���ŷ� �Ź��� ����� �� ������, �����߰���ȸ��
			���� �� �̿��Ͻñ� �ٶ��ϴ�.</b><br />
	</div>

	<div style="height: 50px"></div>




	<h3 style="font-family: �������;">&nbsp;��ġ ����</h3>
	<table border="1" rules="none">

		<tr>
			<td id="title" rowspan="5">�ּ�</td>
			<td id="memo4">���θ�, �ǹ���, ������ ���� ���հ˻��� �����մϴ�.</td>
			<td id="memo1"></td>
			<td id="map" rowspan="5"></td>
		</tr>


		<tr>

			<td id="memo"><input type="text" id="sample4_postcode"
				placeholder="�����ȣ" class="form-control" style="width: 70%;">
			</td>
			<td id="memo4"><input type="button"
				onclick="sample4_execDaumPostcode()" value="�ּҰ˻�"
				class="btn btn-primary"></td>

		</tr>

		<tr>
			<td id="memo" colspan="2"><input type="text"
				id="sample4_roadAddress" placeholder="���θ��ּ�" class="form-control"
				style="width: 100%;"></td>

		</tr>


		<tr>
			<td id="memo" colspan="2"><input type="text"
				id="sample4_jibunAddress" placeholder="�����ּ�" class="form-control"
				style="width: 100%"></td>

		</tr>


		<tr>
			<td id="memo" colspan="2"><input type="text" id=""
				placeholder="���ּ�" class="form-control" style="width: 100%"></td>
		</tr>

	</table>


	<div style="height: 50px"></div>

	<h3 style="font-family: �������;">&nbsp;�⺻ ����</h3>
	<table border="1" rules="none">
		<tr>

			<td id="title">�� ����</td>
			<td id="memo"><select class="form-control" style="width: 85%">
					<option selected="����������">����������</option>
					<option value="����">����</option>
					<option value="1.5��">1.5��</option>
					<option value="����">����</option>
					<option value="������">������</option>
					<option value="���ǽ���">���ǽ���</option>
					<option value="����Ʈ">����Ʈ</option>
			</select></td>
			<td id="momo" colspan="3">�ٹ濡���� ��ÿ�(��)���� ��ÿ��� �Ź� ����� �����մϴ�(������ġ)
			</td>
		</tr>

		<tr>
			<td id="title" rowspan="2">�ŷ� ����</td>
			<td id="memo" colspan="4"><button type="button"
					class="btn btn-primary">���� �߰�</button>
				<button type="button" class="btn btn-primary">���� �߰�</button>
				<button type="button" class="btn btn-primary">������ �߰�</button> <input
				type="checkbox">�ܱ� ����</td>
			<!-- 				<td id="memo">��</td> -->
			<!-- 				<td id="memo">��</td> -->
			<!-- 				<td id="memo">��</td>	 -->
		</tr>


		<tr>

			<td id="memo" colspan="4"><font style="color: red">�ŷ�������
					�߰��� �ּ���. ���� ���� �����ϸ�, ù ��° ������ �ŷ������� �켱 ���� �˴ϴ�.<br /> (��ġ���� �ִ� ���
					������ �Է¶��� ���� ��ġ���� �Է� �ϼ���. - �� �Է½� ���� �Ź��� ���ߵ˴ϴ�.)
			</font></td>
		</tr>

		<tr>
			<td id="title" rowspan="2">�ǹ� ����</td>
			<td id="memo" colspan="2"><select class="form-control"
				style="width: 85%">
					<option selected="�ǹ� ���� ����">�ǹ� ���� ����</option>
					<c:forEach begin="1" end="50" var="i">
						<option value="${i }">${i }��</option>
					</c:forEach>
			</select></td>
			<td id="title" rowspan="2">�ǹ�ũ��<br /> (1P = 3.3058��)
			</td>
			<td id="memo"><input type="number" class="form-control"
				style="width: 50%"></td>
		</tr>


		<tr>

			<td id="memo" colspan="2"><select class="form-control"
				style="width: 85%">
					<option selected="�ǹ� ���� ����">�ش� ���� ����</option>
					<option value="������">������</option>
					<option value="��ž">��ž</option>
					<c:forEach begin="1" end="50" var="i">
						<option value="${i }">${i }��</option>
					</c:forEach>
			</select></td>

			<td id="memo"><input type="number" class="form-control"
				style="width: 50%"></td>
		</tr>
	</table>

	<div style="height: 50px"></div>




	<h3 style="font-family: �������;">&nbsp;�߰� ����</h3>

	<table border="1px solid">
		<tr>
			<td id="title" rowspan="2">������</td>
			<td id="memo" colspan="3">
				<!-- 					<div align="center" style="vertical-align: middle;"> --> <!-- 					<div style="float: left; padding-right: 2%;"> -->
				<!-- 						<input type="checkbox">���� --> <!-- 					</div> --> <!-- 					<div style="float: left; padding-right: 2%"> -->
				<!-- 						<input type="text" class="form-control" style="width: 100%"> -->
				<!-- 					</div> --> <!-- 					<div style="float: left; padding-right: 2%;"> -->
				<!-- 						<font size="2px">����</font> --> <!-- 					</div> --> <!-- 					<div style="float: left; padding-right: 2%"> -->
				<!-- 						<input type="checkbox" checked="checked">���� --> <!-- 					</div> -->
				<!-- 				</div> -->
				<table>
					<tr class="mCost">

						<td><input type="text" class="form-control"
							style="width: 100%; margin-right: 12px; text-align: right;"></td>
						<td><font size="2px" style="padding-right: 10px">����</font></td>
						<td><input type="checkbox" style="padding-right: 10px">����</td>
						<td><input type="checkbox" checked="checked"
							style="margin-left: 10px">����</td>
					</tr>
				</table>
			</td>

		</tr>

		<tr>
			<td id="memo" colspan="3">���� �׸� ���� : <input type="checkbox"
				style="margin-left: 10px">���ͳ� <input type="checkbox"
				style="margin-left: 10px">���� TV <input type="checkbox"
				style="margin-left: 10px">û�Һ� <input type="checkbox"
				style="margin-left: 10px">������ <input type="checkbox"
				style="margin-left: 10px">���ð��� <input type="checkbox"
				style="margin-left: 10px">���⼼
			</td>

		</tr>

		<tr>
			<td id="title">���� ����</td>
			<td id="memo" colspan="3">
				<table>
					<tr class="mCost">

						<td><input type="text" class="form-control"
							style="width: 100%; margin-right: 12px; text-align: right;"></td>
						<td><font size="2px" style="padding-right: 10px">����</font></td>
						<td><input type="checkbox" style="padding-right: 10px">����</td>
						<td><input type="checkbox" checked="checked"
							style="margin-left: 10px">����</td>
					</tr>
				</table>

			</td>


		</tr>

		<tr>
			<td id="title">����������</td>
			<td id="memo"><input type="checkbox">���� <input
				type="checkbox" checked="checked" style="margin-left: 10px">����

			</td>
			<td id="title">�ݷ�����</td>
			<td id="memo"><input type="checkbox">���� <input
				type="checkbox" checked="checked" style="margin-left: 10px">�Ұ���
			</td>
		</tr>

		<tr>
			<td id="title">���� ������</td>
			<td id="memo" colspan="3">

				<table>
					<tr class="mCost">

						<td><input type="text" id="datepicker" class="form-control"></td>
						<td><input type="checkbox" style="margin-left: 10px">���
							����</td>
						<td><input type="checkbox" style="margin-left: 10px">
							��¥ ����</td>

					</tr>
				</table>
			</td>

		</tr>

		<tr>
			<td id="title" rowspan="2">�ɼ��׸�</td>
			<td id="memo" colspan="3"><input type="checkbox"
				style="margin-left: 10px">������ <input type="checkbox"
				style="margin-left: 10px">��Ź�� <input type="checkbox"
				style="margin-left: 10px">ħ�� <input type="checkbox"
				style="margin-left: 10px">å�� <input type="checkbox"
				style="margin-left: 10px">���� <input type="checkbox"
				style="margin-left: 10px">TV <input type="checkbox"
				style="margin-left: 10px">�Ź��� <input type="checkbox"
				style="margin-left: 10px">����� <input type="checkbox"
				style="margin-left: 10px">���������� <input type="checkbox"
				style="margin-left: 10px">�δ���</td>
		</tr>

		<tr>

			<td id="memo" colspan="3"><input type="checkbox"
				style="margin-left: 10px">���ڷ����� <input type="checkbox"
				style="margin-left: 10px">���ڵ���� <input type="checkbox"
				style="margin-left: 10px">��</td>

		</tr>
	</table>

	<div style="height: 50px"></div>

	<h3 style="font-family: �������;">&nbsp;�� ����</h3>

	<table border="1">
		<tr>
			<td id="title">�� ����</td>
			<td id="memo6"><input type="text" class="form-control"
				placeholder="�� ) �ų����� ���� 5�аŸ�, ȥ�� ��� ���� �� �Դϴ�."></td>

		</tr>

		<tr>
			<td id="title1">�� ����</td>
			<td><textarea rows="15px" cols="90px"
					placeholder="�濡 ���� �߰� ������ �����ּ���. " class="form-control"></textarea>
			</td>
		</tr>
	</table>


	<div style="height: 50px"></div>
	<h3 style="font-family: �������;">&nbsp;���� ���ε�</h3>


	<table border="1px solid #FF0000">
		<tr>
			<td id="title3">- ������ ���η� ���� ������ �����մϴ�. (���� ������ �ּ� 800�ȼ�)<br />
				- ���� �뷮�� ���� 1��� 10MB���� ����� �����մϴ�.<br /> - ������ �ּ� 3�� �̻� ����ؾ��ϸ�, �ִ�
				15����� �����մϴ�. �� �̻� ����� ��� ���ε� �ð��� �ټ� ������ �� �ֽ��ϴ�.
			</td>
		</tr>
	</table>
	<div style="height: 15px"></div>
	<table border="1px">

		<tr>
			<td id="memo7" align="center" >
			<div id="fid">
			<button type="button" class="btn btn-primary"  style="margin-top: 20%; width: 300px; height: 70px " id="fbtn">���� �߰�</button>
				<input type="file" style="display: none" id="file">
			</div>
			<div id="ffid">
				<img alt="" src="" id="fimg">
			</div>
			</td>
	</table>
	
	<div style="height: 150px"></div>





</div>















<script>
	$("#fbtn").click(function() {
		$("#file").trigger("click")
	})

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#fimg').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	

	

	$("#file").change(function() {
		readURL(this);
	});
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
					oncomplete : function(data) {
						// �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

						// ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
						// �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
						var fullRoadAddr = data.roadAddress; // ���θ� �ּ� ����
						var extraRoadAddr = ''; // ���θ� ������ �ּ� ����

						// ���������� ���� ��� �߰��Ѵ�. (�������� ����)
						// �������� ��� ������ ���ڰ� "��/��/��"�� ������.
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

						// ����ڰ� '���� ����'�� Ŭ���� ���, ���� �ּҶ�� ǥ�ø� ���ش�.
						if (data.autoRoadAddress) {
							//����Ǵ� ���θ� �ּҿ� ������ �ּҸ� �߰��Ѵ�.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(���� ���θ� �ּ� : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(���� ���� �ּ� : '
									+ expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}
</script>


