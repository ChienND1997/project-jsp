package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.EditCDDAO;
import Model.NguoiMua;

/**
 * Servlet implementation class Show_editCD
 */
@WebServlet("/Show_editCD")
public class Show_editCD extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Show_editCD() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cmnd = Integer.parseInt(request.getParameter("idcd")) ;
		System.out.println(cmnd);
		EditCDDAO cddao = new EditCDDAO();
		NguoiMua nguoiMua = cddao.show(cmnd);	
		request.setAttribute("nguoiMua", nguoiMua);
		RequestDispatcher rd = request.getRequestDispatcher("SuaCongDan.jsp");
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
