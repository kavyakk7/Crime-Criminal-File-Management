package servlets;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Citizen;
import mail.Sendmail;
import utils.CitizenUtilsDAO;
import utils.CitizenUtilsDAOImpl;

@WebServlet("/reg_citizen")
public class RegisterCitizen extends HttpServlet {
	private String host;
	private String port;
	private String user;
	private String pass;

	public void init() {
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		host = context.getInitParameter("smtp.gmail.com");
		port = context.getInitParameter("587");
		user = context.getInitParameter("onlinecrimeinfoportal@gmail.com");
		pass = context.getInitParameter("Arshavin2008");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	 {
		String sn = request.getParameter("CtName");
		String email = request.getParameter("Cemail");
		long contact = Long.parseLong(request.getParameter("Ccontact"));
		String addr = request.getParameter("Caddress");
		String pass = request.getParameter("password");

		Citizen citizen = new Citizen(0, sn, email, addr, contact, pass);
		CitizenUtilsDAO dao = new CitizenUtilsDAOImpl();
		if (dao.registerCitizen(citizen)) {

			try {
				Sendmail.sendEmail(email);
				response.sendRedirect("login_crime_branch.jsp?reg_citizen=success");
			} catch (Exception ex) {
				ex.printStackTrace();
				// resultMessage = "There were an error: " + ex.getMessage();
				response.sendRedirect("Register.jsp?reg_citizen=failed");
			}
		} else {
			response.sendRedirect("Register.jsp?reg_citizen=failed");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
