package com.covid.Model;

import java.io.Serializable;

public class User implements Serializable {
    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    private String UserName;
    private String UserMail;
    private String UserAddress;
    private String UserMobileNumber;
    private String UserPassword;
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getUserMail() {
		return UserMail;
	}
	public void setUserMail(String userMail) {
		UserMail = userMail;
	}
	public String getUserAddress() {
		return UserAddress;
	}
	public void setUserAddress(String userAddress) {
		UserAddress = userAddress;
	}
	public String getUserMobileNumber() {
		return UserMobileNumber;
	}
	public void setUserMobileNumber(String userMobileNumber) {
		UserMobileNumber = userMobileNumber;
	}
	public String getUserPassword() {
		return UserPassword;
	}
	public void setUserPassword(String userPassword) {
		UserPassword = userPassword;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
    
    
    
}