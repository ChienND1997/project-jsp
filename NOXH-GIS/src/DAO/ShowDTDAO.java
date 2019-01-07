package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.DoiTuong;
import connect.DBConnect;

public class ShowDTDAO {
	 public List<DoiTuong> getListDT() throws SQLException{
	        Connection connection = DBConnect.getConnection(); 
	        String sql = "SELECT * from doi_tuong";
	        PreparedStatement ps = connection.prepareCall(sql);
	        ResultSet rs = ps.executeQuery();
	        List<DoiTuong> list = new ArrayList<>();  
	        while (rs.next()) {
	        	DoiTuong dt = new DoiTuong();
	        	dt.setTenDT(rs.getString("TenDT"));
				list.add(dt);	        
				}
	        return list;
	    }
}
