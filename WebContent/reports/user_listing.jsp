<%@include file="../includes/header.jsp" %>
<%@include file="../includes/authentication.jsp" %>

USER LISTING
<br />
<%
	// This page displays a list of users with search criteria allowed
	Connection conn = (Connection) session.getAttribute("conn");	
	String action = request.getParameter("action");
	ArrayList<UserModel> result = new ArrayList<UserModel>();
	ArrayList<FilterPair> filter = null;
	if(action != null && action.equals("search")) {
		// This action allows search
		String nameFull = request.getParameter("nameFull");
		String dobFrom = request.getParameter("dobFrom");
		String dobTo = request.getParameter("dobTo");
		String joinedFrom = request.getParameter("joinedFrom");
		String joinedTo = request.getParameter("joinedTo");
		String orgName = request.getParameter("orgName");
		String orgType = request.getParameter("orgType");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		filter = new ArrayList<FilterPair>();
		if(nameFull!=null && !nameFull.trim().equals("")) {
			FilterPair filterName = new FilterPair();
			filterName.fieldName = "name_full"; // TODO: replace with constants instead of hard-coded table field names
			filterName.value = nameFull;
			filterName.operator = FilterPair.OP_LIKE;
			filter.add(filterName);
		}
		if(orgName!=null && !orgName.trim().equals("")) {
			FilterPair filterOrgName = new FilterPair();
			filterOrgName.fieldName = "org_name"; // TODO: replace with constants instead of hard-coded table field names
			filterOrgName.value = orgName;
			filterOrgName.operator = FilterPair.OP_LIKE;
			filter.add(filterOrgName);
		}
		if(orgType!=null && !orgType.trim().equals("")) {
			FilterPair filterOrgType = new FilterPair();
			filterOrgType.fieldName = "org_type"; // TODO: replace with constants instead of hard-coded table field names
			filterOrgType.value = orgType;
			filterOrgType.operator = FilterPair.OP_LIKE;
			filter.add(filterOrgType);
		}
		if(email!=null && !email.trim().equals("")) {
			FilterPair filterEmail = new FilterPair();
			filterEmail.fieldName = "email"; // TODO: replace with constants instead of hard-coded table field names
			filterEmail.value = email;
			filterEmail.operator = FilterPair.OP_LIKE;
			filter.add(filterEmail);
		}
		if(phone!=null && !phone.trim().equals("")) {
			FilterPair filterPhone = new FilterPair();
			filterPhone.fieldName = "phone"; // TODO: replace with constants instead of hard-coded table field names
			filterPhone.value = phone;
			filterPhone.operator = FilterPair.OP_LIKE;
			filter.add(filterPhone);
		}
		
		if(dobFrom!=null && !dobFrom.trim().equals("")) {
			FilterPair filterDobFrom = new FilterPair();
			filterDobFrom.fieldName = "dob"; // TODO: replace with constants instead of hard-coded table field names
			filterDobFrom.value = TimestampGenerator.createTimestamp(dobFrom).toString();
			filterDobFrom.operator = FilterPair.OP_MORE_EQUALS;
			filter.add(filterDobFrom);
		}
		if(dobTo!=null && !dobTo.trim().equals("")) {
			FilterPair filterDobTo = new FilterPair();
			filterDobTo.fieldName = "dob"; // TODO: replace with constants instead of hard-coded table field names
			filterDobTo.value = TimestampGenerator.createTimestamp(dobTo).toString();
			filterDobTo.operator = FilterPair.OP_LESS;
			filter.add(filterDobTo);
		}
		if(joinedFrom!=null && !joinedFrom.trim().equals("")) {
			FilterPair filterJoinedFrom = new FilterPair();
			filterJoinedFrom.fieldName = "date_joined"; // TODO: replace with constants instead of hard-coded table field names
			filterJoinedFrom.value = TimestampGenerator.createTimestamp(joinedFrom).toString();
			filterJoinedFrom.operator = FilterPair.OP_MORE_EQUALS;
			filter.add(filterJoinedFrom);
		}
		if(joinedTo!=null && !joinedTo.trim().equals("")) {
			FilterPair filterJoinedTo = new FilterPair();
			filterJoinedTo.fieldName = "date_joined"; // TODO: replace with constants instead of hard-coded table field names
			filterJoinedTo.value = TimestampGenerator.createTimestamp(joinedTo).toString();
			filterJoinedTo.operator = FilterPair.OP_LESS;
			filter.add(filterJoinedTo);
		}
		
	}
	else {
		// Default action, returns all users which fit search criteria
		filter = null;
	}
	result = UserManager.getUsers(filter, conn);
	
%>
<script>
	$(function() {
		$( "#dobFrom" ).datepicker();
	});
</script>
<script>
	$(function() {
		$( "#dobTo" ).datepicker();
	});
</script>
<script>
	$(function() {
		$( "#joinedFrom" ).datepicker();
	});
</script>
<script>
	$(function() {
		$( "#joinedTo" ).datepicker();
	});
</script>
<form action="user_listing.jsp" method="post" accept-charset=utf-8>
<input type="hidden" name="action" value="search">
<table class="formtable">
	<tr>
		<th colspan=3>Search
		</th>
	</tr>
	<tr>
		<td>Name
		</td>
		<td>:
		</td>
		<td><input type="text" name="nameFull" />
		</td>
	</tr>
	<tr>
		<td>Org. Name
		</td>
		<td>:
		</td>
		<td><input type="text" name="orgName" />
		</td>
	</tr>
	<tr>
		<td>Org. Type
		</td>
		<td>:
		</td>
		<td><input type="text" name="orgType" />
		</td>
	</tr>
	<tr>
		<td>Email
		</td>
		<td>:
		</td>
		<td><input type="text" name="email" />
		</td>
	</tr>
	<tr>
		<td>Phone
		</td>
		<td>:
		</td>
		<td><input type="text" name="phone" />
		</td>
	</tr>
	<tr>
		<td>Date of Birth
		</td>
		<td>:
		</td>
		<td>From - <input type="text" name="dobFrom" id="dobFrom" />&nbsp;To - <input type="text" name="dobTo" id="dobTo" />
		</td>
	</tr>
	<tr>
		<td>Date Joined
		</td>
		<td>:
		</td>
		<td>From - <input type="text" name="joinedFrom" id="joinedFrom" />&nbsp;To - <input type="text" name="joinedTo" id="joinedTo" />
		</td>
	</tr>
	<tr>
		<td><input type="submit" value="Search"/>
		</td>
		<td>&nbsp;
		</td>
		<td>&nbsp;
		</td>
	</tr>
</table>
</form>
<br />
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
		<td><%=TimestampGenerator.getFormattedDate(userObj.getDob()) %>
		</td>
		<td><%=userObj.getOrgName() %>
		</td>
		<td><%=userObj.getOrgType() %>
		</td>
		<td><%=userObj.getEmail() %>
		</td>
		<td><%=userObj.getPhone() %>
		</td>
		<td><%=((userObj.getAccType().equals(UserModel.ACCTYPE_ADMIN_VALUE))?UserModel.ACCTYPE_ADMIN_NAME:UserModel.ACCTYPE_MEMBER_NAME) %>
		</td>
		<td><%=TimestampGenerator.getFormattedDate(userObj.getDateJoined()) %>
		</td>
		<td><%=TimestampGenerator.getFormattedDate(userObj.getDateCreated()) %>
		</td>
		<td><%=TimestampGenerator.getFormattedDate(userObj.getDateUpdated()) %>
		</td>
	</tr>
<%
	}
	
%>
	</table>
<a href="../intro/dashboard.jsp">Back to Dashboard</a>

<%@include file="../includes/footer.jsp" %>