package goutamg.kanwiz.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	public  Connection getConnection() throws Exception {
		
		   Class.forName("com.mysql.jdbc.Driver");  
		   //Local
		    Connection con = DriverManager.getConnection(  "jdbc:mysql://localhost:3306/test","root",""); 
		   
		   // Prod
		   //Connection con = DriverManager.getConnection(  "jdbc:mysql://localhost:3306/goutamgh_test","goutamgh_admin","kanwiz@1981"); 
		   
		   return con;
	}

}
