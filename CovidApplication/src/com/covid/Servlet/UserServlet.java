package com.covid.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.covid.Dao.UserDao;
import com.covid.Model.User;





@WebServlet("/userreg")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao;

    public void init() {
        userDao = new UserDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String mailid = request.getParameter("mail");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        

        User user = new User();
        user.setUserName(username);
        user.setUserMail(mailid);
        user.setUserMobileNumber(mobile);
        user.setUserAddress(address);
        user.setUserPassword(password);
        

        try {
        	if(userDao.registerUser(user)==1)
            {
            	 response.sendRedirect("login.jsp");
            	
            }
            else if(userDao.registerUser(user)==2)
            {
            	 response.sendRedirect("error.jsp?error=User with this Mail Id Already Exists");
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        
    }
}