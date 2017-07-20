package utils;
import java.util.List;

import beans.Complaint;
import beans.Police;
public interface PoliceDAO {
	
	public boolean signUp(Police police);
	
	public Police login(String email,String pass);
	
	public boolean UpdateStatus_of_Complaint(int comp_id);
	
	public boolean PoliceAssign_caseTopolice(String ps_name, String case_id);
}

