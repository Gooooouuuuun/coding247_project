<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link href="/style/headerStyle.css" rel="stylesheet">
<script src="/js/headerScript.js"></script>
</head>
<body>
	<header class="header">
        <div class="headerTitle">
            <a href="/mainForm.do">
                <img src="#" class="headerLogo">
            </a>
        </div>
        <div class="headerMenu">
            <nav class="headerNav">
                <ul class="headerNavList">
                    <li><a href="/mainForm.do">홈</a></li>
                    <li class="nav-item"><a href="/matchingForm.do">매칭 찾기</a>
                    </li>
                    <li class="nav-item"><a href="/recruitTeamBoardForm.do">모집</a> <!-- 하위 카테고리 -->
                        <ul class="navInner">
	                        <li class="navInner-item"><a href="/recruitTeamBoardForm.do">팀/팀원</a></li>
	                        <li class="navInner-item"><a href="/recruitHiredBoardForm.do">용병</a></li>
	                        <li class="navInner-item"><a href="/recruitLessonBoardForm.do">레슨</a></li>
                    	</ul>
                    </li>
                    <li class="nav-item"><a href="/stadiumRentForm.do">경기장</a> <!-- 하위 카테고리 -->
                        <ul class="navInner">
	                        <li class="navInner-item"><a href="/stadiumRentForm.do">대관</a></li>
	                        <li class="navInner-item"><a href="/stadiumTransferForm.do">양도</a></li>
                    	</ul>
                    </li>
                    <li class="nav-item"><a href="/communityNoticeBoardForm.do">커뮤니티</a> <!-- 하위 카테고리 -->
                        <ul class="navInner">
	                        <li class="navInner-item"><a href="/communityNoticeBoardForm.do">공지사항</a></li>
	                        <li class="navInner-item"><a href="/communityFreeBoardForm.do">자유게시판</a></li>
	                        <li class="navInner-item"><a href="/communityGallaryForm.do">갤러리</a></li>
	                        <li class="navInner-item"><a href="/communityMarketplaceBoardForm.do">장터</a></li>
                    	</ul>
                    </li>
                    <li class="nav-item"><a href="/tournamentBoardForm.do">대회</a> <!-- 하위 카테고리 -->
                        <ul class="navInner">
                        	<li class="navInner-item"><a href="/tournamentBoardForm.do">대회일정</a></li>
                    	</ul>
                    </li>
                    <li class="nav-item"><a href="/recordsRankingForm.do">기록실</a> <!-- 하위 카테고리 -->
                        <ul class="navInner">
	                        <li class="navInner-item"><a href="/recordsRankingForm.do">랭킹</a></li>
	                        <li class="navInner-item"><a href="/recordsStatisticsForm.do">통계</a></li>
                    	</ul>
                    </li>
                    <li class="nav-item"><a href="/customerServiceForm.do">고객센터</a>
                    </li>
                    <li class="auth-links"><a href="/loginForm.do">로그인</a> | <a href="/memberRegForm.do">회원가입</a></li>
                </ul>
            </nav>
        </div>
        <div class="hd_bg"></div>
    </header>
</body>
</html>