<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CommunityNoticeBoardForm</title>
<link href="/style/communityNoticeBoardFormStyle.css" rel="stylesheet">
<script src="/js/communityNoticeBoardFormScript.js"></script>


<script>

$(document).ready(function() { 		
		$(".rowCntPerPage").val("10");
   search();
   
});


function goNadminNticeboardDetailForm(b_no) {
	
	
	//----------------------------------
	// name='boardDetailForm' 을 간 form 태그 후손중에 
	// name='b_no' 가진 태그에 매개변수로 들어온 게시판의 고유번호를 
	// 삽입하기
	//----------------------------------
	
	//location.replace("/boardDetailForm.do?b_no=" + b_no);
	
	$("[name='adminNoticeboardDetailForm'] [name='b_no']").val(b_no); 
	
	//----------------------------------
	// name='boardDetailForm' 을 가진 
	// form 태그의 action 에 설정된 URL 주소로 WAS 접속해서 
	// 얻은 새 HTML 를 웹브라우저 열기.
	// 즉 화면 이동하기.
	//----------------------------------
	
	document.adminNoticeboardDetailForm.submit();
		
	
	//alert($("[name='boardDetailForm'] [name='b_no']").val());
		
}





function search(){
	
	
	//---------------------------------------------
	// 변수 boardSearchFormObj 선언하고 
	// name='boardSearchForm' 를 가진 form 태그 관리 JQuery 객체를 생성하고 저장하기
	//---------------------------------------------
    var boardSearchFormObj = $("[name='adminNoticeBoardSearchForm']");


  
    
    boardSearchFormObj.find(".rowCntPerPage").val($("select").filter(".rowCntPerPage").val() )
    

    

    $.ajax({
    	//-------------------------------
		// WAS 로 접속할 주소 설정
		//-------------------------------
		url      : "/adminNoticeBoardForm.do"
		//-------------------------------
		// WAS 로 접속하는 방법 설정. get 또는 post
		//-------------------------------
		,type    : "post"
		
		,data    : boardSearchFormObj.serialize( )
		
	
        
        ,success : function(responseHtml) {
        	

            var obj = $(responseHtml);
  
            $(".communityNoticeBoardFormContainer").html(obj.filter(".communityNoticeBoardFormContainer").html());
			
            $(".pagingNos").html(obj.find(".pagingNos").html());

            
            
            
        }

       , error : function() {
        	
            alert("검색 실패! 관리자에게 문의 바랍니다.");
        } 
       
    });
		
}



function searchWithSort(sort) {
    // sort 값을 form의 sort 필드에 설정합니다.
    $("[name='adminNoticeBoardSearchForm']").find("[name='sort']").val(sort);
    // 폼을 서브밋하여 결과를 업데이트합니다.
    search();
}









function searchAll() {

	//---------------------------------------------
	// 변수 boardSearchFormObj 선언하고 
	// name='boardSearchForm' 를 가진 form 태그 관리 JQuery 객체를 생성하고 저장하기
	//---------------------------------------------
	var boardSearchFormObj = $("[name='adminNoticeBoardSearchForm']");

	
	boardSearchFormObj.find(".selectPageNo").val("1")


	search();
    
}



//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
// [페이지 번호]를 클릭하면 호출되는 함수 pageNoClick 선언하기 
// 쪼개서 보여주기.
//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
function pageNoClick( clickPageNo ){
	//alert(clickPageNo);
	//---------------------------------------------
	// name='selectPageNo' 를 가진 태그의 value 값에 
	// 매개변수로 들어오는 [클릭한 페이지 번호]를 저장하기
	// 즉 <input type="hidden" name="selectPageNo" value="1"> 태그에
	// value 값에 [클릭한 페이지 번호]를 저장하기
	//---------------------------------------------
	$("[name='adminNoticeBoardSearchForm']").find(".selectPageNo").val(clickPageNo)
	
	
	search()
	
}







</script>








</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="communityNoticeBoardFormTitle">
		<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
		<p class="titleBackgoundText">공지사항</p>
	</div>


	<form name="adminNoticeBoardSearchForm" onsubmit="return false">
		<input type="hidden" name="sort" class="sort"> <input
			type="hidden" name="SelectPageNo" class="SelectPageNo" value="1">
		<input type="hidden" name="rowCntPerPage" class="rowCntPerPage">
	</form>


	<div class="row admin_side_nav">
		<ul class="nav nav-pills flex-column">
			<li class="nav-item">관리자 메뉴</li>
			<li class="nav-item"><a class="nav-link" href="adminForm.do">회원
					관리</a></li>
			<li class="nav-item"><a class="nav-link"
				href="adminNoticeBoardForm.do">공지사항 </a></li>
		</ul>
	</div>

	<table>
		<tr align="center">
			<td><input type="button" value="새글쓰기"
				onclick="location.replace('/adminNoticeboardRegForm.do');"></td>
		</tr>
	</table>



	<div class="communityNoticeBoardFormContainer">

		<div class="noticeboardListDiv" style="margin-bottom: 20px;">
			<table class="noticeboardListTable" cellpadding="7" border="1"
				bordercolor="gray" align="center" style="border-collapse: collapse">
				<tr>
					<th style="width: 50px;">번호</th>
					<th style="width: 300px;">제목</th>
					<th style="width: 80px;">글쓴이</th>
					<c:if
						test="${param.sort!='readcount asc' and param.sort!='readcount desc' }">
						<th width="80px" style="cursor: pointer"
							onclick="searchWithSort('readcount desc')">조회수</th>
					</c:if>
					<!--                      만약 파명 "sort" 의 파값이 'readcount desc' 면 -->
					<!--                      즉 정렬 의지가 'readcount desc' 면 -->
					<c:if test="${param.sort=='readcount desc'}">
						<th width="80px" style="cursor: pointer"
							onclick="searchWithSort('readcount asc')">조회수▼</th>
					</c:if>
					<!--                      만약 파명 "sort" 의 팍밧이 'readcount asc' 면 -->
					<!--                      즉 정렬 의지가 'readcount asc' 면 -->
					<c:if test="${ param.sort=='readcount asc' }">
						<th width="80px" style="cursor: pointer"
							onclick="searchWithSort('')">조회수▲</th>
					</c:if>

					<c:if
						test="${param.sort!='reg_date asc' and param.sort!='reg_date desc' }">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('reg_date desc')">등록일</th>
					</c:if>

					<c:if test="${param.sort=='reg_date desc'}">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('reg_date asc')">등록일▼</th>
					</c:if>

					<c:if test="${param.sort=='reg_date asc' }">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('')">등록일▲</th>
					</c:if>

				</tr>

				<c:forEach var="noticeboard" items="${requestScope.noticeBoardList}"
					varStatus="status">

					<tr style="cursor: pointer"
						onClick="goNadminNticeboardDetailForm(${noticeboard.b_no});">

						<td align="center">${requestScope.noticeBoardMap.begin_serialNo_desc - status.index}</td>
						<td>${noticeboard.subject}</td>
						<td align="center">${noticeboard.writer}</td>
						<td align="center">${noticeboard.readcount}</td>
						<td align="center">${noticeboard.reg_date}</td>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${empty noticeBoardList}">
				<br>
				<center>조건에 맞는 검색 결과가 없습니다.</center>
			</c:if>
		</div>
	</div>




	<center>

		<span class="pagingNos"> <span style="cursor: pointer"
			onClick="pageNoClick(1)">[처음]</span> <span style="cursor: pointer"
			onClick="pageNoClick(${requestScope.noticeBoardMap.selectPageNo}-1)">[이전]</span>&nbsp;&nbsp;


			<c:forEach var="pageNo"
				begin="${requestScope.noticeBoardMap.begin_pageNo}"
				end="${requestScope.noticeBoardMap.end_pageNo}">

				<c:if test="${requestScope.noticeBoardMap.selectPageNo==pageNo}">
            ${pageNo}
         </c:if>

				<c:if test="${requestScope.noticeBoardMap.selectPageNo!=pageNo}">
					<span style="cursor: pointer" onClick="pageNoClick(${pageNo})">[${pageNo}]</span>
				</c:if>
			</c:forEach>&nbsp;&nbsp; <span style="cursor: pointer"
			onClick="pageNoClick(${requestScope.noticeBoardMap.selectPageNo}+1)">[다음]</span>
			<span style="cursor: pointer"
			onClick="pageNoClick(${requestScope.noticeBoardMap.last_pageNo})">[마지막]</span>
			&nbsp;&nbsp;&nbsp;
			[${requestScope.noticeBoardListCnt}/${requestScope.noticeBoardListAllCnt}]개
			&nbsp;&nbsp;
		</span> <select name="rowCntPerPage" class="rowCntPerPage"
			onChange="search()">
			<option value="10">10
			<option value="15">15
			<option value="20">20
		</select>행보기 &nbsp;&nbsp;&nbsp;
	</center>



	<!-- 이 form 태그를 /boardDetailForm.do로 WAS로 접속하기 위해 선언한다. -->
	<form name="adminNoticeboardDetailForm"
		action="/adminNoticeboardDetailForm.do" method="post">
		<!-- 클릭한 행의 게시판 고유번호가 저장될 히든태그 선언 -->
		<input type="hidden" name="b_no">
	</form>










</body>
</html>