package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DeleteCDDAO;
import DAO.DeleteDADAO;

/**
 * Servlet implementation class DeleteDA
 */

public class DeleteDA extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   int maduan = Integer.parseInt(request.getParameter("maduan"));
	        DeleteDADAO delete = new DeleteDADAO();
	        String error = "Xóa không thành công";
	        
	        try {
	            if (delete.deleteDuan(maduan)) {
	                response.sendRedirect("QuanLyDuAn.jsp");
	            } else {
	                request.setAttribute("error", error);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}

}
