package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.EditDADAO;
import Model.DuAn;
import Model.NguoiMua;


public class EditDA extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	EditDADAO edit = new EditDADAO();
    public EditDA() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	

		protected void doPost(HttpServletRequest request, HttpServletResponse response) 
				throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			int maduan = Integer.parseInt(request.getParameter("maduan"));
			 String hoten = request.getParameter("hoten");
			 String tenduan = request.getParameter("tenduan");
			 String vitri = request.getParameter("vitri");
			 
			 
			 int dientich = Integer.parseInt(request.getParameter("dientich"));
			 int toanha = Integer.parseInt(request.getParameter("toanha"));
			 int matdo = Integer.parseInt(request.getParameter("matdo"));
			 int giaidoan = Integer.parseInt(request.getParameter("giaidoan"));
		     DuAn duan = new DuAn(tenduan,vitri,dientich,toanha,matdo,giaidoan);
		     String complete = "bạn phải nhập đủ thông tin và không được sửa CMND";
		     try {
		    	 if(edit.edit(maduan, duan)) {
		    		 response.sendRedirect("QuanLyDuAn.jsp");
		    	 }else {
		    		 request.setAttribute("error",complete);
		    	 }
		     }catch (Exception e) {
				e.printStackTrace();
			}

		
		
	}

}
