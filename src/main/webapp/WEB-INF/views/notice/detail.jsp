<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>

  $(function() {
		fnModify();
		fnDelete();
		fnGoList();	
		modifyAlert();
	})
  
  function fnModify() {
	$('#btn_modify').click(function() {
		$('#gubun').empty();
		$('#divTitle').empty();
		$('#divContent').empty();
		var gubun = '<span>구분</span> <select name="gubun" id="gubun"><option value="2" selected>일반</option><option value="1" >긴급</option></select>';
		$('#gubun').append(gubun);
		var modifyTitle = $('#title').text();
		var title = '<span>제목</span><input type="text" id="title" name="title" value="${notice.title}">';
		$('#divTitle').append(title);
		var modifyContent = $('#content').text();
		var content = '<div><span>내용</span></div><textarea rows="6" cols="22" id="content" name="content">${notice.content}</textarea>';
		$('#divContent').append(content);
		fnSecondClick();
  })
}		   
  
  function fnSecondClick() {
	
		 $('#btn_modify').on("click", function() {
			 $('#frm_detail').submit();				 
		 })
		}
		 
  function modifyAlert() {
		 var modifyResult = '${modifyResult}';
		 if(modifyResult != ''){
		   if(modifyResult == '1'){
		        alert('공지사항이 수정되었습니다.');
		      } else {
		        alert('공지사항이 수정되지 않았습니다.');
		      }	  
		 }		 
	   }
				  
  function fnDelete() {
	  $('#btn_delete').click(function() {
		 
		  if(confirm('공지사항을 삭제할까요?')){
			  $('#frm_detail').attr('action', '${contextPath}/notice/delete.do');
			  $('#frm_detail').submit();
		  }
	      })
}
  function fnGoList() {
	   $('#btn_list').click(function() {
	    location.href = '${contextPath}/notice/list.do';
	  })
	  }
</script>
</head>
<body>


<!--  나중에 이페이지에서 그대로 수정해야함  펑션안에 div 등이 들어가야함-->
  <div>
    <h1>${notice.noticeNo}번 공지사항</h1>
  </div>
  <hr>
  <form method="post" id="frm_detail" action="${contextPath}/notice/modify.do">
  <div id="gubun">구분: 
  <c:choose>
    <c:when test="${notice.gubun=='2'}">
    일반
    </c:when>
    <c:otherwise>
    긴급
    </c:otherwise>
  </c:choose>
    
   </div>
  <div id="divTitle">제목: ${notice.title} </div>
  <div id="divContent">내용: ${notice.content} </div>
  <hr>
  <div>
    <input type="hidden" name="noticeNo" value="${notice.noticeNo}"/>
	  <button type="button" id="btn_modify">수정</button>
	  <button type="button" id="btn_delete">삭제</button>
	  <button type="button" id="btn_list">목록</button>  
  </div>
  </form>

</body>
</html>