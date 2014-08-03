<%@include file="../includes/header.jsp" %>
<%
	// Remove db connection object and login object 
	session.setAttribute("userLogin", null);
	session.setAttribute("conn", null);
%>
<%@include file="../includes/authentication.jsp" %>

Logging you out...
<br />


<%@include file="../includes/footer.jsp" %>