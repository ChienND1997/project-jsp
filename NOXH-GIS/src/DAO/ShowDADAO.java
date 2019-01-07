package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import Model.DonViQuanLyTC;
import Model.DuAn;
import Model.TaiChinhDuAn;
import connect.DBConnect;

public class ShowDADAO {
/*	 public boolean insert(DuAn duan) {
		    
	        Connection connection = DBConnect.getConnection();
	        String sql = "INSERT INTO du_an(MaDA,TenDA,ViTriDA,DienTich,TongSoToaNha,MatDoXD)  VALUES(?,?,?,?,?,?)";
	        try {
	            PreparedStatement ps = connection.prepareCall(sql);
	            //ps.setNString(1, nguoimua.getHoTen());
	            ps.setInt(1,duan.getMaDA());
	            ps.setNString(2, duan.getTenDA());
	            ps.setNString(3, duan.getVitriDA());
	            ps.setInt(4, duan.getDienTich());
	            ps.setInt(5, duan.getTongSoToaNha());
	            ps.setInt(6, duan.getMaDoXD());
	            ps.executeUpdate();
	            return true;
	        } catch (SQLException ex) {
	            Logger.getLogger(RegisterDAO.class.getName()).log(Level.SEVERE, null, ex);
	        }
	        return false;
	    }*/
	
	
	 public List<DuAn> getListDuAn() throws SQLException{
	        Connection connection = DBConnect.getConnection(); 
	        String sql = "SELECT * from du_an";
	        PreparedStatement ps = connection.prepareCall(sql);
	        ResultSet rs = ps.executeQuery();
	        List<DuAn> list = new ArrayList<>();  
	        while (rs.next()) {
	        	DuAn duan = new DuAn();
	        	duan.setMaDA(rs.getInt("MaDA"));
				duan.setTenDA(rs.getNString("TenDA"));
				duan.setVitriDA(rs.getNString("ViTriDA"));
				duan.setDienTich(rs.getInt("DienTich"));
				duan.setTongSoToaNha(rs.getInt("TongSoToaNha"));
				duan.setMaDoXD(rs.getInt("MatDoXD"));
				duan.setGiaThue(rs.getInt("GiaThue"));
				duan.setGiaBan(rs.getInt("GiaBan"));
				duan.setNamBatDau(rs.getInt("NamBatDau"));
				list.add(duan);	        
				}
	        return list;
	    }

	 public List<DonViQuanLyTC> getListTaiChinh() throws SQLException{
	        Connection connection = DBConnect.getConnection(); 
	        String sql = "SELECT * from don_vi_quan_ly_tc";
	        PreparedStatement ps = connection.prepareCall(sql);
	        ResultSet rs = ps.executeQuery();
	        List<DonViQuanLyTC> list = new ArrayList<>();  
	        while (rs.next()) {
	        	DonViQuanLyTC tc = new DonViQuanLyTC();
	        	tc.setMaDVTC(rs.getInt("MaDVTC"));
	        	list.add(tc);
				}
	        return list;
	    }
	 
/*	 public static void main(String[] args) {
		 ShowDADAO show = new ShowDADAO();
		try {
			for(DonViQuanLyTC lisst : show.getListTaiChinh()) {
				System.out.println(lisst);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/
	 public List<DuAn> getListDuanTrienKhai() throws SQLException{
	        Connection connection = DBConnect.getConnection(); 
	        String sql = "SELECT * from du_an where GiaiDoan = 3";
	        PreparedStatement ps = connection.prepareCall(sql);
	        ResultSet rs = ps.executeQuery();
	        List<DuAn> list = new ArrayList<>();  
	        while (rs.next()) {
	        	DuAn duan = new DuAn();
	        	duan.setMaDA(rs.getInt("MaDA"));
				duan.setTenDA(rs.getNString("TenDA"));
				duan.setVitriDA(rs.getNString("ViTriDA"));
				duan.setDienTich(rs.getInt("DienTich"));
				duan.setTongSoToaNha(rs.getInt("TongSoToaNha"));
				duan.setMaDoXD(rs.getInt("MatDoXD"));
				duan.setGiaThue(rs.getInt("GiaThue"));
				duan.setGiaBan(rs.getInt("GiaBan"));
				duan.setNamBatDau(rs.getInt("NamBatDau"));
				list.add(duan);	        
				}
	        return list;
	    }
	 public List<DuAn> getListDuanSapHoanThien() throws SQLException{
	        Connection connection = DBConnect.getConnection(); 
	        String sql = "SELECT * from du_an where GiaiDoan = 1";
	        PreparedStatement ps = connection.prepareCall(sql);
	        ResultSet rs = ps.executeQuery();
	        List<DuAn> list = new ArrayList<>();  
	        while (rs.next()) {
	        	DuAn duan = new DuAn();
	        	duan.setMaDA(rs.getInt("MaDA"));
				duan.setTenDA(rs.getNString("TenDA"));
				duan.setVitriDA(rs.getNString("ViTriDA"));
				duan.setDienTich(rs.getInt("DienTich"));
				duan.setTongSoToaNha(rs.getInt("TongSoToaNha"));
				duan.setMaDoXD(rs.getInt("MatDoXD"));
				duan.setGiaThue(rs.getInt("GiaThue"));
				duan.setGiaBan(rs.getInt("GiaBan"));
				duan.setNamBatDau(rs.getInt("NamBatDau"));
				list.add(duan);	        
				}
	        return list;
	    }
	 public List<DuAn> getListDuanDaHoanThanh() throws SQLException{
	        Connection connection = DBConnect.getConnection(); 
	        String sql = "SELECT * from du_an where GiaiDoan = 2";
	        PreparedStatement ps = connection.prepareCall(sql);
	        ResultSet rs = ps.executeQuery();
	        List<DuAn> list = new ArrayList<>();  
	        while (rs.next()) {
	        	DuAn duan = new DuAn();
	        	duan.setMaDA(rs.getInt("MaDA"));
				duan.setTenDA(rs.getNString("TenDA"));
				duan.setVitriDA(rs.getNString("ViTriDA"));
				duan.setDienTich(rs.getInt("DienTich"));
				duan.setTongSoToaNha(rs.getInt("TongSoToaNha"));
				duan.setMaDoXD(rs.getInt("MatDoXD"));
				duan.setGiaThue(rs.getInt("GiaThue"));
				duan.setGiaBan(rs.getInt("GiaBan"));
				duan.setNamBatDau(rs.getInt("NamBatDau"));
				list.add(duan);	        
				}
	        return list;
	    }
}
