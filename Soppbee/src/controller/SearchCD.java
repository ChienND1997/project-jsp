package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DeleteCDDAO;
import DAO.SearchCDDAO;
import Model.NguoiMua;

/**
 * Servlet implementation class SearchCD
 */

public class SearchCD extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    SearchCDDAO search = new SearchCDDAO();

    public SearchCD() {
        super();
        // TODO Auto-generated constructor stub
    }

	

/*	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   String hoten = request.getParameter("timkiemten");
		   String timkiem = request.getParameter("timkiem");
	        SearchCDDAO search = new SearchCDDAO();
	        String error = "tim kiem không thành công";
	        String url ="";
	        NguoiMua nguoimua = new NguoiMua();
	        switch(timkiem) {
	        case "timkiem":
	        	nguoimua.setHoTen(hoten);
	        	if(search.searchTen(hoten) == true){
	        		url = "QuanLyCongDan.jsp";
	        	
	        	}
	        	break;
	        }
	        
	        RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
	}*/

}
