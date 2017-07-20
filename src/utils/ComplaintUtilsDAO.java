package utils;

import java.util.List;

import beans.Complaint;

public interface ComplaintUtilsDAO {
	public boolean addComplaint(Complaint complaint);
	
	public List<Complaint> getAllComplaints();
	
	public String getStatus_of_Complaint(int comp_id);
	
	public List<Complaint> getAllComplaintsbyArea(String comp_area);
	
	public List<Complaint> getAllComplaintsbyCID(int comp_cid); 
	
	public List<Complaint> getAllComplaintsbyAreaForDCP(String comp_area);
	
}
