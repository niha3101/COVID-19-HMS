<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.covid.Connector.ConnectionHandler"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Covid HelpLine</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 
  
  <style>

a{
color:white;
font-size:18px;

}


</style>
</head>


<body>
<% 
    String cvalue="";
        		
    String cname="";
    String search="";
 	try
 	{
	Cookie[] my = request.getCookies();
	
 	
	for(int i=0;i<my.length;i++)
		{
		cvalue = my[i].getValue();
		 cname=my[i].getName();
		//System.out.println(name);
		}
		if(cname.equals("username"))
		session.setAttribute("user",cvalue); 
		else
		cvalue="";
		
	
		
		
		System.out.println(cname);
	
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
  <div align="center">
  <h1>You must Login or Register</h1>
  <a href="login.jsp"> 
  <button type="submit" class="btn btn-success">Login</button>
  </a>
  </div>
  <%
  }
  else{
  %>

<nav class="navbar navbar-expand-md navbar-dark bg-primary">
  <a class="navbar-brand" href="#">Covid-HelpLine</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
  
    <ul style="padding-right:45%" class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="welcome.jsp">Home</a>
      </li>
     
      <li class="nav-item">
        <a class="nav-link" href="#">Contact Us</a>
      </li>  
      
      <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Dropdown link
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">Link 1</a>
        <a class="dropdown-item" href="#">Link 2</a>
        <a class="dropdown-item" href="#">Link 3</a>
      </div>
    </li>  
    </ul>

    
    <button class="btn btn-dark" onClick="getLocation()" type="submit">Find Hospital</button>

  
    
     
      
      <div style="padding-right:5px;padding-left:5px;" class="btn-nav"><a class="btn btn-dark btn-small navbar-btn" href="login.jsp">Book a Bed!</a>
      </div>
      
    <div class="btn-nav"><a class="btn btn-dark btn-small navbar-btn" href="index.jsp">Logout</a>
      </div>
      
    
    
    
  </div>  
</nav>
<br>

<%

Statement statement = null;
ResultSet resultSet = null;

PreparedStatement ps = null;
ResultSet rs = null;

Connection con = ConnectionHandler.getConnection();

statement=con.createStatement();

String sql ="select * from hospital";
resultSet = statement.executeQuery(sql);


while(resultSet.next()){
	
	


%>
		
	<div align="center" class="container">
	
	  <div style="width:60%" class="card">
    <div align="center" class="card-body">
    


  <ul class="list-group">
    <li class="list-group-item active">Hospital Name</li>
    <li class="list-group-item"><%=resultSet.getString("hname") %></li>
    <li class="list-group-item active">Hospital Address</li>
    <li class="list-group-item"> <%=resultSet.getString("haddress") %></li>
	<li class="list-group-item active">Phone Number</li>
	<li class="list-group-item"><%=resultSet.getString("hnumber") %></li>
	<li class="list-group-item active">Beds Available</li>
	<li class="list-group-item"><%=resultSet.getString("hbeds") %></li>
	<li class="list-group-item active">Ambulance Availability</li>
    <li class="list-group-item"><%=resultSet.getString("hambulance") %></li>
    <li class="list-group-item active">Cost</li>
    <li class="list-group-item"><%=resultSet.getString("cost") %></li>
  </ul>
  <br>
  <form action="bookbed.jsp" method="post">
  <input type="hidden" name="mail" value="<%=cvalue%>">
   <input type="hidden" name="hname" value="<%=resultSet.getString("hname")%>">
  	<p>Enter Number of Beds Required :
  	<input type="number" name="hbeds" min="1" max="3" required>
  	</p>
   
   
  
  
  <button class="btn btn-dark" onClick="bookbed()" name="hid" value="<%=resultSet.getString("hid") %>" type="submit">Book Now</button>
    </form>
    
    </div>
  </div>
	
	
	</div>
	<br>
	
	  
  <%
}
  
  %>
	
<script>


function bookbed()
{
	
	alert('Booked Successfully');
	
	
	 <%
	 String hname= request.getParameter("hname");
	 String mail = request.getParameter("mail");
	 String hid=request.getParameter("hid");
	 String hbeds=request.getParameter("hbeds");
	
	 
	 if(hid!=null && hname!=null && mail!=null && hbeds!=null)
	 {
	 ps = con.prepareStatement("INSERT INTO bookings(usermail,hid,hname,hbeds) VALUES(?,?,?,?)");

		
	 ps.setString(1,mail);
	 ps.setString(2, hid);
	 ps.setString(3,hname);
	 ps.setString(4,hbeds);
	
	 
	 int result;


	 // Step 3: Execute the query or update query
	 result = ps.executeUpdate();
	 }

	 %>
	
	
	}




function getLocation() {

  
	if (navigator.geolocation) {
	    navigator.geolocation.watchPosition(showPosition);
	  } else {
	    alert("Geolocation is not supported by this browser.");
	  }




}
function showPosition(position) {
	window.location = "map.jsp?lat="+position.coords.latitude+"&lng="+position.coords.longitude;
  
}


</script>	
  
    <%
  }
  %>


</body>
</html>


