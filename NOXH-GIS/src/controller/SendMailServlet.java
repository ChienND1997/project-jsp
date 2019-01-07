package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.SendMail;

/**
 * Servlet implementation class SendMailServlet
 */
@WebServlet("/SendMailServlet")
public class SendMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		 String command = request.getParameter("them");
	      
		 	String mk = "Confirm project";
		 	String mk2 ="Ho so cua ban da duoc xet duyet! ban co the hoan thien tu ngay mai";
		 
		 	
	        String url1 = "mời bạn check email để lấy mật khẩu!";
	        /*Login users = new Login();
	        HttpSession session = request.getSession();*/
	       String url = "";
	        switch (command) {
	            case "them":    
	                SendMail.sendMail("acmathuhait@gmail.com",mk,mk2 );
	                request.setAttribute("test",url1);
	                url = "/HoSoOnline.jsp";
	                break;
	            	
	            	
	        }
	        RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
	}

}
