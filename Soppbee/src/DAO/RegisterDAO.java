package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import connect.DBConnect;
import Model.Login;
public class RegisterDAO {
	public static boolean checkAccount(String account) {
		Connection conn = DBConnect.getConnection();
		String sql = "SELECT * FROM Login WHERE Acc = '" + account + "'" ;
		PreparedStatement ps ;
		try {
			ps = conn.prepareCall(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				conn.close();
				return true;
			}
		} catch (SQLException e) {
		
			Logger.getLogger(RegisterDAO.class.getName()).log(Level.SEVERE, null, e);
		}
		
		return false;
	}
/*	public static void main(String[] args) {
		System.out.println(checkAccount("Admin123"));
	}*/
	// phương thức thêm tài khoản
    public boolean insertUser(Login login) {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO Login(Acc,Pass) VALUES(?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, login.getAccount());
            ps.setString(2, login.getPassword());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(RegisterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    // kiểm tra đăng nhập
    public Login login(String account, String password) {
        Connection con = DBConnect.getConnection();
        String sql = "select * from Login where Acc='" + account + "' and Pass='" + password + "'"; 
        try {
        	 PreparedStatement ps=  con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Login u = new Login();
                u.setAccount(rs.getString("Acc"));
                u.setPassword(rs.getString("Pass"));
                u.setIDR(rs.getLong("IDR"));
                con.close();
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
/*    public static void main(String[] args) {
		 
    	RegisterDAO rd = new RegisterDAO();
    	
    	Login lg =rd.login("Admin", "123456");
    	
    	System.out.println(lg.getAccount()+" - "+lg.getPassword());
	}*/

    
    
}

