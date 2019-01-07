package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import Model.ChuDauTu;
import Model.NguoiMua;
import connect.DBConnect;

public class AddCDTDAO {
	 public List<ChuDauTu> getListChudautu() throws SQLException{
	     Connection connection = DBConnect.getConnection(); 
	     String sql = "SELECT MaCDT,TenCDT from chu_dau_tu";
	     PreparedStatement ps = connection.prepareCall(sql);
	     ResultSet rs = ps.executeQuery();
	     List<ChuDauTu> list = new ArrayList<>();  
	     while (rs.next()) {
	     		ChuDauTu cdt = new ChuDauTu();
				cdt.setMaCDT(rs.getInt("MaCDT"));
				cdt.setTenCDT(rs.getString("TenCDT"));
				list.add(cdt);	        
				}
	     return list;
}
}
