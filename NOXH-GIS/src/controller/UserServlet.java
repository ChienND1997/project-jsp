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




public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RegisterDAO registerDAO = new RegisterDAO();
       
  
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		 String command = request.getParameter("login");
	        String url = "";
	        final String admin = "Admin";
	        final String canbobo = "Canbobo";
	        final String canboso = "Canboso";
	        
	        HttpSession session = request.getSession();
	        switch (command) {
	            case "dangnhap":
	            	Login users = new Login();
	                users = registerDAO.login(request.getParameter("ipUserName"),MD5.encryption(request.getParameter("ipPassword")));         
	                if (users != null) {    	
	                    session.setAttribute("ipUserName", users);
	                    if(users.getAccount().equals(admin) || users.getAccount().equals(canbobo)||users.getAccount().equals(canboso)) {
	                    url = "/TrangChu.jsp"; 
	                    }else {
	                    	url = "/TrangChuCD.jsp";
	                    }
	                }else{
	                    request.setAttribute("error", "Error email or password!");
	                    url = "/login.jsp";
	                }
	                break;
	        }
	        RequestDispatcher rd =request.getRequestDispatcher(url);
	        rd.forward(request, response);
	}


}
