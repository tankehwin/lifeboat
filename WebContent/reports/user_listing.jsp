<%@include file="../includes/header.jsp" %>
<%@include file="../includes/authentication.jsp" %>

USER LISTING
<br />
<%
	// This page displays a list of users with search criteria allowed
	Connection conn = (Connection) session.getAttribute("conn");	

	// Returns all users which fit search criteria
	ArrayList<UserModel> result = UserManager.getUsers(null, conn);
	
%>
	<table class="gridtable"> <!-- This is the header -->
		<tr>
			<th>Full Name
			</th>
			<th>Nickname
			</th>
			<th>Birth Date
			</th>
			<th>Org. Name
			</th>
			<th>Org. Type
			</th>
			<th>Email
			</th>
			<th>Phone
			</th>
			<th>Type
			</th>
			<th>Date Joined
			</th>
			<th>Date Created
			</th>
			<th>Date Updated
			</th>
		</tr>
	
<%
	for(int i = 0; i < result.size(); i++) {
		UserModel userObj = (UserModel) result.get(i);
		System.out.println(userObj.getFullName());
%>
	<tr> <!-- This is each individual row -->
		<td><%=userObj.getFullName() %>
		</td>
		<td><%=userObj.getShortName() %>
		</td>
		<td><%=userObj.getDob() %>
		</td>
		<td><%=userObj.getOrgName() %>
		</td>
		<td><%=userObj.getOrgType() %>
		</td>
		<td><%=userObj.getEmail() %>
		</td>
		<td><%=userObj.getPhone() %>
		</td>
		<td><%=userObj.getAccType() %>
		</td>
		<td><%=userObj.getDateJoined() %>
		</td>
		<td><%=userObj.getDateCreated() %>
		</td>
		<td><%=userObj.getDateUpdated() %>
		</td>
	</tr>
<%
	}
	
%>
	</table>
<a href="../intro/dashboard.jsp">Back to Dashboard</a>

<%@include file="../includes/footer.jsp" %>