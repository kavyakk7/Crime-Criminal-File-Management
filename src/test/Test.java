package test;

import java.util.List;

import beans.Citizen;
import beans.Complaint;
import beans.Criminal;
import utils.*;

public class Test {

	public static void main(String[] args) {
	/*	Citizen c=new Citizen();
		c.setC_id(1);
		Complaint comp=new Complaint(2,"HOMICIDE","Near Park Street Area",c,"SOLVED");
		ComplaintUtilsDAO dao=new ComplaintUtilsDAOImpl();
		if(dao.addComplaint(comp))
		{
			System.out.println("Success");
		}
		else
		{
			System.out.println("Failure");
		}  
	*/
	/*	Citizen c=new Citizen(0,"Sourav","sou@gmail.com","Naktala",5454,"sou123");
		CitizenUtilsDAO dao=new CitizenUtilsDAOImpl();
		if(dao.registerCitizen(c)){
			System.out.println("Success");
		}
		else
		{
			System.out.println("Failure");
		}
	*/
		
	//	Citizen c=new Citizen();
	/*	CitizenUtilsDAO dao=new CitizenUtilsDAOImpl();
		Citizen c=dao.login("Saha@gmail.com", "rimasaha");
		if(c!=null)
		{
			System.out.println("hello"+c.getC_name());
		}
		else
		{
			System.out.println("failure");
		}
	*/	
	/* CriminalUtilsDAO dao=new CriminalUtilsDAOImpl();
	 List<Criminal> criminals=dao.getMostWanted();
	 System.out.println("All the criminals are:  ");
	 for(Criminal cr:criminals)
	 {
		 System.out.println(cr.getCm_name());
	 }
	*/
		
	ComplaintUtilsDAO dao=new ComplaintUtilsDAOImpl();
	String comp_area="BANGALORE";
	List<Complaint> c=dao.getAllComplaintsbyArea(comp_area);
	for(Complaint comp:c)
	{
		System.out.print(comp.getComp_name());
	}
	
	}   
		
	

}
