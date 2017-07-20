package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Citizen;
import utils.*;


@WebServlet("/login_citizen")


public class CitizenLogin extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String pass = request.getParameter("password");		
		PrintWriter out = response.getWriter();

		CitizenUtilsDAO dao = new CitizenUtilsDAOImpl();
		Citizen user = dao.login(email, pass);
		if(user != null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
		
			response.sendRedirect("CtHome.jsp");
			//out.close();
			
		}
		else{
			
				out.println("<script type=\"text/javascript\">");
		       out.println("alert('User or password incorrect');");
		       out.println("location='CitizenLogin.jsp';");

		       out.println("</script>");
		 
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
