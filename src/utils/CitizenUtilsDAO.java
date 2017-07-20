package utils;

import java.util.List;

import beans.Citizen;

public interface CitizenUtilsDAO {
	public boolean registerCitizen(Citizen citizen);
//	public List<Citizen> getAllCitizen();
	//public Citizen getComplaint(int comp_id);
	public Citizen login(String email,String pass);
}
