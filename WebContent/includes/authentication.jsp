<%
	UserLoginModel userLogin = (UserLoginModel) session.getAttribute("userLogin");
	if(userLogin == null) {
		String redirectURL = "../index.jsp";
	    response.sendRedirect(redirectURL);
	}
	
%>