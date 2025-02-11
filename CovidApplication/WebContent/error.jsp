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
try{

Cookie[] ck = request.getCookies();

for(Cookie cookie : ck)
{
	
	cookie.setMaxAge(0);
	response.addCookie(cookie);
}
}
catch(Exception e)
{
	out.println("");
}


%>


<nav class="navbar navbar-expand-md navbar-dark bg-primary">
  <a class="navbar-brand" href="#">Covid-HelpLine</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
  
    <ul style="padding-right:45%" class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home</a>
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

  
    
      <div style="padding-right:5px;padding-left:5px;" class="btn-nav"><a class="btn btn-dark btn-small navbar-btn" href="register.jsp">Sign up!</a>
      </div>
      <div class="btn-nav"><a class="btn btn-dark btn-small navbar-btn" href="login.jsp">Log in!</a>
      </div>
      
     
      
    
    
    
    
  </div>  
</nav>
<br>

    <%   
  
String name=request.getParameter("error");  
session.setAttribute("error",name);  
String nam=(String)session.getAttribute("error"); 
%>
  
  <div>
  <h1 align="center"> ${error}</h1>
  </div>

	
<script>




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
  


</body>
</html>


