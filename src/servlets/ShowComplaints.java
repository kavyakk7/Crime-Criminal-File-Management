package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.ComplaintUtilsDAO;
import utils.ComplaintUtilsDAOImpl;
import beans.Complaint;
import beans.Police;

@WebServlet("/show_complaints")
public class ShowComplaints extends HttpServlet 
{	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		ComplaintUtilsDAO dao = new ComplaintUtilsDAOImpl();
		HttpSession session = request.getSession(false);
		Police ci =(Police)session.getAttribute("user");
		String comp_area=ci.getPs_location();
		System.out.println("area:"+comp_area);
		if(ci.getPs_rank().equals("Deputy Commissioner of Police"))
		{
			List<Complaint> complaint = dao.getAllComplaintsbyArea(comp_area);
			session.setAttribute("complaint", complaint);
		}
		else
		{
			List<Complaint> complaint = dao.getAllComplaintsbyAreaForDCP(comp_area);
			session.setAttribute("complaint", complaint);
		}
		RequestDispatcher rd = request.getRequestDispatcher("showcomplaints.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request,response);
	}
}
