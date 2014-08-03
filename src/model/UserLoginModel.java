package model;

import java.sql.Timestamp;

public class UserLoginModel {

	public static final String COLNAME_ID = "id";
	public static final String COLNAME_NAME = "name";
	public static final String COLNAME_PASSWORD = "password";
	public static final String COLNAME_ACCFK = "acc_fk";
	public static final String COLNAME_DATECREATED = "date_created";
	public static final String COLNAME_DATEUPDATED = "date_updated";
	
	private Integer id;
	private String name;
	private String password;
	private Integer fkAcc;
	private Timestamp dateCreated;
	private Timestamp dateUpdated;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getFkAcc() {
		return fkAcc;
	}
	public void setFkAcc(Integer fkAcc) {
		this.fkAcc = fkAcc;
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
