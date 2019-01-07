package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import Model.DoiTuong;
import Model.HoSoOnline;
import Model.NguoiMua;
import connect.DBConnect;

public class AddHoSoDAO {
	 public boolean insert(HoSoOnline hs) {
		    //NguoiMua nguoimua = new NguoiMua();
	        Connection connection = DBConnect.getConnection();
	        String sql = "INSERT INTO ho_so_online(CMND,hoten,email,nghenghiep,doituong,duan,congty) VALUES(?,?,?,?,?,?,?)" ;
	  
	        try {
	            PreparedStatement ps = connection.prepareCall(sql);      
	            ps.setInt(1, hs.getCMND());
	            ps.setString(2, hs.getHoten());
	            ps.setString(3, hs.getEmail());
	            ps.setString(4, hs.getNghenghiep());
	            
	            ps.setString(5, hs.getDoituong());
	            ps.setString(6, hs.getDuan());
	            ps.setString(7, hs.getCongty());
	            ps.executeUpdate();
	            return true;
	        } catch (SQLException ex) {
	            Logger.getLogger(RegisterDAO.class.getName()).log(Level.SEVERE, null, ex);
	        }
	        return false;
	    }
}
