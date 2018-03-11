<!DOCTYPE html>
<%@page import="goutamg.kanwiz.util.DBConnection"%>
<html lang="en">
 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Goutam Ghosh - Ghazal Exponent</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
    <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">
   
    <!-- Custom CSS -->
    <link href="css/stylish-portfolio.min.css" rel="stylesheet">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  </head>

  <body id="page-top" oncontextmenu="return false">
    <!-- Navigation -->
    <a class="menu-toggle rounded" href="#">
      <i class="fa fa-bars"></i>
    </a>
    <nav id="sidebar-wrapper">
      <ul class="sidebar-nav">
        <li class="sidebar-brand"> <a class="js-scroll-trigger" href="#page-top">Goutam's Expertize</a> </li> 
        <li class="sidebar-nav-item"> <a class="js-scroll-trigger" href="#page-top">Home</a>  </li>
        <li class="sidebar-nav-item"> <a class="js-scroll-trigger" href="#about">About Gaoutam</a>     </li>
        <li class="sidebar-nav-item"> <a class="js-scroll-trigger" href="#services">Events</a>       </li>
        <li class="sidebar-nav-item"> <a class="js-scroll-trigger" href="#portfolio">Portfolio</a>    </li>
        <li class="sidebar-nav-item"> <a class="js-scroll-trigger" href="#services">Contact</a>      </li>
      </ul>
    </nav>

    <!-- Header -->
    <header class="masthead d-flex">
      <div class="container text-center my-auto">
        <br><br><br><br>
        <h1 style="color: orange">Goutam Ghosh</h1>
        <h3 style="color: white">  <em>An Unconditional Ghazal Maestro</em>  </h3>
        <a class="btn btn-primary btn-xl js-scroll-trigger" href="#about">Find Out Events</a>
        <a class="btn btn-primary btn-xl js-scroll-trigger" href="#services">Contact Us</a>
      </div>
      <div class="overlay"></div>
    </header>

    <!-- About -->
    <section class="content-section bg-light" id="about">
      <div class="container text-center">
        <div class="row">
          <div class="col-lg-10 mx-auto">
            <h2>Goutam Ghosh has Exponent of Indian Light Classical Genre ! Like :</h2>
            <p class="lead mb-5">Ghazal , Classical/Semiclassical , Sufi , Bhajan etc. </p>
            <a class="btn btn-dark btn-xl js-scroll-trigger" href="#services">What We Offer</a>
          </div>
        </div>
      </div>
    </section>

    <!-- Services -->
    <section class="content-section bg-primary text-white text-center" id="services">
      <div class="container">
        <div class="content-section-heading">
          <h3 class="text-secondary mb-0">technical support by  KANWIZ solutions</h3>
          <h2 class="mb-5">Events</h2>
        </div>
        <div class="row">
          <div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
            <span class="service-icon rounded-circle mx-auto mb-3"><i class="icon-screen-smartphone"></i></span>
            <h4><strong>Booking</strong> </h4>
            <p class="text-faded mb-0">Book from Any device!</p>
          </div>
         
          <div class="col-lg-3 col-md-6">
            <span class="service-icon rounded-circle mx-auto mb-3">
              <i class="icon-mustache"></i>
            </span>
            <h4>
              <strong>Contact Us</strong>
            </h4>
            <p class="text-faded mb-0">Email: kunal.scjp@gmail.com <br> Cell :9769333050 (Kunal)</p>
          </div> 
          
          <div class="col-lg-3 col-md-6 mb-5 mb-md-0">
            <span class="service-icon rounded-circle mx-auto mb-3">   <i class="icon-like"></i> </span>
            <h4>   <strong>Favourite </strong></h4>
            <p class="text-faded mb-0">Millions of Fans <i class="fa fa-heart"></i> </p>
          </div>
          
        </div>
      </div>
    </section>

    <!-- Callout -->
    <section class="callout">
    <form action="paymentDetail.jsp" method="post" onsubmit="return validateForm()" >
      <div class="container text-center">     <h2 class="mx-auto mb-5">Book <em>your</em>  Seat!</h2>

	  <div class="container">
				
		 <p>Coming Event</p>
		<%  
			ResultSet rs = null;
			Statement stmt = null; 
			Connection con = new DBConnection().getConnection();
		    try{  
		    	stmt= con.createStatement();  	   
			    rs=stmt.executeQuery("select * from event");  
		    }
			catch(Exception e){
				e.printStackTrace() ;
			}  
	
		 %>
	
		<div class="checkbox">
			<table class="table table-bordered">
			    <thead>
			      <tr> <th align="center">Select</th> <th align="center">Event Name</th> <th align="center">Date Time</th> <th align="center">Address</th> </tr>
			    </thead>
			    <tbody>
  			 <% while(rs.next())  {
		   		%>

			      <tr>
			        <td>
			        	<input type="checkbox" name="eventId" checked="checked" disabled  value='<%= rs.getString("ID")%>'> 
			        	<input type="hidden" name="eventName"   value='<%= rs.getString("EventName")%>'> 
			        	<input type="hidden" name="eventDate"   value='<%= rs.getString("EventDate")%>'> 
			        	<input type="hidden" name="eventAddress"   value='<%= rs.getString("EventAddress")%>'> 
			        </td>
			        <td><%= rs.getString("EventName") %></td><td><%= rs.getString("EventDate") %></td><td>  <%= rs.getString("EventAddress") %></td>
			      </tr>

		   		
		   	 <% } //while loop end  %>
  			   </tbody>
  			  </table>
  			
	  </div> 

	 </div>
		<div> 
			<% if(request.getAttribute("seatSold") != null){ %>
				<h2>Some of Seats Blocked by Someone else, Please select again</h2>
			<% } %>
		</div>
		<div>
			<jsp:include page="seatGenerator.jsp" />  
		</div>
 
    </div>
      
   </form>
      
  
    </section>

    <!-- Portfolio -->
    <section class="content-section" id="portfolio">
      <div class="container">
        <div class="content-section-heading text-center">
          <h3 class="text-secondary mb-0">Portfolio</h3>
          <h2 class="mb-5">Recent Attractions</h2>
        </div>
        <div class="row no-gutters">
          <div class="col-lg-6">
            <a class="portfolio-item" href="#">
              <span class="caption">
                <span class="caption-content">
                  <h2>Ghazal</h2>
                  <p class="mb-0">Heart Touching Voice !</p>
                </span>
              </span>
              <img class="img-fluid" src="img/portfolio-1.jpg" alt="">
            </a>
          </div>
          <div class="col-lg-6">
            <a class="portfolio-item" href="#">
              <span class="caption">
                <span class="caption-content">
                  <h2>Versatile Singer</h2>
                  <p class="mb-0">Master Class!</p>
                </span>
              </span>
              <img class="img-fluid" src="img/portfolio-2.jpg" alt="">
            </a>
          </div>
        
        </div>
        
        	

      </div>
    </section>
    
     <!--  Goutam Ghosh Videos <embed src="https://www.youtube.com/watch?v=6eOlDdEkeQw" allowfullscreen="true" width="425" height="344"> -->
      

    <!-- Map -->
	<!-- Map ends -->

    <!-- Footer -->
    <footer class="footer text-center">
      <div class="container">
        <ul class="list-inline mb-5">
          <li class="list-inline-item">
            <a class="social-link rounded-circle text-white mr-3" href="#">
              <i class="icon-social-facebook"></i>
            </a>
          </li>
          <li class="list-inline-item">
            <a class="social-link rounded-circle text-white mr-3" href="#">
              <i class="icon-social-twitter"></i>
            </a>
          </li>
          <li class="list-inline-item">
            <a class="social-link rounded-circle text-white" href="#">
              <i class="icon-social-github"></i>
            </a>
          </li>
        </ul>
        <p class="text-muted small mb-0">Copyright &copy; KANWIZ Solutions 2018</p>
      </div>
    </footer>

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded js-scroll-trigger" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="js/stylish-portfolio.min.js"></script>
  <script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
  <script type="text/javascript" src="js/index.js"></script>
    
    
    <script type="text/javascript">
    var selectedArray ;
    var count = 0 ;
    var txtSelectedValuesObj ;
    var txtSelectedValuesObjDummy ;
    
    function selectSeat( seatNumber )
    {
      
      txtSelectedValuesObj = document.getElementById('txtSelectedValues');
      txtSelectedValuesObjDummy = document.getElementById('txtSelectedValuesDummy');
      selectedArray = new Array();
      selectedArray[count] = seatNumber; 

      if(txtSelectedValuesObj.value ==""){
    	  txtSelectedValuesObj.value = seatNumber;
    	  txtSelectedValuesObjDummy.value = seatNumber;
      }else {
    	  txtSelectedValuesObj.value = txtSelectedValuesObj.value +","+seatNumber;
    	  txtSelectedValuesObjDummy.value = txtSelectedValuesObjDummy.value +","+seatNumber;
      }
      //txtSelectedValuesObj.value = selectedArray;
           
      count++;
      
      if(document.getElementById(seatNumber).style.color == ''  ){
    	document.getElementById(seatNumber).style.color='red';
      } else {
    	document.getElementById(seatNumber).style.color='';// black by default
      }
       
    }
       
    function cleanSelection(){
    	txtSelectedValuesObj.value ='';
    	txtSelectedValuesObjDummy.value='';
    	location.reload();
    }
    
    
	function validateForm() {
		
	    var txtSelectedSeats = document.getElementById('txtSelectedValuesDummy').value;
	    
	    if(txtSelectedSeats =="" || txtSelectedSeats == null){
	    	alert("Please select atleast One Seat to Proceed!");
	    	return false;
	    }
	    
	    var res = txtSelectedSeats.split(",");
	     
	    for (i = 0; i < res.length; i++) {
	       
	        for(j=i+1 ; j < res.length; j++){
	        	if(res[i]== res[j]){
	        		alert("Dont Select one Seat Twice , Please Refresh your page !")
	        		location.reload();
	        		return false;
	        	}
	        }
	    }
	    
	   
	   
	}
    
    </script>

  </body>

</html>
