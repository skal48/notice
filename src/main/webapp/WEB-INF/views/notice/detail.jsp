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
	})
  
  function fnModify() {
	$('#btn_modify').click(function() {
		$('#gubun').empty();
		$('#divTitle').empty();
		$('#divContent').empty();
		var gubun = '<label for="gubun">구분</label><select name="gubun" id="gubun"><option value="1" selected>일반</option><option value="2" >긴급</option></select>';
		$('#gubun').append(gubun);
		var modifyTitle = $('#title').text();
		var title = '<label for="title">제목</label><input type="text" id="title" name="title" value="${notice.title}">';
		$('#divTitle').append(title);
		var modifyContent = $('#content').text();
		var content = '<div><label for="content">내용</label></div><textarea rows="6" cols="22" id="content" name="content">${notice.content}</textarea>';
		$('#divContent').append(content);
		fnScondClick();
  })
}		   
  function fnScondClick() {
	
		 $('#btn_modify').on("click", function() {
			 $('#frm_detail').submit();
		      })
}
  
  function fnDelete() {
	  $('#btn_delete').click(function() {
		  $('#frm_detail').attr('action', '${contextPath}/notice/delete.do');
		  $('#frm_detail').submit();
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


<!--  나중에 이페이지에서 그재로 수정해야함  펑션안에 div 등이 들어가야함-->

  <div>
    <h1>${notice.noticeNo}번 공지사항</h1>
  </div>
  <hr>
  <form method="post" id="frm_detail" action="${contextPath}/notice/modify.do">
  <div id="gubun">구분: 
  <c:choose>
    <c:when test="${notice.gubun=='1'}">
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