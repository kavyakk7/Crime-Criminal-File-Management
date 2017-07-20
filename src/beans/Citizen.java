package beans;
public class Citizen {
	private int c_id;
	private String c_name;
	private String c_email;
	private String c_address;
	private long c_contact;
	private String c_password;
public Citizen(){}
public Citizen(int c_id, String c_name, String c_email, String c_address, long c_contact, String c_password) {
	super();
	this.c_id = c_id;
	this.c_name = c_name;
	this.c_email = c_email;
	this.c_address = c_address;
	this.c_contact = c_contact;
	this.c_password = c_password;
}
public int getC_id() {
	return c_id;
}
public void setC_id(int c_id) {
	this.c_id = c_id;
}
public String getC_name() {
	return c_name;
}
public void setC_name(String c_name) {
	this.c_name = c_name;
}
public String getC_email() {
	return c_email;
}
public void setC_email(String c_email) {
	this.c_email = c_email;
}
public String getC_address() {
	return c_address;
}
public void setC_address(String c_address) {
	this.c_address = c_address;
}
public long getC_contact() {
	return c_contact;
}
public void setC_contact(long c_contact) {
	this.c_contact = c_contact;
}
public String getC_password() {
	return c_password;
}
public void setC_password(String c_password) {
	this.c_password = c_password;
}
@Override
public String toString() {
	return c_name;
}
}