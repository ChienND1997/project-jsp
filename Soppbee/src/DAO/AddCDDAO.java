package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.DuAn;
import Model.NguoiMua;
import connect.DBConnect;

public class AddCDDAO {
	 public boolean insert(NguoiMua nguoimua) {
		    //NguoiMua nguoimua = new NguoiMua();
	        Connection connection = DBConnect.getConnection();
	        String sql = "INSERT INTO nguoi_mua(Ho_Ten,SDT,CMND,TenPhong,Dia_Chi,MaDA) VALUES(?,?,?,?,?,?)" ;
	  
	        try {
	            PreparedStatement ps = connection.prepareCall(sql);      
	            ps.setNString(1, nguoimua.getHoTen());
	            ps.setString(2,nguoimua.getSDT());
	            ps.setString(3,nguoimua.getCMND());
	            ps.setString(4, nguoimua.getTenPhong());
	            ps.setNString(5, nguoimua.getDiaChi());            
	            ps.setInt(6, nguoimua.getMaDA());
	            ps.executeUpdate();
	            return true;
	        } catch (SQLException ex) {
	            Logger.getLogger(RegisterDAO.class.getName()).log(Level.SEVERE, null, ex);
	        }
	        return false;
	    }
	 	 public List<NguoiMua> getListDuAn() throws SQLException{
     Connection connection = DBConnect.getConnection(); 
     String sql = "SELECT MaDA,TenDA from du_an";
     PreparedStatement ps = connection.prepareCall(sql);
     ResultSet rs = ps.executeQuery();
     List<NguoiMua> list = new ArrayList<>();  
     while (rs.next()) {
     		NguoiMua nguoimua = new NguoiMua();
			nguoimua.setTenDA(rs.getNString("TenDA"));
			nguoimua.setMaDA(rs.getInt("MaDA"));
			list.add(nguoimua);	        
			}
     return list;
 }
	 
	/* public static void main(String[] args) {
		 AddCDDAO add = new AddCDDAO();
		System.out.println(add.insert());
	}*/
}
