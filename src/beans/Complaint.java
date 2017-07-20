package beans;

import java.sql.Timestamp;

public class Complaint implements Comparable<Complaint>{
	private int comp_id;
	private String comp_name;
	private String comp_details;
	private Citizen cityzn;
	private String comp_status;
	private String comp_area;
	private Timestamp comp_date;
	private String case_id;
	private String comp_cm_id;
	private String comp_c_id;
	
	public Complaint(){}

	public Complaint(String case_id, int comp_id, String comp_name, String comp_details, Citizen cityzn, String comp_status,String comp_area) {
		super();
		this.case_id = case_id;
		this.comp_id = comp_id;
		this.comp_name = comp_name;
		this.comp_details = comp_details;
		this.cityzn = cityzn;
		this.comp_status = comp_status;
		this.comp_area=comp_area;
	}
	
	public Complaint(String case_id, int comp_id, String comp_name, String comp_details, String cityzn, String comp_status,String comp_area, String comp_date) {
		super();
		this.case_id = case_id;
		this.comp_id = comp_id;
		this.comp_name = comp_name;
		this.comp_details = comp_details;
		this.comp_c_id = cityzn;
		this.comp_status = comp_status;
		this.comp_area=comp_area;
	}
	
	public boolean equals(Complaint other)
	{
		return this.getComp_id() == other.getComp_id();
	}

	public int compareTo(Complaint other)
	{
		int cid = (int) getComp_comp_id();
		int cid1 = (int) other.getComp_comp_id();
		if(this.equals(other))
		{
			return 0;
		}
		else if(cid > cid1)
		{
			return 1;
		}
		else
			return -1;
	}
	
	@Override
	public String toString() 
	{
		return getComp_caseid()+","+getComp_name()+","+getComp_details()+","+getComp_status()+","+getComp_area();
	}
	
	
	private Object getComp_comp_id() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getComp_caseid() {
		return case_id;
	}
	
	public void setComp_caseid(String case_id) {
		this.case_id = case_id;
	}
	
	public int getComp_id() {
		return comp_id;
	}

	public void setComp_id(int comp_id) {
		this.comp_id = comp_id;
	}

	public String getComp_name() {
		return comp_name;
	}

	public void setComp_name(String comp_name) {
		this.comp_name = comp_name;
	}

	public String getComp_details() {
		return comp_details;
	}

	public void setComp_details(String comp_details) {
		this.comp_details = comp_details;
	}

	public Citizen getCityzn() {
		return cityzn;
	}

	public void setCityzn(Citizen cityzn) {
		this.cityzn = cityzn;
	}

	public String getComp_status() {
		return comp_status;
	}

	public void setComp_status(String comp_status) {
		this.comp_status = comp_status;
	}
	public String  getComp_area()
	{
		return comp_area;
	}
	public void setComp_area(String comp_area)
	{
		this.comp_area=comp_area;
	}
	
	
	public Timestamp getComp_date() {
		return comp_date;
	}

	public void setComp_date(Timestamp comp_date) {
		this.comp_date = comp_date;
	}

	
}
