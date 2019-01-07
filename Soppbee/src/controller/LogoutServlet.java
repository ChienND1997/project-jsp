package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/jsp");
		HttpSession ss = request.getSession(false);
		if (ss!=null) {
			ss.removeAttribute("ipUserName");
			ss.invalidate();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		 rd.forward(request, response); 
	
	}

}
