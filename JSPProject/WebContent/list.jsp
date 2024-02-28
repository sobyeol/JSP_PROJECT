<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BoardDTO"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	List boardList = (List) request.getAttribute("boardlist");
	int total_record = ((Integer) request.getAttribute("total_record")).intValue();
	int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
	int total_page = ((Integer) request.getAttribute("total_page")).intValue();
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>Board</title>
<script type="text/javascript">
	function checkForm() {	
		if (${sessionId==null}) {
			alert("로그인 해주세요.");
			return false;
		}

		location.href = "./BoardWriteForm.do?id=<%=sessionId%>"
	}
	
	function categoryChange(e) {
		var good_a = ["k3", "k5", "k8", "k9"];
		var good_b = ["쏘나타", "그랜져", "팰리셰이드", "제네시스"];
		var good_c = ["티볼리", "토레스", "코란도", "렉스턴"];
		var target = document.getElementById("good");

		if(e.value == "a") var d = good_a;
		else if(e.value == "b") var d = good_b;
		else if(e.value == "c") var d = good_c;

		target.options.length = 0;

		for (x in d) {
			var opt = document.createElement("option");
			opt.value = d[x];
			opt.innerHTML = d[x];
			target.appendChild(opt);
		}
	}
	
	
</script>
</head>
<body>
	<jsp:include page="top.jsp" />
	
	<section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>자유게시판</h2>
         
        </div>

      </div>
    </section>
	
	
	<div class="container">
		<form action="<c:url value="./BoardListAction.do"/>" method="post">
			
			<section id="breadcrumbs" class="breadcrumbs">
				<div class="d-flex justify-content-between align-items-center">
					<label><h2>제조사 선택</h2></label>	
					<select onchange="categoryChange(this)">
						<option>제조사를 선택해주세요.</option>
						<option value="a">기아</option>
						<option value="b">현대</option>
						<option value="c">쌍용</option>
					</select>
				</div>
				
				<div class="d-flex justify-content-between align-items-center">
					<label><h2>차종 선택</h2></label>
					<select id="good">
						<option>차종을 선택해주세요.</option>
					</select>
				</div>
				
					
										
			</section>
			
			<div>
				<div class="text-right">
					<span class="badge badge-success">전체 <%=total_record%>건	</span>
				</div>
			</div>
			
			
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회</th>
						<th>글쓴이</th>
					</tr>
					<%
						for (int j = 0; j < boardList.size(); j++) {
							BoardDTO notice = (BoardDTO) boardList.get(j);
					%>
					<tr>
						<td><%=notice.getNum()%></td>
						<td><a href="./BoardViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"><%=notice.getSubject()%></a></td>
						<td><%=notice.getRegist_day()%></td>
						<td><%=notice.getHit()%></td>
						<td><%=notice.getName()%></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			<div align="center">
				<c:set var="pageNum" value="<%=pageNum%>" />
				<c:forEach var="i" begin="1" end="<%=total_page%>">
					<a href="<c:url value="./BoardListAction.do?pageNum=${i}" /> ">
						<c:choose>
							<c:when test="${pageNum==i}">
								<font color='4C5317'><b> [${i}]</b></font>
							</c:when>
							<c:otherwise>
								<font color='4C5317'> [${i}]</font>

							</c:otherwise>
						</c:choose>
					</a>
				</c:forEach>
			</div>
			<div align="left">
				<table>
					<tr>
						<td width="100%" align="left">&nbsp;&nbsp; 
						<select name="items" class="txt">
								<option value="subject">제목에서</option>
								<option value="content">본문에서</option>
								<option value="name">글쓴이에서</option>
								<option value="carname">차종검색</option>
						</select> 
						<input name="text" type="text" /> 
						<input type="submit" id="btnAdd" class="btn btn-primary " value="검색 " />
						</td>
						
						<td width="100%" align="right">
							<a href="#" onclick="checkForm(); return false;" class="btn btn-primary">&laquo;글쓰기</a>
						</td>
					</tr>
				</table>
			</div>
		</form>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>





