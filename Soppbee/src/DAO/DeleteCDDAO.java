package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import connect.DBConnect;

public class DeleteCDDAO {
	   public boolean deleteNguoiMua(String cmnd) throws Exception {
	        String sql = "delete from nguoi_mua where CMND=?";
	        Connection connection = DBConnect.getConnection();
	        PreparedStatement ps = connection.prepareCall(sql);
	        ps.setString(1,cmnd );
	        return  ps.executeUpdate() >0; 
	    }
	  
}
