package controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AddDADAO;
import Model.DuAn;


public class AddDA extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AddDADAO add = new AddDADAO();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String command = request.getParameter("them");
		int dientich = Integer.parseInt(request.getParameter("dientich"));		
		int tongtoanha = Integer.parseInt(request.getParameter("toanha"));		
		int matdo = Integer.parseInt(request.getParameter("matdoxd"));
		int maduan = Integer.parseInt(request.getParameter("maduan"));		
		float kinhdo = Float.parseFloat(request.getParameter("kinhdo"));
		float vd = Float.parseFloat(request.getParameter("vido"));
		int canhoxd = Integer.parseInt(request.getParameter("socanho"));
		int chudautuxd = Integer.parseInt(request.getParameter("chudautu"));
		int dvtc = Integer.parseInt(request.getParameter("dvthicong"));
		int dvtn = Integer.parseInt(request.getParameter("dvtainguyen"));
		int nbd = Integer.parseInt(request.getParameter("nambatdau"));
		int nht = Integer.parseInt(request.getParameter("namhoanthanh"));
		int vdt = Integer.parseInt(request.getParameter("vondautu"));
		int giab = Integer.parseInt(request.getParameter("giaban"));
		int giat = Integer.parseInt(request.getParameter("giathue"));
		int taichinh = Integer.parseInt(request.getParameter("mataichinh"));
		int giaidoann = Integer.parseInt(request.getParameter("giaidoan"));
		int dtcanho = Integer.parseInt(request.getParameter("dtcanho"));
		String tenCDT = request.getParameter("tencdt");
		int madvtc = Integer.parseInt(request.getParameter("madvtc"));
		String url ="";
		DuAn duan = new DuAn();
		switch(command) {
			case "themmoi":
		
				duan.setMaDA(maduan);
				duan.setTenDA(request.getParameter("tenduan"));
				duan.setVitriDA(request.getParameter("vitri"));
				duan.setMaDVTC(madvtc);
				duan.setTenCDT(tenCDT);
				duan.setKinhDo(kinhdo);
				duan.setViDo(vd);
				duan.setMaCDT(chudautuxd);
				duan.setMaDVTN(dvtn);
				duan.setDVTC(dvtc);
				duan.setDienTich(dientich);
				duan.setTongSoToaNha(tongtoanha);
				duan.setMaDoXD(matdo);
				duan.setNamBatDau(nbd);
				duan.setNamHoanThanh(nht);
				duan.setTongVonDauTu(vdt);
				duan.setGiaBan(giab);
				duan.setGiaThue(giat);
				duan.setGiaiDoan(giaidoann);
				duan.setTongSoCanHo(canhoxd);
				duan.setMaTaiChinh(taichinh);
				duan.setDienTichCanHo(dtcanho);
				add.insert(duan);
				url = "QuanLyDuAn.jsp";
				break;
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
