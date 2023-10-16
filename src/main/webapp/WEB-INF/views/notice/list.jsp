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
	  fnAddResult();
	  fnDeleteResult();
	  })
  
  function fnAddResult(){
  var addResult = '${addResult}';
  if(addResult !== ''){
    if(addResult === '1'){
      alert('공지사항이 등록되었습니다.');
    } else {
    alert('공지사항 등록이 실패했습니다.');
    }
  }
  }
  function fnDeleteResult(){
	    var deleteResult = '${deleteResult}';
	    if(deleteResult !== ''){
	      if(deleteResult === '1'){
	        alert('공지사항이 삭제되었습니다.');
	      } else {
	      alert('공지사항 삭제가 실패했습니다.');
	      }
	    }
	  }

  
</script>
</head>
<body>

  <div>
    <h1>공지사항</h1>
    <img src="${contextPath}/resources/image/animal10.jpg" width="198px">    
  </div>
  <hr>
  <div>
    <table border="1">
      <thead>
        <tr>
          <td>번호</td>
          <td>제목</td>
        </tr>  
      </thead>
      <tbody>
        <c:forEach items="${noticeList}" var="n">
          <tr>
            <td>${n.noticeNo}</td>
            <td><a href="${contextPath}/notice/detail.do?noticeNo=${n.noticeNo}">${n.title}</a></td>
          </tr>  
        </c:forEach>
      </tbody>    
    </table>
  </div>
  <hr>
  <a href="${contextPath}/notice/write.do">공지사항 작성하기</a>
  

</body>
</html>