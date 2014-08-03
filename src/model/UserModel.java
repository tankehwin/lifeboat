package model;

import java.sql.Timestamp;

public class UserModel {

	public static final String COLNAME_ID = "id";
	public static final String COLNAME_NAMEFULL = "name_full";
	public static final String COLNAME_NAMESHORT = "name_short";
	public static final String COLNAME_DOB = "dob";
	public static final String COLNAME_ORGNAME = "org_name";
	public static final String COLNAME_ORGTYPE = "org_type";
	public static final String COLNAME_EMAIL = "email";
	public static final String COLNAME_PHONE = "phone";
	public static final String COLNAME_CELLGROUPFK = "cellgroup_fk";
	public static final String COLNAME_ACCTYPE = "acc_type";
	public static final String COLNAME_DATEJOINED = "date_joined";
	public static final String COLNAME_DATECREATED = "date_created";
	public static final String COLNAME_DATEUPDATED = "date_updated";
	
	private Integer id;
	private String fullName;
	private String shortName;
	private Timestamp dob;
	private String orgName;
	private String orgType;
	private String email;
	private String phone;
	private Integer fkCellgroup;
	private Integer accType;
	private Timestamp dateJoined;
	private Timestamp dateCreated;
	private Timestamp dateUpdated;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getShortName() {
		return shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	public Timestamp getDob() {
		return dob;
	}

	public void setDob(Timestamp dob) {
		this.dob = dob;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getOrgType() {
		return orgType;
	}

	public void setOrgType(String orgType) {
		this.orgType = orgType;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getFkCellgroup() {
		return fkCellgroup;
	}

	public void setFkCellgroup(Integer fkCellgroup) {
		this.fkCellgroup = fkCellgroup;
	}

	public Integer getAccType() {
		return accType;
	}

	public void setAccType(Integer accType) {
		this.accType = accType;
	}

	public Timestamp getDateJoined() {
		return dateJoined;
	}

	public void setDateJoined(Timestamp dateJoined) {
		this.dateJoined = dateJoined;
	}

	public Timestamp getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Timestamp dateCreated) {
		this.dateCreated = dateCreated;
	}

	public Timestamp getDateUpdated() {
		return dateUpdated;
	}

	public void setDateUpdated(Timestamp dateUpdated) {
		this.dateUpdated = dateUpdated;
	}
}
