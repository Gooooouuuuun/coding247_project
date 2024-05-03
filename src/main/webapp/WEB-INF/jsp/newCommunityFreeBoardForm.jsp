<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NewCommunityFreeBoardForm</title>
<link href="/style/newCommunityFreeBoardFormStyle.css" rel="stylesheet">
<script src="/js/newCommunityFreeBoardFormScript.js"></script>
<script>
	function checkCommunityFreeBoardForm() {

		var formObj = $("[name='newCommunityFreeBoardForm']");
		var serialize = formObj.serialize();

		$.ajax({
				url : "/communityFreeBoardRegProc.do"
			,	type : "post"
			,	data : serialize
			,	success : function(json) {				
					var result = json["result"];					
					if (result == 1) {
						alert("글 등록 성공 입니다.");
						location.replace("/communityFreeBoardForm.do")
					} 
					else {
						alert("글 등록 실패입니다!");
					}
				}
			,	error : function() {				
					alert("자유게시판 글 등록 실패! 관리자에게 문의 바랍니다.");
				}
		});

	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="newCommunityFreeBoardFormTitle">
		<img src="/image/CommunityTitleBackgroundImage.jpg"
			class="titleBackgoundImg">
		<p class="titleBackgoundText">자유게시판 등록</p>
	</div>
	<div class="newCommunityFreeBoardFormContainer">
		<form name="newCommunityFreeBoardForm">
			<table class="newCommunityFreeBoardFormRegTable" border="1"
				bordercolor="black">
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject" class="subject"
						size="40" maxlength="30"></td>
				</tr>
				<tr>
					<th>글쓴이</th>
					<td><input type="text" name="writer" class="writer" size="40"
						maxlength="15"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="content" class="content" rows="20"
							cols="40" maxlength="500" style="resize: none"></textarea></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pwd" class="pwd" size="40"
						maxlength="4"></td>
				</tr>
			</table>
			<div class="newCommunityFreeBoardFormBtnDiv">
				<div class="resetBtnDiv">
					<input type="reset" class="boardResetBtn" value="다시 작성">
				</div>
				<div class="boardRegAndMoveList">
					<input type="button" class="boardRegBtn" value="저장"
						onClick="checkCommunityFreeBoardForm();"> <input
						type="button" class="moveListBtn" value="목록"
						onClick="location.replace('/communityFreeBoardForm.do')">
				</div>
			</div>
		</form>
	</div>
</body>
</html>