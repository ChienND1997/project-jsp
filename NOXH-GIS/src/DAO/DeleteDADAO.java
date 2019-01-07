package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import connect.DBConnect;

public class DeleteDADAO {
	 public boolean deleteDuan(int maduan) throws Exception {
	        String sql = "delete  from du_an where MaDA=?";
	        Connection connection = DBConnect.getConnection();
	        PreparedStatement ps = connection.prepareCall(sql);
	        ps.setInt(1,maduan);
	        return  ps.executeUpdate() >0; 
	    }
	
}
