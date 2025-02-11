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
   <a href="viewbookings.jsp"> 
  <button type="submit" class="btn btn-success">View Bookings</button>
  </a>
  <a href="index.jsp"> 
  <button type="submit" class="btn btn-success">Logout</button>
  </a>
  
  
  
  
<div class="container">

  <h2 align="center" style="margin-bottom:50px" >Hospital CMS form</h2>
  <form class="form-horizontal" onSubmit="add()" action="admin.jsp" method="post">
  
  	 <div class="form-group">
      <label class="control-label col-sm-2" for="hname">Hospital Name:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="hname" placeholder="Enter Hospital Name" name="hname" required>
      </div>
    </div>
    
  
    <div class="form-group">
      <label class="control-label col-sm-2" for="diseasedsc">Hospital Address:</label>
      <div class="col-sm-10">
        <textarea class="form-control" rows="6" id="diseasedsc" placeholder="Enter Hospital Address" name="haddress" required></textarea>
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="hnumber" >Hospital Phone Number:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" minlength="10" maxlength="10" id="hnumber" placeholder="Enter Hospital Phone Number" name="hnumber" required>
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="hbeds">Beds Available:</label>
      <div class="col-sm-10">
        <input type="number" class="form-control" id="hbeds" placeholder="Enter Beds Available" name="hbeds" required>
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="hambulance">Ambulance Availability:</label>
      <div class="col-sm-10">
         <input type="text" class="form-control" id="hambulance" placeholder="Enter Ambulance Availability" name="hambulance" required>
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="keys">Cost:</label>
      <div class="col-sm-10">          
        <input type="number" class="form-control" id="cost" placeholder="Enter Keywords" name="cost" required>
      </div>
    </div>
    
    
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-success">Add</button>
      </div>
    </div>
    
   
  
  </form>
</div>
  
  
  </div>
  
 <script>
 

 function add(){
	 
	
	 alert("Successfully Added to Database");
	 

	 
	 <%
	 Connection con = ConnectionHandler.getConnection();

		PreparedStatement ps = null;
	 String hname= request.getParameter("hname");
	 String address = request.getParameter("haddress");
	 String mobile = request.getParameter("hnumber");
	 String beds = request.getParameter("hbeds");
	 String ambulance = request.getParameter("hambulance");
	 String cost = request.getParameter("cost");
	 
	 if(hname!=null && address!=null)
	 {
		 
	 ps = con.prepareStatement("INSERT INTO hospital(hname,haddress,hnumber,hbeds,hambulance,cost) VALUES(?,?,?,?,?,?)");

		
	 ps.setString(1,hname);
	 ps.setString(2, address);
	 ps.setString(3,mobile);
	 ps.setString(4,beds);
	 ps.setString(5,ambulance);
	 ps.setString(6,cost);
	
	 
	 int result;


	 // Step 3: Execute the query or update query
	 result = ps.executeUpdate();
	 }

	 %>
	 
	
		
		
		 
	 
	 
	 
	 
	 
	 
	 
	 
 }
 

 
 
 
 
 
 
 
 </script>
  
  
  
  
  
  
  
<%

  }
  %>


</body>
</html>