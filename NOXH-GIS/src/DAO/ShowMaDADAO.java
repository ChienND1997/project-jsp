package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Model.DuAn;
import connect.DBConnect;

public class ShowMaDADAO {
	 public List<DuAn> getListDonviQLTC() throws SQLException{
	     Connection connection = DBConnect.getConnection(); 
	     String sql = "SELECT MaDA from du_an";
	     PreparedStatement ps = connection.prepareCall(sql);
	     ResultSet rs = ps.executeQuery();
	     List<DuAn> list = new ArrayList<>();  
	     while (rs.next()) {
	     		DuAn duan = new DuAn();
				duan.setMaDA(rs.getInt("MaDA"));
				list.add(duan);	        
				}
	     return list;
}
}
