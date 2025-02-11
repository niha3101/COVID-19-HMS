package com.covid.Dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.covid.Connector.ConnectionHandler;
import com.covid.Model.User;


public class UserLoginDao {

    public int loginUser(User user) throws ClassNotFoundException {
   
    	System.out.println("hi");
       
        int f=2;
        try {
        	Connection con=ConnectionHandler.getConnection();

            // Step 2:Create a statement using connection object
        	PreparedStatement pst1 = con.prepareStatement("select * from users");
            ResultSet rs = pst1.executeQuery();
            
            while(rs.next())
            {
                //System.out.println("cc");
                if( rs.getString(3).equals(user.getUserMail()) && rs.getString(6).equals(user.getUserPassword()) )
                {
                	f=1;
                }
               
                
            }
           
            //System.out.println(user.getUserMail()+" "+user.getUserPassword());
            
           

        } catch (Exception e) {
            // process sql exception
           e.printStackTrace();
        }
       
        return f;
    }

   
}
