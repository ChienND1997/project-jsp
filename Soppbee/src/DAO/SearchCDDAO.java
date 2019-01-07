package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import Model.NguoiMua;
import connect.DBConnect;

public class SearchCDDAO {
	   public List<NguoiMua> searchTen(String hoten) throws Exception {
		   List<NguoiMua> list = new ArrayList<>();
	        String sql = "select * from nguoi_mua where Ho_Ten= '" + hoten + "'";
	        Connection connection = DBConnect.getConnection();
	        PreparedStatement ps = connection.prepareCall(sql);
	        ps.setString(1, hoten);
	        ps.execute();
	        return list ; 
	    }
	/*   public static void main(String[] args) {
		SearchCDDAO a = new SearchCDDAO();
		try {
			if(a.searchTen("Thu")) {
				System.out.println("done");
			}else {
				System.out.println("sai r");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/
}
