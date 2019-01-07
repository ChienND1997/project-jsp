package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import Model.DuAn;
import connect.DBConnect;

public class AddDADAO {
	 public boolean insert(DuAn duan) {
		    
	        Connection connection = DBConnect.getConnection();
	        String sql = "INSERT INTO du_an(MaDA,TenDA,ViTriDA,KinhDo,ViDo,MaCDT,MaDVTN,MaDVTC,DienTich,MatDoXD,TongVonDauTu,NamBatDau,NamHoanThanh,TongSoToaNha,TongSoCanHo,GiaBan,GiaThue,GiaiDoan,MaTaiChinh,DienTichCanHo)  VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	        try {
	            PreparedStatement ps = connection.prepareCall(sql);
	            //ps.setNString(1, nguoimua.getHoTen());
	            ps.setInt(1,duan.getMaDA());
	            ps.setNString(2, duan.getTenDA());
	            ps.setNString(3, duan.getVitriDA());
	            ps.setFloat(4, duan.getKinhDo());
	            ps.setFloat(5, duan.getViDo());
	            ps.setInt(6,duan.getMaCDT());
	            ps.setInt(7, duan.getMaDVTN());
	            ps.setInt(8, duan.getDVTC());
	            ps.setInt(9, duan.getDienTich());
	            ps.setInt(10, duan.getMaDoXD());
	            ps.setInt(11, duan.getTongVonDauTu());
	            ps.setInt(12, duan.getNamBatDau());
	            ps.setInt(13, duan.getNamHoanThanh());
	            ps.setInt(14, duan.getTongSoToaNha());
	            ps.setInt(15, duan.getTongSoCanHo());
	            
	            ps.setInt(16, duan.getGiaBan());
	            ps.setInt(17, duan.getGiaThue());
	            ps.setInt(18, duan.getGiaiDoan());
	            ps.setInt(19, duan.getMaTaiChinh());
	            ps.setInt(20, duan.getDienTichCanHo());
	            ps.executeUpdate();
	            return true;
	        } catch (SQLException ex) {
	            Logger.getLogger(RegisterDAO.class.getName()).log(Level.SEVERE, null, ex);
	        }
	        return false;
	    }
	 
}
	
