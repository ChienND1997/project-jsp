package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.RegisterDAO;
import Model.Login;
import tools.MD5;


public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	RegisterDAO rs = new RegisterDAO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		 String command = request.getParameter("command");
	      
	   
	        String url = "";
	        Login users = new Login();
	        HttpSession session = request.getSession();
	       
	        switch (command) {
	            case "insert":
	            	users.setIDR(new java.util.Date().getTime());
	            	users.setAccount(request.getParameter("ipUserName"));
	                users.setPassword(MD5.encryption(request.getParameter("ipPassword")));
	                rs.insertUser(users);
	                session.setAttribute("UserName", users);
	                url = "/login.jsp";
	                break;
	        }
	        RequestDispatcher rd =request.getServletContext().getRequestDispatcher(url);
	        rd.forward(request, response);
	}

}
