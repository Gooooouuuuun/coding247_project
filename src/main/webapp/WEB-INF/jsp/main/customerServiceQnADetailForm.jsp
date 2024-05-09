<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CustomerServiceQnADetailForm</title>
<link href="/style/main/customerServiceQnADetailFormStyle.css" rel="stylesheet">
<script src="/js/main/customerServiceQnADetailFormScript.js"></script>
<script>

// QnA 댓글 보이기 - user

	function submitDetailFormComment(b_no){
		if(b_no == ''){
			location.href="/main/newCustomerServiceQnAForm.do";
		} else {
			$("[name='newCustomerServiceQnACommentForm'] .b_no").val(b_no);
	        document.newCustomerServiceQnAForm.action = "/main/newCustomerServiceQnAForm.do";
	        document.newCustomerServiceQnAForm.submit();
		}
	}
	
	
// QnA 댓글 등록 - admin

	function checkQnACommentRegForm(){
		var formObj = $("[name='customerServiceQnADetailFormCommentInsertForm']");
		
		$.ajax({
			
			url:"/QnACommentRegProc.do",
			
			type:"post",
			
			data:formObj.serialize(),
			
			success:function(json){
				var result = json["result"];
				
				if(result == 1){
					alert("작성 성공");
					window.location.reload();
				} else {
					alert("작성 실패")
				}
			},
			
			error:function(){alert("작성 실패(에러)")}
		})
	}
	
// QnA 수정

	function customerServiceQnAUpdate(b_no){
		$("[name='customerServiceQnAUpdateForm'] .b_no").val(b_no);
		document.customerServiceQnAUpdateForm.action="/main/customerServiceQnAUpdateForm.do";
		document.customerServiceQnAUpdateForm.submit();
	}
	
	
// QnA 삭제
	
	function customerServiceQnADelete(b_no) {
	    var sessionPwd = "<%= session.getAttribute("password") %>";
	    var pwdInsert = prompt("계정 비밀번호를 입력해주세요.");

	    if (pwdInsert == null) { 
	        return;
	    }

        if (sessionPwd != pwdInsert) {
            alert("계정 비밀번호를 정확히 입력해주세요.");
            
            customerServiceQnADelete(b_no);
            
        } else {
            if(confirm("삭제하시겠습니까?") == true){
            	
                $.ajax({
                	
                    url: "/customerServiceQnADeleteProc.do",
                    
                    method: "POST",
                    
                    data: {b_no: b_no},
                    
                    success: function(json) {
                    	var result = json["result"];
                    	
                    	if(result > 0){
                    		alert("삭제 성공");
                            location.href="/main/customerServiceForm.do";
                    	}
                    },
                    
                    error: function() {alert("삭제에 실패했습니다.(에러)");}
                });
            }
        }
	}
	
// QnA Comment 수정
/* 
	function customerServiceCommentUpdateBtn(button) {
	
		var c_no = parseInt($(button).data('c_no'));

	    var b_no = parseInt($(button).data('b_no'));
	    
	    alert(c_no);
	    alert(b_no);
	    
	    $.ajax({
	    	
	        url: "/main/customerServiceQnADetailForm.do",
	        
	        method: "POST",
	        
	        data: {c_no: c_no, b_no: b_no},
	        
	        success: function(responseHtml) {
	        	
	            var obj = $(responseHtml);
	            
	            
		            $(".customerServiceQnADetailCommentContent").html(
		            		
		                '<textarea class="customerServiceQnADetailCommentContent" rows="5" cols="50" style="resize:none;"></textarea><br><button onclick="customerServiceCommentUpdate()">저장</button>'
		            	 
		            );
		            

	            	$(".adminUpDelBtnDiv").remove();
	        },
	        
	        error: function() {
	            alert("수정할 수 없습니다.(에러)");
	        }
	    });
	}

 */
	function customerServiceCommentUpdate(c_no){
		
		var formObj = $("[name='customerServiceQnADetailFormCommentUpdateForm']");
		
		 var contentObj = formObj.find('textarea[name="content"][data-c_no="' + c_no + '"]');
		
		if (contentObj.val().trim().length==0||contentObj.val().trim().length>1000){
			alert("내용은 1~1000자 입력해야 합니다.");
			contentObj.val("");
			return;
		}
		
		alert(c_no);
		alert(contentObj.val());
		
		$.ajax({
			
			url:"/customerServiceQnACommentUpdateProc.do",
				
			type:"post",
				
			data:{c_no: c_no, content: contentObj.val()},
				
			success:function(json){
				
				var result = json["result"];
				
				if(result > 0){
					
            		alert("수정 성공");
					
            		window.location.reload();
				}
            		
			},
			
			error:function(){"수정 실패(에러)"}
		})
	}
	
// QnA Comment 삭제
	
	function customerServiceCommentDelete(c_no){
		if(confirm("삭제하시겠습니까?") == true){
        	
            $.ajax({
            	
                url: "/customerServiceCommentDeleteProc.do",
                
                method: "POST",
                
                data: {c_no: c_no},
                
                success: function(json) {
                	var result = json["result"];
                	
                	if(result > 0){
                		
                		alert("삭제 성공");
                		window.location.reload();
                		
                	} else {alert("c_no 없음");}
                },
                
                error: function() {alert("삭제에 실패했습니다.(에러)");}
            });
        }
	}
</script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <form name="newCustomerServiceQnACommentForm" action="/main/newCustomerServiceQnAForm.do" method="POST">
        <c:if test="${not empty requestScope.customerServiceDetailDTO.b_no}">
            <input type="hidden" class="b_no" name="b_no" value="${requestScope.customerServiceDetailDTO.b_no}">
        </c:if>
    </form>
    <form name="customerServiceQnAUpdateForm" action="/customerServiceQnAUpdateForm.do" method="POST">
    	<input type="hidden" class="b_no" name="b_no" value="${requestScope.customerServiceDetailDTO.b_no}">
    </form>
    <div class="customerServiceQnADetailFormTitle">
        <img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
        <p class="titleBackgoundText">QnA</p>
    </div>
    <div class="moveListBtnDiv">
        <input type="button" class="moveListBtn" value="목록" onClick="location.href = '/main/customerServiceForm.do'">
    </div>
    <div class="customerServiceQnADetailFormContainer">
        <table class="customerServiceQnADetailFormRegTable" border="1" bordercolor="black" style="width:600px;">
            <tr>
                <th>제목</th>
                <td>
                    ${requestScope.customerServiceDetailDTO.subject}
                </td>
            </tr>
            <tr>
                <th>글쓴이</th>
                <td>
                    ${requestScope.customerServiceDetailDTO.writer}
                </td>
            </tr>
            <tr>
                <th>내용</th>
                <td>
                    <textarea name="content" class="content" rows="20" cols="40" maxlength="500" style="resize:none; border:0; width:450px;" readonly>
                        ${requestScope.customerServiceDetailDTO.content}
                    </textarea>
                </td>
            </tr>
        </table>
        <c:if test="${sessionScope.mid != 'admin'}">
	        <div class="upDelBoardBtnDiv">
		        <input type="button" class="updateBoardBtn" value="수정" onClick="customerServiceQnAUpdate(${requestScope.customerServiceDetailDTO.b_no});">
		        <c:if test="${not empty requestScope.customerServiceDetailDTO.b_no}">
   					<button class="deleteBoardBtn" onclick="customerServiceQnADelete(${requestScope.customerServiceDetailDTO.b_no})">삭제</button>
				</c:if>
		    </div>
		</c:if>
        <div class="customerServiceQnADetailFormCommentInsertDiv">
        	<c:if test="${!empty requestScope.customerServiceQnADetailComment}">
        		<form name="customerServiceQnADetailFormCommentUpdateForm">
		            <div class="customerServiceQnADetailFormComment">
		            	<input type="hidden" name="b_no" value="${requestScope.customerServiceDetailDTO.b_no}">
		                <table class="customerServiceQnADetailFormCommentTable" border="1" bordercolor="black">
		                	<c:forEach var="customerServiceQnADetailComment" items="${requestScope.customerServiceQnADetailComment}" varStatus="status">
		            			<input type="hidden" name="c_no" value="${customerServiceQnADetailComment.c_no}">
			                    <tr>
			                        <th>글쓴이</th>
			                        <td>${customerServiceQnADetailComment.writer}</td>
			                        <th>작성일</th>
			                        <td>${customerServiceQnADetailComment.reg_date}</td>
			                    </tr>
			                    <tr>
			                        <th>제목</th>
			                        <td colspan="3" class="customerServiceQnADetailCommentSubject" style="width:490px;">${customerServiceQnADetailComment.subject}</td>
			                    </tr>
			                    <tr>
			                    	<c:if test="${sessionScope.mid == 'admin'}">
			                    		<th>내용</th>
				                        <td colspan="3" class="customerServiceQnADetailCommentContent" style="width:490px; height:100px;">
				                        	<textarea name="content" class="content${customerServiceQnADetailComment.c_no}" rows="10" cols="40" maxlength="1000" style="resize:none; border: 0;" data-c_no="${customerServiceQnADetailComment.c_no}">${customerServiceQnADetailComment.content}</textarea>
				                        </td>
			                    	</c:if>
			                    	<c:if test="${sessionScope.mid != 'admin'}">
				                        <th>내용</th>
				                        <td colspan="3" class="customerServiceQnADetailCommentContent" style="width:490px; height:100px;">
				                        	${customerServiceQnADetailComment.content}
				                        </td>
				                	</c:if>
			                    </tr>
			                    <tr>
			                    	<td colspan="4" style="text-align: right;">
					                    <c:if test="${sessionScope.mid == 'admin'}">
						                	<div class="adminUpDelBtnDiv">
						                		<button type="button" class="adminUpdateBtn" onclick="customerServiceCommentUpdate(${customerServiceQnADetailComment.c_no})">수정</button>
						                		<button class="adminDeleteBtn" onclick="customerServiceCommentDelete(${customerServiceQnADetailComment.c_no})">삭제</button>
						                	</div>
						                </c:if>
						        	</td>
					        	</tr>
			             	</c:forEach>
		                </table>
		            </div>
		   		</form>
	        </c:if>
            <c:if test="${sessionScope.mid == 'admin'}">
            	<form name="customerServiceQnADetailFormCommentInsertForm">
            		<input type="hidden" name="b_no" value="${requestScope.customerServiceDetailDTO.b_no}">
       				<input type="hidden" name="bc_no" value="${requestScope.customerServiceDetailDTO.b_no}">
	                <table border="1" bordercolor="black">
	                    <tr>
	                        <th>글쓴이</th>
	                        <td>${sessionScope.nickname}</td>
	                        <th>작성일</th>
	                        <td><c:set var="currentDate" value="<%= new java.text.SimpleDateFormat(\"yyyy-MM-dd\").format(new java.util.Date()) %>" />${currentDate}</td>
	                    </tr>
	                    <tr>
	                        <th>답변 입력</th>
	                        <td colspan="3">
								<textarea name="content" class="content" rows="20" cols="42" maxlength="1000" style="resize:none; width: 470px; height: 100px;"></textarea>
								<input type="button" class="commentRegBtn" value="저장" onClick="checkQnACommentRegForm();">
	                    	</td>
	                    </tr>
	                </table>
	        	</form>
            </c:if>
        </div>
    </div>
</body>
</html>
