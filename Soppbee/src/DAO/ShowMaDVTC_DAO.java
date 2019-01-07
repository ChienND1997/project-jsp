package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.DonViQuanLyTC;
import Model.DonViQuanLyTN;
import connect.DBConnect;

public class ShowMaDVTC_DAO {
	 public List<DonViQuanLyTC> getListDonviQLTC() throws SQLException{
	     Connection connection = DBConnect.getConnection(); 
	     String sql = "SELECT MaDVTC from don_vi_quan_ly_tc";
	     PreparedStatement ps = connection.prepareCall(sql);
	     ResultSet rs = ps.executeQuery();
	     List<DonViQuanLyTC> list = new ArrayList<>();  
	     while (rs.next()) {
	     		DonViQuanLyTC ql = new DonViQuanLyTC();
				ql.setMaDVTC(rs.getInt("MaDVTC"));
				list.add(ql);	        
				}
	     return list;
}
}
