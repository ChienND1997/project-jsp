package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.NguoiMua;
import connect.DBConnect;
import Model.DuAn;
public class ShowCDDAO {
	/*public NguoiMua showCD(int maNM) {
		Connection connection = DBConnect.getConnection();
		String sql = "SELECT * FROM nguoi_mua where MaNM = '" + maNM + "'";
		NguoiMua nguoimua = new NguoiMua();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				nguoimua.setMaNM(rs.getInt("MaNM"));
				nguoimua.setMaDA(rs.getInt("MaDA"));
				nguoimua.setMaDT(rs.getInt("MaDT"));
				nguoimua.setHoTen(rs.getString("Ho_Ten"));
				nguoimua.setSDT(rs.getString("SDT"));
				nguoimua.setCMND(rs.getString("CMND"));
				nguoimua.setTenPhong(rs.getString("TenPhong"));
				nguoimua.setDiaChi(rs.getString("Dia_Chi"));
				
			}
		} catch (SQLException ex) {
			Logger.getLogger(RegisterDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return nguoimua;
	}*/
	/*public static void main(String[] args) {
		ShowCDDAO show = new ShowCDDAO();
		NguoiMua a =show.showCD(1);
		
			System.out.println(a.getCMND() +  "==========="+ a.getHoTen());
		
	}*/
	 
	 public List<NguoiMua> getListNguoimua() throws SQLException{
	        Connection connection = DBConnect.getConnection(); 
	        //String sql = "select * from nguoi_mua";
	        String sql = "SELECT nguoi_mua.SDT,nguoi_mua.MaNM,nguoi_mua.Ho_Ten,nguoi_mua.CMND,nguoi_mua.MaDA,nguoi_mua.TenPhong,nguoi_mua.Dia_Chi,du_an.TenDA "
	        		+ "FROM nguoi_mua INNER JOIN du_an WHERE nguoi_mua.MaDA= du_an.MaDA;";
	        PreparedStatement ps = connection.prepareCall(sql);
	        ResultSet rs = ps.executeQuery();
	        List<NguoiMua> list = new ArrayList<>();  
	       /* List<DuAn> list1 = new ArrayList<>(); */
	        while (rs.next()) {
	        	//DuAn duAn = new DuAn();
	        	
	        	NguoiMua nguoimua = new NguoiMua();
	            nguoimua.setMaNM(rs.getInt("MaNM"));
	            nguoimua.setMaDA(rs.getInt("MaDA"));
	            nguoimua.setTenDA(rs.getString("TenDA"));
				nguoimua.setHoTen(rs.getString("Ho_Ten"));
				nguoimua.setSDT(rs.getString("SDT"));
				nguoimua.setCMND(rs.getString("CMND"));		
				nguoimua.setTenPhong(rs.getString("TenPhong"));
				nguoimua.setDiaChi(rs.getString("Dia_Chi"));
				list.add(nguoimua);
				//list.add(duAn);
	        }
	        return list;
	    }
/*	 public List<DuAn> getListDuAn() throws SQLException{
	        Connection connection = DBConnect.getConnection(); 
	        String sql = "SELECT TenDA from du_an";
	        PreparedStatement ps = connection.prepareCall(sql);
	        ResultSet rs = ps.executeQuery();
	        List<DuAn> list = new ArrayList<>();  
	        while (rs.next()) {
	        	DuAn duan = new DuAn();
				duan.setTenDA(rs.getNString("TenDA"));
				list.add(duan);	        
				}
	        return list;
	    }*/
	/* public static void main(String[] args) {
		 ShowCDDAO a = new ShowCDDAO();
		try {
			for(NguoiMua c : a.getListNguoimua()) {
				System.out.println(c.getHoTen() + "======"+ c.getDiaChi() + "=======" +c.getCMND() + c.getMaDA());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
	}*/
}
