package manager;

import java.sql.*;
import java.util.*;

import model.*;
import utils.*;
import data.*;

public class UserManager {

	public static UserLoginModel login(String username, String password, Connection conn) throws Exception {
		UserLoginModel userLogin = null;
		
		String sql = "SELECT * FROM " + TableNames.userLoginTable + " WHERE " + UserLoginModel.COLNAME_NAME + " = '" +
				username + "' AND " + UserLoginModel.COLNAME_PASSWORD + " = '" + password + "'";
		Statement st= conn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while(rs.next()) {
			userLogin = new UserLoginModel();
			userLogin.setId(new Integer(rs.getInt(UserLoginModel.COLNAME_ID)));
			userLogin.setName(rs.getString(UserLoginModel.COLNAME_NAME));
			userLogin.setPassword(rs.getString(UserLoginModel.COLNAME_PASSWORD));
			userLogin.setFkAcc(new Integer(rs.getInt(UserLoginModel.COLNAME_ACCFK)));
			userLogin.setDateCreated(rs.getTimestamp(UserLoginModel.COLNAME_DATECREATED));
			userLogin.setDateUpdated(rs.getTimestamp(UserLoginModel.COLNAME_DATEUPDATED));
		}
		return userLogin;
	}
	
	private static Integer getLastId(String table, Connection conn) throws Exception {
		String sql = "SELECT MAX(id) AS id FROM " + table + ";";
		Statement st= conn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		Integer id = new Integer(0);
		while(rs.next()) {
			id = new Integer(rs.getInt(UserModel.COLNAME_ID));
		}
		return id;
	}
	
	private static Integer getLastUserId(Connection conn) throws Exception {
		return getLastId(TableNames.userTable, conn);
	}
	
	public static void register(String username, String password, String fullName, String shortName, Timestamp dob, 
			String orgName, String orgType, String phone, String email, Connection conn) throws Exception {

		try {
			// TODO: Need to insert transaction lock
			// Check if user exists
			if (isUserExist(username, conn)) {
				throw new Exception("This user is already registered.");
			}
			// Create user
			String sql = "INSERT INTO " + TableNames.userTable + "(" + 
					UserModel.COLNAME_NAMEFULL + ", " +
					UserModel.COLNAME_NAMESHORT + ", " +
					UserModel.COLNAME_DOB + ", " +
					UserModel.COLNAME_ORGNAME + ", " +
					UserModel.COLNAME_ORGTYPE + ", " +
					UserModel.COLNAME_EMAIL + ", " +
					UserModel.COLNAME_PHONE + ", " +
					UserModel.COLNAME_ACCTYPE + ", " +
					UserModel.COLNAME_DATEJOINED + ", " +
					UserModel.COLNAME_DATECREATED + ", " +
					UserModel.COLNAME_DATEUPDATED + 
					")" +
					" VALUES ('" +
					fullName.trim() + "', '" +
					shortName.trim() + "', '" +
					dob + "', '" + // TODO: Need to ensure that whatever value comes in, it is always the right format
					orgName.trim() + "', '" +
					orgType.trim() + "', '" +
					email.trim() + "', '" +
					phone.trim() + "', '" +
					UserModel.ACCTYPE_MEMBER_VALUE + "', '" + // registration process only ever produces members, not admins
					TimestampGenerator.getTimestamp() + "', '" +
					TimestampGenerator.getTimestamp() + "', '" +
					TimestampGenerator.getTimestamp() + 
					"');";
			Statement st = conn.createStatement();
			st.executeUpdate(sql);
			// Get id of newly-created user
			Integer id = getLastUserId(conn);
			// Create user login
			sql = "INSERT INTO " + TableNames.userLoginTable + "(" + 
					UserLoginModel.COLNAME_NAME + ", " +
					UserLoginModel.COLNAME_PASSWORD + ", " +
					UserLoginModel.COLNAME_ACCFK + ", " +
					UserLoginModel.COLNAME_DATECREATED + ", " +
					UserLoginModel.COLNAME_DATEUPDATED + 
					")" +
					" VALUES ('" +
					username.trim() + "', '" +
					password.trim() + "', " +
					id + ", '" +
					TimestampGenerator.getTimestamp() + "', '" +
					TimestampGenerator.getTimestamp() + 
					"');";
			st = conn.createStatement();
			st.executeUpdate(sql);
			
		}
		catch (Exception ex) {
			throw ex;
		}
		
	}
	
	public static boolean isUserExist(String username, Connection conn) throws Exception {
		// Checks if a username already exists within the database
		boolean result = false;
		
		String sql = "SELECT * FROM " + TableNames.userLoginTable 
				+ " WHERE " + UserLoginModel.COLNAME_NAME + " = '" + username + "';";
		Statement st= conn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while(rs.next()) {
			result = true;
		}
		return result;
	}
	
	public static ArrayList<UserModel> getUsers(ArrayList<FilterPair> filter, Connection conn) throws Exception {
		ArrayList<UserModel> result = new ArrayList<UserModel>();
		
		// This code builds the SQL string with paired filters
		String sql = "SELECT * FROM " + TableNames.userTable ;
		if(filter != null && filter.size() > 0) {
			sql += " WHERE ";
			for(int i = 0; i < filter.size(); i++) {
				if(i > 0) {
					sql += " AND ";
				}
				FilterPair pair = (FilterPair) filter.get(i);
				sql += pair.getFilterStub();				
			}
		}
		sql +=	";";
		Statement st= conn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while(rs.next()) {
			UserModel userObj = new UserModel();
			userObj.setId(new Integer(rs.getInt(UserModel.COLNAME_ID)));
			userObj.setAccType(rs.getInt(UserModel.COLNAME_ACCTYPE));
			userObj.setDateCreated(rs.getTimestamp(UserModel.COLNAME_DATECREATED));
			userObj.setDateJoined(rs.getTimestamp(UserModel.COLNAME_DATEJOINED));
			userObj.setDateUpdated(rs.getTimestamp(UserModel.COLNAME_DATEUPDATED));
			userObj.setDob(rs.getTimestamp(UserModel.COLNAME_DOB));
			userObj.setEmail(rs.getString(UserModel.COLNAME_EMAIL));
			userObj.setFkCellgroup(rs.getInt(UserModel.COLNAME_CELLGROUPFK));
			userObj.setFullName(rs.getString(UserModel.COLNAME_NAMEFULL));
			userObj.setOrgName(rs.getString(UserModel.COLNAME_ORGNAME));
			userObj.setOrgType(rs.getString(UserModel.COLNAME_ORGTYPE));
			userObj.setPhone(rs.getString(UserModel.COLNAME_PHONE));
			userObj.setShortName(rs.getString(UserModel.COLNAME_NAMESHORT));
			result.add(userObj);
		}
		
		return result;
	}
}
