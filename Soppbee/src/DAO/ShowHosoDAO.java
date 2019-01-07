package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.ChuDauTu;
import Model.HoSoOnline;
import connect.DBConnect;

public class ShowHosoDAO {
	 public List<HoSoOnline> getListHoSo() throws SQLException{
	     Connection connection = DBConnect.getConnection(); 
	     String sql = "SELECT * from ho_so_online";
	     PreparedStatement ps = connection.prepareCall(sql);
	     ResultSet rs = ps.executeQuery();
	     List<HoSoOnline> list = new ArrayList<>();  
	     while (rs.next()) {
	     		HoSoOnline hs = new HoSoOnline();
				hs.setCMND(rs.getInt("CMND"));
				hs.setCongty(rs.getString("congty"));
				hs.setDoituong(rs.getString("doituong"));
				hs.setDuan(rs.getString("duan"));
				hs.setEmail(rs.getString("email"));
				hs.setHoten(rs.getString("hoten"));
				hs.setNghenghiep(rs.getString("nghenghiep"));
				hs.setThunhap(rs.getInt("thunhap"));
				list.add(hs);	        
				}
	     return list;
	 }
}
