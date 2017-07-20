package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Citizen;
import beans.Complaint;
import utils.*;

@WebServlet("/lodge_comp")
public class LodgeComplaint extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String sn = request.getParameter("comp_name");
		String email = request.getParameter("comp_details");
		String caseid = request.getParameter("case_id");
		String c_add = request.getParameter("c_address");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		Citizen c = (Citizen)session.getAttribute("user");
		String sb = c.getC_address();
		
			Complaint comp = new Complaint(caseid,0,sn,email,c,"",sb);
					
			ComplaintUtilsDAO dao = new ComplaintUtilsDAOImpl();
			PoliceDAOImpl dao1 = new PoliceDAOImpl();
			if(dao.addComplaint(comp) && dao1.Assign_caseTopolice(c_add,caseid))
			{
				session.setAttribute("comp", comp);
				
				RequestDispatcher rd = request.getRequestDispatcher("Sendemail.jsp");
				rd.forward(request, response);
			}
			else
			{
				response.sendRedirect("LodgeComp.jsp?lodge_comp=failed");
			}
	} 

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
