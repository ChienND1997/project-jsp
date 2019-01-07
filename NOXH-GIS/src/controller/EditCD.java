package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.NguoiMua;
import DAO.EditCDDAO;

public class EditCD extends HttpServlet {
	private static final long serialVersionUID = 1L;
       EditCDDAO  edit = new EditCDDAO();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		 String hoten = request.getParameter("hoten");
		 String sdt = request.getParameter("sdt");
		 String cmnd = request.getParameter("cmnd");
		 String tenphong = request.getParameter("tenphong");
		 String diachi = request.getParameter("diachi");
	     NguoiMua nguoimua = new NguoiMua(hoten,sdt,cmnd,tenphong,diachi);
	     String complete = "bạn phải nhập đủ thông tin và không được sửa CMND";
	     try {
	    	 if(edit.edit(cmnd, nguoimua)) {
	    		 response.sendRedirect("QuanLyCongDan.jsp");
	    	 }else {
	    		 request.setAttribute("error",complete);
	    	 }
	     }catch (Exception e) {
			e.printStackTrace();
		}

	}

}
