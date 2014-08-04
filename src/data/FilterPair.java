package data;

public class FilterPair {
	// This class is used to build filter criteria for SQL statements
	public String fieldName; // this is the table's field name
	public Object value; // this is the value associated with the field name
	public String operator; // this describes the relationship
	public static final String OP_LIKE = "LIKE";
	public static final String OP_EQUALS = "=";
	public static final String OP_MORE_EQUALS = ">=";
	public static final String OP_MORE = ">";
	public static final String OP_LESS_EQUALS = "<=";
	public static final String OP_LESS = "<";
	
	public String getFilterStub() throws Exception {
		String result = "";
		
		result = fieldName + " " + operator + " " + processValue();
		
		return result;
	}
	
	private String processValue() throws Exception {
		String result = "";
		
		if(value.getClass().equals(String.class)) {
			// if this is a String type
			
			if(operator.equals(OP_LIKE)) {
				result = "'%" + value + "%'";
			}
			else if(operator.equals(OP_EQUALS)) {
				result = "'" + value + "'";
			}
			else if(operator.equals(OP_MORE_EQUALS)) {
				result = "'" + value + "'";
			}
			else if(operator.equals(OP_MORE)) {
				result = "'" + value + "'";
			}
			else if(operator.equals(OP_LESS_EQUALS)) {
				result = "'" + value + "'";
			}
			else if(operator.equals(OP_LESS)) {
				result = "'" + value + "'";
			}
			else {
				throw new Exception("Filter operand not specified.");
			}
		}
		else {
			result = value.toString();
		}
		
		return result;
	}
}
