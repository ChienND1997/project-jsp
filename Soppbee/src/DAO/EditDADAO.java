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

public class EditDADAO {
	 public boolean edit(int maduan,DuAn duan) {
			
	        Connection connection = DBConnect.getConnection();
	        String sql = "UPDATE du_an set TenDA = ?,ViTriDA = ?,DienTich = ?,MatDoXD = ?,TongSoToanha = ?,GiaiDoan = ? where MaDa = '" + maduan +"'";
	        try {
	            PreparedStatement ps = connection.prepareCall(sql);
	       
	            ps.setString(1, duan.getTenDA());
	            ps.setString(2, duan.getVitriDA());
	            ps.setInt(3,duan.getDienTich());
	            ps.setInt(4,duan.getMaDoXD());
	            ps.setInt(5, duan.getTongSoToaNha());
	            ps.setInt(6, duan.getGiaiDoan());
	            ps.executeUpdate();
	            return true;
	        } catch (SQLException ex) {
	            Logger.getLogger(RegisterDAO.class.getName()).log(Level.SEVERE, null, ex);
	        }
	        return false;
	    }
	 public DuAn show(int maduan) {
		 	DuAn duan = null;
		 	  String sql = "SELECT * FROM du_an where MaDA = '" +maduan+"'";
	        Connection connection = DBConnect.getConnection();
	       
	        System.out.println(maduan);     
	        try {
	        	 Statement statement =  connection.createStatement();
	 	        ResultSet resultSet = statement.executeQuery(sql);
	        	while(resultSet.next()) {
					 duan= new  DuAn();
					duan.setMaDA(resultSet.getInt("MaDA"));
					duan.setTenDA(resultSet.getString("TenDA"));
					duan.setDienTich(resultSet.getInt("DienTich"));
					duan.setMaDoXD(resultSet.getInt("MatDoXD"));
					duan.setVitriDA(resultSet.getString("ViTriDA"));
					duan.setTongSoToaNha(resultSet.getInt("TongSoToaNha"));
					duan.setGiaiDoan(resultSet.getInt("GiaiDoan"));
				
				}
	           
	        } catch (SQLException ex) {
	            Logger.getLogger(RegisterDAO.class.getName()).log(Level.SEVERE, null, ex);
	        }
	    	return duan;
	      
	    }

}
