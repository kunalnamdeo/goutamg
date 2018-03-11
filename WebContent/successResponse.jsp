<%@page import="goutamg.kanwiz.util.DBConnection"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Success Response</title>

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
<body oncontextmenu="return false">

<script>
function printFunction() {
    window.print();
}
</script>


	<%
/* Enumeration<String> headerNames = request.getHeaderNames();
while(headerNames.hasMoreElements()) {
  String headerName = headerNames.nextElement();
  System.out.println("Header Name - " + headerName + ", Value - " + request.getHeader(headerName));
  out.println("Header Name - " + headerName + ", Value - " + request.getHeader(headerName));
} 
//Enumeration<String> params = request.getParameterNames(); 
while(params.hasMoreElements()){
 String paramName = params.nextElement();
 System.out.println("Parameter Name - "+paramName+", Value - "+request.getParameter(paramName));
 out.println("Parameter Name - "+paramName+", Value - "+request.getParameter(paramName));
}
 */ %>
 
  <div class="container"> 
  	<h2>Payment Success : Seats and Payment Details</h2>
  	
  	<button class="btn btn-primary" onclick="printFunction()">Print this Receipt</button> 
  	<p>For any query send email to : kunal.scjp@gmail.com</p> 
	 <table class="table table-condensed">
			 
			<tr><td>Transaction Id:</td><td><%=request.getParameter("txnid") %></td></tr>
			<tr><td>Tickets:</td><td><%=request.getParameter("productinfo") %></td></tr>
			<tr><td>First Name:</td><td><%=request.getParameter("firstname") %></td></tr>
			<tr><td>Email Id:</td><td><%=request.getParameter("email") %></td></tr>
			<tr><td>Phone:</td><td><%=request.getParameter("phone") %></td></tr>
			<tr><td>Date (added on):</td><td><%=request.getParameter("addedon") %></td></tr>
			 
	 </table>	
   </div>	
	
<%  
	ResultSet rs = null;
	Connection con =  new DBConnection().getConnection();
	Statement stmt = null; 
    try{  
	
       stmt=con.createStatement();  
       
	   String steats = request.getParameter("productinfo");
	   String[] allTickets = {""};
	    
	    if(steats != null && steats.contains(",")){
	    	allTickets =  steats.split(",");
	    	
		    for (String ticket : allTickets) {
	           if(ticket != null){
	        	   String[] ticketDetails = ticket.split("-");
	        	   
	        	   String query ="update Ticket set BookingDate='"+(request.getParameter("addedon")!=null?request.getParameter("addedon").trim():"0000-00-00")+"'"
	   					+",productinfo='"+(request.getParameter("productinfo")!=null?request.getParameter("productinfo").trim():"")+"'"
	   					+",firstname='"+(request.getParameter("firstname")!=null?request.getParameter("firstname").trim():"")+"'"  
	   			 		+",email='"+(request.getParameter("email")!=null?request.getParameter("email").trim():"")+"'"  
	   		 		    +",phone='"+(request.getParameter("phone")!=null?request.getParameter("phone").trim():"")+"'"  
	   				 	+",txnid='"+(request.getParameter("txnid")!=null?request.getParameter("txnid").trim():"")+"'"  
	                    +",MoneyPaid='"+(request.getParameter("amount")!=null?request.getParameter("amount").trim():"")+"'"
	        	        +" where Row='"+ticketDetails[0]+"' and SeatNumber ="+ticketDetails[1];
	        	   
	        	   System.out.println("query in successResponse.jsp:"+query);
	        	   stmt.executeUpdate(query);
	        	   
	           }
	        }
	    }else {
	    	allTickets[0] = steats;
	    	 if(allTickets[0]  != null){
	        	   String[] ticketDetails = allTickets[0].split("-");
	        	   
	        	   String query ="update Ticket set BookingDate='"+(request.getParameter("addedon")!=null?request.getParameter("addedon").trim():"0000-00-00")+"'"
	   					+",productinfo='"+(request.getParameter("productinfo")!=null?request.getParameter("productinfo").trim():"")+"'"
	   					+",firstname='"+(request.getParameter("firstname")!=null?request.getParameter("firstname").trim():"")+"'"  
	   			 		+",email='"+(request.getParameter("email")!=null?request.getParameter("email").trim():"")+"'"  
	   		 		    +",phone='"+(request.getParameter("phone")!=null?request.getParameter("phone").trim():"")+"'"  
	   				 	+",txnid='"+(request.getParameter("txnid")!=null?request.getParameter("txnid").trim():"")+"'"  
	                    +",MoneyPaid='"+(request.getParameter("amount")!=null?request.getParameter("amount").trim():"")+"'"
	        	        +" where Row='"+ticketDetails[0]+"' and SeatNumber ="+ticketDetails[1];
	        	   System.out.println("query in successResponse.jsp:"+query);
	        	   stmt.executeUpdate(query); 
	           }
	    }
	    
	    if(con != null){
	 		con.close();
	 	} 

    }
	catch(Exception e){
		e.printStackTrace() ;
	}  
	 	

 %>
 
<a href="index.jsp">Go To Home Page</a>
</body>
</html>