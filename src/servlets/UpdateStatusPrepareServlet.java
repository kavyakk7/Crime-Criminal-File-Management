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

import com.oracle.jrockit.jfr.RequestDelegate;
import com.sun.corba.se.impl.protocol.RequestDispatcherRegistryImpl;

import beans.Complaint;
import beans.Police;
import utils.ComplaintUtilsDAO;
import utils.ComplaintUtilsDAOImpl;


@WebServlet("/update_status")
public class UpdateStatusPrepareServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ComplaintUtilsDAO dao = new ComplaintUtilsDAOImpl();
		HttpSession session = request.getSession();
		
		Police ci =(Police)session.getAttribute("user");
		String comp_area=ci.getPs_location();
		//String comp_area=(String)request.getParameter("comp_area");
		List<Complaint> complaints = dao.getAllComplaintsbyArea(comp_area);
		session.setAttribute("comps", complaints);
		RequestDispatcher rd = request.getRequestDispatcher("UpdateStatus.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
