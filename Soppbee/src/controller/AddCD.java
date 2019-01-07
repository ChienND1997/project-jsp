package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.AddCDDAO;
import Model.NguoiMua;

public class AddCD extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AddCDDAO add = new AddCDDAO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddCD() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String url = "";
		String hoten = request.getParameter("hoten");
		String sdt = request.getParameter("sdt");
		String cmnd = request.getParameter("cmnd");
		String tenphong = request.getParameter("tenphong");
		String diachi = request.getParameter("diachi");
		String tenda = request.getParameter("tenduan");
		int mada = Integer.parseInt(request.getParameter("tenduan"));
		
		String command = request.getParameter("them");
		NguoiMua nguoimua = new NguoiMua();
	
		String complete = "Thêm mới thành công";
		switch (command) {
		case "themmoi":
			nguoimua.setHoTen(hoten);
			nguoimua.setSDT(sdt);
			nguoimua.setCMND(cmnd);
			nguoimua.setTenPhong(tenphong);
			nguoimua.setDiaChi(diachi);
			nguoimua.setTenDA(tenda);
			nguoimua.setMaDA(mada);
			add.insert(nguoimua);	
						
			
			url = "QuanLyCongDan.jsp";
			request.setAttribute("tenda", tenda);
			break;
		}

		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
