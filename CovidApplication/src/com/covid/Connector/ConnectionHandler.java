package com.covid.Connector;



import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.sql.*;
import java.util.*;

public class ConnectionHandler {

	
	
    
	private static Connection con=null;

    //ENSURE YOU DON'T CHANGE THE BELOW CODE WHEN YOU SUBMIT
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
	    try{
			
	    	Class.forName("com.mysql.jdbc.Driver");
			
			
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/covid","root","satyasuryavenkat");
	        
	    }
	    catch(SQLException e){
	        e.printStackTrace();
	    }
		return con;	
	}
}

