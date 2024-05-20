<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminDetailUpDelForm</title>
<link href="/style/community/communityFreeBoardFormStyle.css" rel="stylesheet">

<script src="/js/community/communityFreeBoardFormScript.js"></script>




<script>
	function checkAdminMemberUpForm() {

		var formObj = $("[name='adminDetailUpDelForm']");
		var nameObj = formObj.find(".name");
		var midObj = formObj.find(".mid");
		var nicknameObj = formObj.find(".nickname");
		var emailObj = formObj.find(".email");
		var birthdayObj = formObj.find(".birthday");
		var phoneObj = formObj.find(".phone");
		var detail_addressObj = formObj.find(".detail_address");

		//alert(formObj.serialize());

		if (confirm("정말수정하시겠습니까?") == false) {
			return;
		}

		$.ajax({
			url : "/adminMemberUpProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("삭제된 회원입니다.");
					location.href = "/adminForm.do";
				} else {
					alert("회원정보 수정 성공입니다.");
					location.href = "/adminForm.do";
				}
			},
			error : function() {
				alert("수정 실패! 관리자에게 문의 바랍니다.");
			}
		});
	}

	function checkAdiminDelForm() {
		var formObj = $("[name='adminDetailUpDelForm']");
		if (confirm("정말 삭제하시겠습니까?") == false) {
			return;
		}
		$.ajax({
			url : "/adminMemberDelProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("삭제된 회원입니다.");
					location.href = "/adminForm.do";
				} else {
					alert("공지사항 삭제 성공입니다.");
					location.href = "/adminForm.do";
				}
			},
			error : function() {
				alert("삭제 실패! 관리자에게 문의 바랍니다.");
			}
		});
	}
</script>

</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="communityNoticeBoardFormTitle">
		<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
		<p class="titleBackgoundText">회원정보수정</p>
	</div>

	<%@ include file="/WEB-INF/jsp/admin/admin_side_nav.jsp"%>

	<form name="adminDetailUpDelForm">
		<table align="center" bordercolor="gray" border=1 cellpadding=7
			style="border-collpase: collpase">
			<caption>[회원정보 수정/삭제]</caption>
			<tr>
				<th bgColor="lightgray">이 름</th>
				<td><input type="text" name="name" class="name" size="10"
					maxlength="15" value="${requestScope.memberDTO.name}"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">아이디</th>
				<td><input type="text" name="mid" class="mid" size="40"
					maxlength="30" value="${requestScope.memberDTO.mid}"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">닉네임</th>
				<td><input type="text" name="nickname" class="nickname"
					size="40" maxlength="30" value="${requestScope.memberDTO.nickname}"></td>
			</tr>

			<tr>
				<th bgColor="lightgray">이메일</th>
				<td><input type="text" name="email" class="email" size="40"
					maxlength="30" value="${requestScope.memberDTO.email}"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">생일</th>
				<td><input type="text" name="birthday" class="birthday"
					size="40" maxlength="30" value="${requestScope.memberDTO.birthday}"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">전화번호</th>
				<td><input type="text" name="phone" class="phone" size="40"
					maxlength="30" value="${requestScope.memberDTO.phone}"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">성별</th>
				<td><input type="radio" name="gender" value="남"
					<c:if test="${requestScope.memberDTO.gender.contains ('남')}">checked</c:if>>남
					<input type="radio" name="gender" value="여"
					<c:if test="${requestScope.memberDTO.gender.contains ('여')}">checked</c:if>>여</td>
			</tr>
			

			<tr>
					<th>시/도</th>
					<td colspan="5" >${requestScope.memberDTO.sido}-${requestScope.memberDTO.sigungu}->(수정)
			            <select name="sido_id" id="" onchange="categoryChange(this)">
			              <option value="0">시/도 선택</option>
			              <option value="1">강원</option>
			              <option value="2">경기</option>
			              <option value="3">경남</option>
			              <option value="4">경북</option>
			              <option value="5">광주</option>
			              <option value="6">대구</option>
			              <option value="7">대전</option>
			              <option value="8">부산</option>
			              <option value="9">서울</option>
			              <option value="10">울산</option>
			              <option value="11">인천</option>
			              <option value="12">전남</option>
			              <option value="13">전북</option>
			              <option value="14">제주</option>
			              <option value="15">충남</option>
			              <option value="16">충북</option>
			            </select>
			            <select name="sigungu_id" id="state">
			              <option value ="0">군/구 선택</option>
			            </select>
					</td>
				</tr>
			<tr>
				<th bgColor="lightgray">상세주소</th>
				<td><input type="text" name="detail_address"
					class="detail_address" size="40" maxlength="30"
					value="${requestScope.memberDTO.detail_address}"></td>
			</tr>
			<tr>
				<th>가입일</th>
				<td>${requestScope.memberDTO.reg_date}</td>
			</tr>

		</table>




		<table align="center" bordercolor="gray" border=1 cellpadding=7
			style="border-collpase: collpase">
			<caption>[기록 수정/삭제]</caption>
			<tr>
				<th bgColor="lightgray">이 름</th>
				<td><input type="text" name="name" class="name" size="10"
					maxlength="15" value="${requestScope.memberDTO.name}" disabled>
				</td>
			</tr>

			<tr>
				<th bgColor="lightgray">경기수</th>
				<td><input type="text" name="games_played" class="games_played"
					size="40" maxlength="30"
					value="${requestScope.playerRecordDTO.games_played}"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">승리수</th>
				<td><input type="text" name="wins" class="wins" size="40"
					maxlength="30" value="${requestScope.playerRecordDTO.wins}"></td>
			</tr>

			<tr>
				<th bgColor="lightgray">무승부</th>
				<td><input type="text" name="draws" class="draws" size="40"
					maxlength="30" value="${requestScope.playerRecordDTO.draws}"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">패배수</th>
				<td><input type="text" name="losses" class="losses" size="40"
					maxlength="30" value="${requestScope.playerRecordDTO.losses}"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">골</th>
				<td><input type="text" name="goals_for" class="goals_for"
					size="40" maxlength="30"
					value="${requestScope.playerRecordDTO.goals_for}"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">어시스트</th>
				<td><input type="text" name="goals_assist" class="goals_assist"
					size="40" maxlength="30"
					value="${requestScope.playerRecordDTO.goals_assist}"></td>
			</tr>



		</table>









		<input type="hidden" name="m_no"
			value="${requestScope.memberDTO.m_no}"> <input type="hidden"
			name="player" value="${requestScope.playerRecordDTO.player}">
	</form>


	<div style="height: 5px"></div>
	<center>
		<span style="cursor: pointer"
			onclick="location.replace('/adminForm.do')">[목록 화면으로]</span>
	</center>
	<center>
		<input type="button" value="수정" onclick="checkAdminMemberUpForm();">
		<input type="button" value="삭제" onclick="checkAdiminDelForm();">
	</center>


</body>
</html>