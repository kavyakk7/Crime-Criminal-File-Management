package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.CitizenUtilsDAO;
import utils.CitizenUtilsDAOImpl;
import utils.CriminalUtilsDAO;
import utils.CriminalUtilsDAOImpl;
import beans.Citizen;
import beans.Criminal;


@WebServlet("/add_criminal")
public class AddCriminal extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sn = request.getParameter("CmName");
		int age=Integer.parseInt(request.getParameter("Cmage"));
		String addr = request.getParameter("Cmaddress");
		String marks=request.getParameter("Cmmarks");
		String details=request.getParameter("Cmcrimedetails");
		
		Criminal criminal = new Criminal(0,sn,age,addr,marks,details);
		CriminalUtilsDAO dao=new CriminalUtilsDAOImpl();
		if(dao.registerCriminal(criminal)){
			response.sendRedirect("PoliceLoginpage.jsp?add_criminal=success");
		}else{
			response.sendRedirect("registerCriminal.jsp?add_criminal=failed");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
