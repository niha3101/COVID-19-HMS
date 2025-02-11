package com.covid.Servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.covid.Dao.UserLoginDao;
import com.covid.Model.User;





@WebServlet("/userlogin")
public class UserLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserLoginDao userLoginDao;

    public void init() {
        userLoginDao = new UserLoginDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String usermail = request.getParameter("mail");
        String password = request.getParameter("password");
        

        User user = new User();
        user.setUserMail(usermail);
        user.setUserPassword(password);
        

        try {
            if(userLoginDao.loginUser(user)==1)
            {
            	Cookie ck=new Cookie("username",usermail);//creating cookie object  
                response.addCookie(ck);
            	 response.sendRedirect("welcome.jsp");
            	
            }
            else if(userLoginDao.loginUser(user)==2)
            {
            	 response.sendRedirect("error.jsp?error=Wrong Credentials");
            }
           
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

       
    }
}
