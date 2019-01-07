package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import DAO.ShowAcc;
import DAO.UpdatePassword;

import tools.*;

/**
 * Servlet implementation class ForgotPass
 */
@WebServlet("/ForgotPass")
public class ForgotPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ShowAcc show = new ShowAcc();   
    UpdatePassword update = new UpdatePassword();
    public ForgotPass() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		 String command = request.getParameter("login");
	      
		 	String mk = "new Password!";
		 	String mk2 ="new Password : 123";
		 	String email = request.getParameter("email");
		 	System.out.println(email);
	        String url1 = "mời bạn check email để lấy mật khẩu!";
	        /*Login users = new Login();
	        HttpSession session = request.getSession();*/
	       String url = "";
	        switch (command) {
	            case "dangnhap":    
	                SendMail.sendMail(email,mk,mk2 );
	                request.setAttribute("test",url1);
	                url = "/login.jsp";
	                break;
	            	
	            	
	        }
	        RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
	}
}
