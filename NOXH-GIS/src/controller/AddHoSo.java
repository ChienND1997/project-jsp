package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AddHoSoDAO;
import Model.HoSoOnline;



public class AddHoSo extends HttpServlet {
	private static final long serialVersionUID = 1L;
    AddHoSoDAO hoso = new AddHoSoDAO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String url = "";
		int cmnd = Integer.parseInt(request.getParameter("cmnd"));
		String hoten = request.getParameter("hoten");
		String email = request.getParameter("email");
		String nghenghiep = request.getParameter("nghenghiep");
		String congty = request.getParameter("congty");
		String doituong = request.getParameter("doituong");
		String duan = request.getParameter("duan");
		int thunhap =Integer.parseInt(request.getParameter("thunhap")) ;
	
		String command = request.getParameter("them");
		HoSoOnline hs = new HoSoOnline();
	
		String complete = "Thêm mới thành công";
		switch (command) {
		case "them":
			hs.setCMND(cmnd);
			hs.setHoten(hoten);
			hs.setDoituong(doituong);
			hs.setEmail(email);
			hs.setThunhap(thunhap);
			hs.setCongty(congty);
			hs.setNghenghiep(nghenghiep);
			hs.setDuan(duan);
			hoso.insert(hs);
						
			
			url = "TrangChuCD.jsp";
			
			break;
		}

		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
