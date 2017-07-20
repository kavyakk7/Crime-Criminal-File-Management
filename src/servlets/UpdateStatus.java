package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.PoliceDAO;
import utils.PoliceDAOImpl;


@WebServlet("/updateC")
public class UpdateStatus extends HttpServlet {
	
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int comp_id = Integer.parseInt(request.getParameter("comp_id"));
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		PoliceDAO dao = new PoliceDAOImpl();
		if(dao.UpdateStatus_of_Complaint(comp_id)){
			out.print("SOLVED");
		}
		else{
			out.print("PENDING");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
