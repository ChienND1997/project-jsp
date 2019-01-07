package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DeleteCDDAO;


public class DeleteCD extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   String cmnd = request.getParameter("cmnd");
	        DeleteCDDAO delete = new DeleteCDDAO();
	        String error = "Xóa không thành công";
	        
	        try {
	            if (delete.deleteNguoiMua(cmnd)) {
	                response.sendRedirect("QuanLyCongDan.jsp");
	            } else {
	                request.setAttribute("error", error);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}

}
