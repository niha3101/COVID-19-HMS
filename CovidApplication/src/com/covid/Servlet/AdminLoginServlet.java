package com.covid.Servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;





@WebServlet("/adminlogin")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String adminname = request.getParameter("adminname");
        String password = request.getParameter("password");
        

        

        try {
            if(adminname.equals("admin")&& password.equals("admin"))
            {
            	Cookie ck=new Cookie("adminname",adminname);//creating cookie object  
                response.addCookie(ck);
            	 response.sendRedirect("admin.jsp");
            	
            }
            else
            {
            	 response.sendRedirect("error.jsp?error=Wrong Credentials");
            }
           
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

       
    }
}
