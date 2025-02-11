package com.covid.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.covid.Connector.ConnectionHandler;
import com.covid.Model.User;

public class UserDao {

	public int registerUser(User user) throws ClassNotFoundException {

		System.out.println("hi");
		int result = 0;

		try {
			Connection con = ConnectionHandler.getConnection();

			// Step 2:Create a statement using connection object
			PreparedStatement pst1 = con.prepareStatement("select max(uid)+1 from users");
			ResultSet rs1 = pst1.executeQuery();
			int user_id = 0;
			while (rs1.next()) {
				user_id = rs1.getInt(1);
			}
			
			PreparedStatement pst2 = con.prepareStatement("select * from users");
			ResultSet rs2 = pst2.executeQuery();

			while (rs2.next()) {
				
				if(user.getUserMail().equalsIgnoreCase(rs2.getString(3)))
				{
					result=2;
				}
				
				
			}
			
			
			if(result==0)
			{
			
			
			PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO users VALUES(?,?, ?, ?,?,?)");
			preparedStatement.setInt(1, user_id);
			preparedStatement.setString(2, user.getUserName());
			preparedStatement.setString(3, user.getUserMail());
			preparedStatement.setString(4, user.getUserAddress());
			preparedStatement.setString(5, user.getUserMobileNumber());
			preparedStatement.setString(6, user.getUserPassword());

			// Step 3: Execute the query or update query
			result = preparedStatement.executeUpdate();

			if (result == 1) {
				System.out.println("success");
			}
			}

		} catch (Exception e) {
			
			e.printStackTrace();
		}

		return result;
	}

}
