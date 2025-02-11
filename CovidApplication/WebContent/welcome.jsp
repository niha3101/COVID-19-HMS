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
        <a class="nav-link" href="#">Home</a>
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

      
      <div style="padding-right:5px;padding-left:5px;" class="btn-nav"><a class="btn btn-dark btn-small navbar-btn" href="bookbed.jsp">Book a Bed!</a>
      </div>
      
       <div class="btn-nav"><a class="btn btn-dark btn-small navbar-btn" href="index.jsp">Logout</a>
      </div>
      
    
    
    
    
  </div>  
</nav>
<br>


<div class="row">

		<div class="col-sm-8">
	<div class="container">
	
	  <div class="card">
    <div align="center" class="card-body">
    <img style="width:100px;height:100px" src="https://www.gstatic.com/healthricherkp/campaigns/wear-mask-save-lives/UZ9ZuX.svg">
    <h1>Wear a mask.Save lives.</h1>
    <h3>
    Wear a face cover,<br>
	Wash your hands,<br>
	Keep a safe distance
    <br><br>
    
    
    </h3>
    
   <p align="left"> <b>Protect yourself and others around you by knowing the facts and taking appropriate precautions. Follow advice provided by your local health authority.
To prevent the spread of COVID-19:</b></p>


  <ul class="list-group">
    <li class="list-group-item active">To prevent the spread of COVID-19:</li>
    <li class="list-group-item">Clean your hands often. Use soap and water, or an alcohol-based hand rub.</li>
    <li class="list-group-item">Maintain a safe distance from anyone who is coughing or sneezing</li>
   <li class="list-group-item"> Wear a mask when physical distancing is not possible.</li>
	<li class="list-group-item">Dont touch your eyes, nose or mouth.</li>
	<li class="list-group-item">Cover your nose and mouth with your bent elbow or a tissue when you cough or sneeze.</li>
	<li class="list-group-item">Stay home if you feel unwell.</li>
	<li class="list-group-item">If you have a fever, cough and difficulty breathing, seek medical attention.</li>
  </ul>
    
    
    </div>
  </div>
	
	
	</div>
	
	
	</div>
	
	
	
	
	
		<div class="col-sm-4">
	
<marquee direction="down" height="73%">
	
	<div style="width:60%;" class="container">
	  <div class="card">
    <div align="center" class="card-body">
    <h3>Andhra Pradesh</h3>
    <p>23-Nov to 6-Dec</p>
   <h4>Total Cases: 9759</h4>
   <h4>Deaths: 95</h4>
    
    </div>
  </div>
	</div>
	
	<br>
	
	
	<div style="width:60%;" class="container">
	  <div class="card">
    <div align="center" class="card-body">
      <h3>Telangana</h3>
    <p>23-Nov to 6-Dec</p>
   <h4>Total Cases: 9730</h4>
   <h4>Deaths: 41</h4>
    </div>
  </div>
	</div>
	<br>
	
	<div style="width:60%;" class="container">
	  <div class="card">
    <div align="center" class="card-body">
      <h3>Tamilnadu</h3>
    <p>23-Nov to 6-Dec</p>
   <h4>Total Cases: 20245</h4>
   <h4>Deaths: 188</h4>
    </div>
  </div>
	</div>
	<br>
	<div style="width:60%;" class="container">
	  <div class="card">
    <div align="center" class="card-body">
      <h3>Kerela</h3>
    <p>23-Nov to 6-Dec</p>
   <h4>Total Cases: 73697</h4>
   <h4>Deaths: 369</h4>
    </div>
  </div>
	</div>
	<br>	
	<div style="width:60%;" class="container">
	  <div class="card">
    <div align="center" class="card-body">
      <h3>Karnataka</h3>
    <p>23-Nov to 6-Dec</p>
   <h4>Total Cases: 19960</h4>
   <h4>Deaths: 202</h4>
    </div>
  </div>
	</div>
	
	
	
	</marquee>
	
	
		</div>
	
	
	
	
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
  
  
  <%
  }
  %>
  

</body>
</html>


