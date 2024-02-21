<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
	String id = request.getParameter("id"); 
%>
<sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@localhost:1521:xe"
	driver="oracle.jdbc.driver.OracleDriver" 
	user="c##carmarket" password="c##carmarket" />

<sql:update dataSource="${dataSource}" var="resultSet">
   DELETE FROM member WHERE id = ?
   <sql:param value="<%=id%>" />
</sql:update>

<c:if test="${resultSet>=1}">
	<c:redirect url="editMember.jsp" />
</c:if>

