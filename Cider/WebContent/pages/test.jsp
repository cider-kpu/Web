<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8" />
<title>네이버 스마트 에디터 적용하기</title>
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
	// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	bUseToolbar : true,				
	// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	bUseVerticalResizer : true,		
	// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	bUseModeChanger : true,			
	fOnBeforeUnload : function(){
		
	}
}, 
fCreator: "createSEditor2"
});
function submitContents(elClickedObj) {
oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다. 
// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.

try {
elClickedObj.form.submit();
} catch(e) {}
}
</script>
<input type="submit" value="전송" onclick="submitContents(this)" />
</form>
</body>
</html>