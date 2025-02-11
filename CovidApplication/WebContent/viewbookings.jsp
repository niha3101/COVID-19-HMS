<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.covid.Connector.ConnectionHandler"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
</head>
<body>


  <% 
    String cvalue="";
        		
    String cname="";
 	try
 	{
	Cookie[] my = request.getCookies();
	
 	
	for(int i=0;i<my.length;i++)
		{
		cvalue = my[i].getValue();
		 cname=my[i].getName();
		//System.out.println(name);
		}
		if(cname.equals("adminname"))
		session.setAttribute("admin",cvalue); 
		else
		cvalue="";
		
		
		
		//System.out.println(cname);
	
 	}
    catch(Exception e)
    {
    	System.out.println(cvalue);
    }

  %>
  
  
   <%
  if(cvalue.equals(""))
  {
  %>
 
<div class="container">

  <h2 align="center" style="margin-bottom:50px" >Admin Login </h2>
  <form class="form-horizontal" action="<%= request.getContextPath() %>/adminlogin" method="post">
  
  	 <div class="form-group">
      <label class="control-label col-sm-2" for="adminname">Name:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="adminname" placeholder="Enter Name" name="adminname">
      </div>
    </div>
    
  

    
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Password:</label>
      <div class="col-sm-10">          
        <input type="password" class="form-control" id="pwd" placeholder="Enter Password" name="password">
      </div>
    </div>
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <div class="checkbox">
          <label><input type="checkbox" name="remember"> Remember me</label>
        </div>
      </div>
    </div>
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-success">Login</button>
      </div>
    </div>
  
  </form>
</div>


<%
  }
  else{
  %>
  
  
  
<div align="center">
  <h3>Hello ${admin}</h3>
   <a href="admin.jsp"> 
  <button type="submit" class="btn btn-success">Home</button>
  </a>
  <a href="index.jsp"> 
  <button type="submit" class="btn btn-success">Logout</button>
  </a>
  
  
  
  
<div class="container">

 <h2>Bookings</h2>
             
  <table class="table table-dark table-hover">
    <thead>
      <tr>
        <th>Id</th>
        <th>UserMail</th>
        <th>Hospital Id</th>
        <th>Hospital Name</th>
        <th>Beds</th>
      </tr>
    </thead>
    
<%

Statement statement = null;
ResultSet resultSet = null;

PreparedStatement ps = null;
ResultSet rs = null;

Connection con = ConnectionHandler.getConnection();

statement=con.createStatement();

String sql ="select * from bookings";
resultSet = statement.executeQuery(sql);

int total=0;

while(resultSet.next()){
	

	total=total+Integer.parseInt(resultSet.getString("hbeds"));


%>
    <tbody>
      <tr>
        <td><%=resultSet.getString("bid") %></td>
        <td><%=resultSet.getString("usermail") %></td>
        <td><%=resultSet.getString("hid") %></td>
         <td><%=resultSet.getString("hname") %></td>
           <td><%=resultSet.getString("hbeds") %></td>
      </tr>

    </tbody>
    
 <%
}
 %>
  </table>
</div>




 <h2>Total Beds Booked : <%=total %></h2>
</div>
  
 
 
 
 

  
  
  
  
  
  
  
<%

  }
  %>


</body>
</html>