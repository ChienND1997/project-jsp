package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import Model.Login;
import connect.DBConnect;

public class UpdatePassword {
	  public boolean insertUser(Login login) {
	        Connection connection = DBConnect.getConnection();
	        String sql = "UPDATE INTO Login(Pass) VALUES(?)";
	        try {
	            PreparedStatement ps = connection.prepareCall(sql);
	            ps.setString(1, login.getAccount());
	        
	            ps.executeUpdate();
	            return true;
	        } catch (SQLException ex) {
	            Logger.getLogger(RegisterDAO.class.getName()).log(Level.SEVERE, null, ex);
	        }
	        return false;
	    }
}
