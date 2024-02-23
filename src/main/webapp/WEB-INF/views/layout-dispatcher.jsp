<%
	String view = request.getParameter("view");
	if (view.startsWith("admin/")) {
		pageContext.forward("layout-admin.jsp");
	} 
	else if(view.startsWith("user/")) {
		pageContext.forward("layout-user.jsp");
	}
	else{
		pageContext.forward("layout-login.jsp");
	}
%>