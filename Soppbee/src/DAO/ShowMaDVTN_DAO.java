package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.ChuDauTu;
import Model.DonViQuanLyTN;
import connect.DBConnect;

public class ShowMaDVTN_DAO {
	 public List<DonViQuanLyTN> getListDonviQLTN() throws SQLException{
	     Connection connection = DBConnect.getConnection(); 
	     String sql = "SELECT MaDVTN from don_vi_quan_ly_tn";
	     PreparedStatement ps = connection.prepareCall(sql);
	     ResultSet rs = ps.executeQuery();
	     List<DonViQuanLyTN> list = new ArrayList<>();  
	     while (rs.next()) {
	     		DonViQuanLyTN ql = new DonViQuanLyTN();
				ql.setMaDVTN(rs.getInt("MaDVTN"));
				list.add(ql);	        
				}
	     return list;
}
}
