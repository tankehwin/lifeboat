<%@include file="../includes/header.jsp" %>
<%
	Connection conn = (Connection) session.getAttribute("conn");
	String action = request.getParameter("action");
	String error = "";
	if(action != null && action.equals("registerUser")) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String fullName = request.getParameter("fullname");
		String shortName = request.getParameter("shortname");
		String dob = request.getParameter("dob");
		String orgName = request.getParameter("orgname");
		String orgType = request.getParameter("orgtype");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");	
		try {
			UserManager.register(username, password, fullName, shortName, TimestampGenerator.createTimestamp(dob),
					orgName, orgType, phone, email, conn);
			String success = "Registration successful for " + username + ".";
			System.out.println(success);
%>
<script>
	$(function() {
		$( "#dialog-message" ).dialog({
			modal: true,
			buttons: {
				OK: function() {
					$( this ).dialog( "close" );
					window.location.replace("../index.jsp");
					
				}
			}
		});
	});
</script>

<div id="dialog-message" title="Registration Successful">
	<p>
		<span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
		<%=success %>
	</p>
</div>
<%
		}
		catch (Exception ex) {
			if(ex.getMessage().equals("This user is already registered.")) {
				error = ex.getMessage();
			}
			else {
				error = ex.getMessage() + ". This user could not be registered.";
			}
		}	
	} // end if
%>
<script>
	$(function() {
		$( "#dob" ).datepicker();
	});
</script>
<form action="register.jsp" method="post" accept-charset=utf-8>
<input type="hidden" name="action" value="registerUser">
<table class="formtable">
	<tr>
		<th colspan=3>Register
		</th>
	</tr>
	<tr>
		<td>Username
		</td>
		<td>:
		</td>
		<td><input type="text" name="username" />
		</td>
	</tr>
	<tr>
		<td>Password
		</td>
		<td>:
		</td>
		<td><input type="password" name="password" />
		</td>
	</tr>
	<tr>
		<td>Full Name
		</td>
		<td>:
		</td>
		<td><input type="text" name="fullname" />
		</td>
	</tr>
	<tr>
		<td>Nickname
		</td>
		<td>:
		</td>
		<td><input type="text" name="shortname" />
		</td>
	</tr>
	<tr>
		<td>Date of Birth
		</td>
		<td>:
		</td>
		<td><input type="text" name="dob" id="dob" />
		</td>
	</tr>
	<tr>
		<td>Organisation Name
		</td>
		<td>:
		</td>
		<td><input type="text" name="orgname" />
		</td>
	</tr>
	<tr>
		<td>Organisation Type
		</td>
		<td>:
		</td>
		<td><input type="text" name="orgtype" />
		</td>
	</tr>
	<tr>
		<td>Phone Number
		</td>
		<td>:
		</td>
		<td><input type="text" name="phone" />
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
		<td><input type="submit" value="Register"/>
		</td>
		<td>&nbsp;
		</td>
		<td>&nbsp;
		</td>
	</tr>
</table>
</form>
<br />
<%
	if(!error.equals("")) {
%>
<span class="ui-state-error-text ui-state-error" ><%=error %></span> 
<%
	}
%>
<%@include file="../includes/footer.jsp" %>