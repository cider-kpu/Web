<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8" />
<title>���̹� ����Ʈ ������ �����ϱ�</title>
<script type="text/javascript" src="./nse_files/js/HuskyEZCreator.js" charset="utf-8"></script>
<style>
.nse_content{width:660px;height:500px}
</style>
</head>
<body>
<form name="nse" action="add_db_nse.php" method="post">
<textarea name="ir1" id="ir1" class="nse_content" >null</textarea>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
oAppRef: oEditors,
elPlaceHolder: "ir1",
sSkinURI: "../editor/SmartEditor2Skin.html",
htParams : {
	// ���� ��� ���� (true:���/ false:������� ����)
	bUseToolbar : true,				
	// �Է�â ũ�� ������ ��� ���� (true:���/ false:������� ����)
	bUseVerticalResizer : true,		
	// ��� ��(Editor | HTML | TEXT) ��� ���� (true:���/ false:������� ����)
	bUseModeChanger : true,			
	fOnBeforeUnload : function(){
		
	}
}, 
fCreator: "createSEditor2"
});
function submitContents(elClickedObj) {
oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);	// �������� ������ textarea�� ����˴ϴ�. 
// �������� ���뿡 ���� �� ������ �̰����� document.getElementById("ir1").value�� �̿��ؼ� ó���ϸ� �˴ϴ�.

try {
elClickedObj.form.submit();
} catch(e) {}
}
</script>
<input type="submit" value="����" onclick="submitContents(this)" />
</form>
</body>
</html>