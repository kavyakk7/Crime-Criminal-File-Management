package beans;

public class Police {
 private int ps_id;
 private String ps_name;
 private String ps_rank;
 private String ps_location;
 private String ps_password;
 private String case_assigned;
 

 public String getPs_name() {
	return ps_name;
}
public void setPs_name(String ps_name) {
	this.ps_name = ps_name;
}

public String getPs_rank() {
	return ps_rank;
}
public void setPs_rank(String ps_rank) {
	this.ps_rank = ps_rank;
}

public String getPs_case_assigned() {
	return case_assigned;
}
public void setPs_case_assigned(String case_assigned) {
	this.case_assigned += ","+case_assigned;
}
	public Police() {}
	public int getPs_id() {
		return ps_id;
	}
	public void setPs_id(int ps_id) {
		this.ps_id = ps_id;
	}
	
	public String getPs_location() {
		return ps_location;
	}
	public void setPs_location(String ps_location) {
		this.ps_location = ps_location;
	}
	public String getPs_password() {
		return ps_password;
	}
	public void setPs_password(String ps_password) {
		this.ps_password = ps_password;
	}
	public Police(int ps_id, String ps_name, String ps_password, String ps_location) {
		super();
		this.ps_id = ps_id;
		this.ps_name = ps_name;
		this.ps_location = ps_location;
		this.ps_password = ps_password;
	}
	@Override
	public String toString() {
		return ps_name;
	}
}

