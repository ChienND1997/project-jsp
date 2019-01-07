package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import Model.DuAn;
import Model.NguoiMua;
import connect.DBConnect;

public class EditCDDAO {
	 public boolean edit(String cmnd, NguoiMua nguoimua) {
		
	        Connection connection = DBConnect.getConnection();
	        String sql = "UPDATE nguoi_mua set Ho_Ten = ?,SDT = ?,CMND = ?,TenPhong = ?,Dia_Chi = ? where CMND = '" +cmnd+"'";
	        try {
	            PreparedStatement ps = connection.prepareCall(sql);
	            ps.setNString(1, nguoimua.getHoTen());
	            ps.setString(2,nguoimua.getSDT());
	            ps.setString(3,nguoimua.getCMND());
	            ps.setString(4, nguoimua.getTenPhong());
	            ps.setNString(5, nguoimua.getDiaChi());
	            ps.executeUpdate();
	            return true;
	        } catch (SQLException ex) {
	            Logger.getLogger(RegisterDAO.class.getName()).log(Level.SEVERE, null, ex);
	        }
	        return false;
	    }
	/* public static void main(String[] args) {
		EditCDDAO edit = new EditCDDAO();
		System.out.println(edit.edit());
	}*/
	 public NguoiMua show(int cmnd) {
		 	NguoiMua nguoiMua = null;
		 	  String sql = "SELECT * FROM nguoi_mua where CMND = '" +cmnd+"'";
	        Connection connection = DBConnect.getConnection();
	       
	        
	      
	        try {
	        	 Statement statement =  connection.createStatement();
	 	        ResultSet resultSet = statement.executeQuery(sql);
	        	while(resultSet.next()) {
					nguoiMua = new  NguoiMua();
					nguoiMua.setMaNM(resultSet.getInt("MaNM"));
					nguoiMua.setMaDA(resultSet.getInt("MaDA"));
					//nguoiMua.setTenDA(resultSet.getString("TenDA"));
					nguoiMua.setHoTen(resultSet.getString("Ho_Ten"));
					nguoiMua.setSDT(resultSet.getString("SDT"));
					nguoiMua.setCMND(resultSet.getString("CMND"));		
					nguoiMua.setTenPhong(resultSet.getString("TenPhong"));
					nguoiMua.setDiaChi(resultSet.getString("Dia_Chi"));
					
				
				}
	           
	        } catch (SQLException ex) {
	            Logger.getLogger(RegisterDAO.class.getName()).log(Level.SEVERE, null, ex);
	        }
	    	return nguoiMua;
	      
	    }
	
}
