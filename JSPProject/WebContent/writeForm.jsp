<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String name = (String) request.getAttribute("name");
	
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>자유게시판</title>
</head>
<script type="text/javascript">
	function checkForm() {
		if (!document.newWrite.name.value) {
			alert("성명을 입력하세요.");
			return false;
		}
		if (!document.newWrite.subject.value) {
			alert("제목을 입력하세요.");
			return false;
		}
		if (!document.newWrite.content.value) {
			alert("내용을 입력하세요.");
			return false;
		}		
	}
</script>
<body>
	<jsp:include page="top.jsp" />

	<section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>자유게시판 - 글쓰기</h2>
         
        </div>

      </div>
    </section>

	<div class="container">

		<form name="newWrite" action="./BoardWriteAction.do" class="form-horizontal" method="post" onsubmit="return checkForm()">
			
			<input name="id" type="hidden" class="form-control" value="${sessionId}">
				
			<div class="form-group row">
				<label class="col-sm-2 control-label" >성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" value="<%=name %>"
						placeholder="name">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >차종</label>
				<div class="col-sm-5">

					<input name="carname" type="text" class="form-control"
						placeholder="subject">
				</div>
			</div>
			
			
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >제목</label>
				<div class="col-sm-5">

					<input name="subject" type="text" class="form-control"
						placeholder="subject">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >내용</label>
				<div class="col-sm-8">
					<textarea name="content" cols="50" rows="5" class="form-control"
						placeholder="content"></textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
				 <input type="submit" class="btn btn-primary " value="등록 ">				
					 <input type="button" class="btn btn-primary " value="취소"  onclick = "location.href='<c:url value="/BoardListAction.do?pageNum=1"/>'">
				</div>
			</div>
		</form>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>



