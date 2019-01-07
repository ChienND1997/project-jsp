package connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
	private static String DB_URL = "jdbc:mysql://localhost:3306/qlnoxh";
	private static String DB_USER = "root";
	private static String DB_PASS = "123456";
	public static  Connection getConnection() {
		
		Connection conn=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			try {
				conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASS);
				return conn;
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			
		
		
		return conn;
		
	}
		/* private static final String DATABASE_DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		    private static final String DATABASE_URL = "jdbc:sqlserver://chiensqlserver;databaseName=QLNOXH";
		    private static final String USERNAME = "root";
		    private static final String PASSWORD = "123456";
		    private static final String MAX_POOL = "250";

		    // init connection object
		    private Connection connection;
		    // init properties object
		    private Properties properties;

		    // create properties
		    private Properties getProperties() {
		        if (properties == null) {
		            properties = new Properties();
		            properties.setProperty("user", USERNAME);
		            properties.setProperty("password", PASSWORD);
		            properties.setProperty("MaxPooledStatements", MAX_POOL);
		        }
		        return properties;
		    }


		    public Connection connect() {
		        if (connection == null) {
		            try {
		                Class.forName(DATABASE_DRIVER);
		                connection = DriverManager.getConnection(DATABASE_URL, getProperties());
		            } catch (ClassNotFoundException | SQLException e) {
		                e.printStackTrace();
		            }
		        }
		        return connection;
		    }

		  
		    public void disconienect() {
		        if (connection != null) {
		            try {
		                connection.close();
		                connection = null;
		            } catch (SQLException e) {
		                e.printStackTrace();
		            }
		        }
		    }*/
	public static void main(String[] args) {
	
		System.out.println(getConnection());
	}
}

