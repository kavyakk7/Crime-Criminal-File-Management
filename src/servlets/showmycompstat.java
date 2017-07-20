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
import beans.Citizen;
import beans.Complaint;


@WebServlet("/showmycompstat")
public class showmycompstat extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ComplaintUtilsDAO dao = new ComplaintUtilsDAOImpl();
		HttpSession session = request.getSession();
		Citizen c =(Citizen)session.getAttribute("c"); 
		int comp_id=c.getC_id();
		String complaint = dao.getStatus_of_Complaint(comp_id);
		session.setAttribute("complaint", complaint);
		RequestDispatcher rd = request.getRequestDispatcher("showmycompstat.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
