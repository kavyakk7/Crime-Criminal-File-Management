package servlets;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import utils.PoliceDAO;
import utils.PoliceDAOImpl;

import beans.Police;


@WebServlet("/loginpolice")
public class loginpolice extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String email = request.getParameter("name");
		String pass = request.getParameter("password");
		//PrintWriter out = response.getWriter();

		PoliceDAO dao = new PoliceDAOImpl();
		Police user = dao.login(email, pass);
		//String ps_loc = user.getPs_location();
		if(user != null)
		{
			HttpSession session = request.getSession();
			//session.setAttribute("loc",ps_loc);
			session.setAttribute("user", user);
			response.sendRedirect("PoliceLoginpage.jsp");
			//out.close();
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
