package data;

public class FilterPair {
	// This class is used to build filter criteria for SQL statements
	public String fieldName; // this is the table's field name
	public Object value; // this is the value associated with the field name
	public String operator; // this describes the relationship
	
	public String getFilterStub() {
		String result = "";
		
		result = fieldName + " " + operator + " " + processValue();
		
		return result;
	}
	
	private String processValue() {
		String result = "";
		
		if(value.getClass().equals(String.class)) {
			// if this is a String type
			result = "'" + value + "'";
		}
		else {
			result = value.toString();
		}
		
		return result;
	}
}
