package beans;

public class Criminal {
	private int cm_id;
	private String cm_name;
	private int cm_age;
	private String cm_address;
	private String cm_marks;
	private String cm_crimedetails;
	
	public Criminal(){}

	public Criminal(int cm_id, String cm_name, int cm_age, String cm_address, String cm_marks, String cm_crimedetails) {
		super();
		this.cm_id = cm_id;
		this.cm_name = cm_name;
		this.cm_age = cm_age;
		this.cm_address = cm_address;
		this.cm_marks = cm_marks;
		this.cm_crimedetails = cm_crimedetails;
	}

	public int getCm_id() {
		return cm_id;
	}

	public void setCm_id(int cm_id) {
		this.cm_id = cm_id;
	}

	public String getCm_name() {
		return cm_name;
	}

	public void setCm_name(String cm_name) {
		this.cm_name = cm_name;
	}

	public int getCm_age() {
		return cm_age;
	}

	public void setCm_age(int cm_age) {
		this.cm_age = cm_age;
	}

	public String getCm_address() {
		return cm_address;
	}

	public void setCm_address(String cm_address) {
		this.cm_address = cm_address;
	}

	public String getCm_marks() {
		return cm_marks;
	}

	public void setCm_marks(String cm_marks) {
		this.cm_marks = cm_marks;
	}

	public String getCm_crimedetails() {
		return cm_crimedetails;
	}

	public void setCm_crimedetails(String cm_crimedetails) {
		this.cm_crimedetails = cm_crimedetails;
	}

	@Override
	public String toString() {
		return cm_name;
	}
	
}
