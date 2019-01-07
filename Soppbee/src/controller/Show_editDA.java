package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.EditCDDAO;
import DAO.EditDADAO;
import Model.DuAn;
import Model.NguoiMua;

/**
 * Servlet implementation class Show_editDA
 */
@WebServlet("/Show_editDA")
public class Show_editDA extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Show_editDA() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int maduan = Integer.parseInt(request.getParameter("maduan")) ;
		System.out.println(maduan);
		EditDADAO dadao = new EditDADAO();
		DuAn duan = dadao.show(maduan);	
		request.setAttribute("duan", duan);
		RequestDispatcher rd = request.getRequestDispatcher("SuaDuAn.jsp");
		rd.forward(request, response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
