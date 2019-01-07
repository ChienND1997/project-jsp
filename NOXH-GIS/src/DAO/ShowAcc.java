package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import Model.DuAn;
import Model.Login;
import connect.DBConnect;

public class ShowAcc {
	 public Login show(String username) {
		 	Login login = null;
		 	  String sql = "SELECT * FROM login where IDR = '" +username+"'";
	        Connection connection = DBConnect.getConnection();
	       
	        
	        try {
	        	 Statement statement =  connection.createStatement();
	 	        ResultSet resultSet = statement.executeQuery(sql);
	        	while(resultSet.next()) {
					 login= new  Login();
					login.setAccount(resultSet.getString("Acc"));
				
				}
	           
	        } catch (SQLException ex) {
	            Logger.getLogger(RegisterDAO.class.getName()).log(Level.SEVERE, null, ex);
	        }
	    	return login;
	      
	    }
}
