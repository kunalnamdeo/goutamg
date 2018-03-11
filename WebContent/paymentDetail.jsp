<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment Detail</title>

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

  <% 
  	String steats = request.getParameter("txtSelectedValues");
    String[] allTickets = {""};
    Double totalAmount = null;
    List<String> balconyRows = new ArrayList<String>();
    balconyRows.add("P");balconyRows.add("Q");balconyRows.add("R");balconyRows.add("S");
    
    List<String> stallRows = new ArrayList<String>();
    stallRows.add("J");stallRows.add("K");stallRows.add("L");stallRows.add("M");stallRows.add("N");stallRows.add("O");
    
    List<String> frontRows = new ArrayList<String>();
    frontRows.add("A");frontRows.add("B");frontRows.add("C");frontRows.add("D");frontRows.add("E");frontRows.add("F");
    frontRows.add("G");frontRows.add("H");frontRows.add("I");
    
    if(steats != null && steats.contains(",")){
    	allTickets =  steats.split(",");
    }else {
    	allTickets[0] = steats;
    }
    
    if(allTickets != null){
    	totalAmount = new Double (0.0);
    	
    	for(int i = 0; i< allTickets.length ; i++){
    		String row = ""+allTickets[i].charAt(0);
    		if(balconyRows.contains(row)){
    			totalAmount = totalAmount + new Double (200.0);
    		} else if(stallRows.contains(row)){
    			totalAmount = totalAmount + new Double (250.0);
    		} else if (frontRows.contains(row)){
    			totalAmount = totalAmount + new Double (300.0);
    		}
    	}
    }else {
    	totalAmount = new Double (0.0);
    }
 	
  %>
  
<!-- <form action="DummyPaymentSuccess.jsp" method="post" name="PayDetalisForm" onsubmit="return validateForm()" >  -->
 <form action="timeCheck.jsp" method="post"  name="PayDetalisForm" onsubmit="return validateForm()" > 

	<input type="hidden" name="key"value="Q6hsrnOn" />  
	<input type="hidden" name="hash_string" value="" />
	<input type="hidden" name="hash" value="" />
	<input type="hidden" name="txnid" value=""/>
	
	
	
  <div class="container"> 
  	<h2>Seats and Payment Details</h2>
  	<p>Please verify seats and fill Mandatory details Carefully:</p>  
  	  
	  <table class="table table-condensed">
			<%-- <tr><td>Event Id</td><td><%=request.getParameter("eventId") %></td></tr> --%>
			<tr><td>Event Name</td><td><%=request.getParameter("eventName") %></td></tr>
			<tr><td>EventDate</td>   <td><%=request.getParameter("eventDate") %></td></tr>
			<tr><td>Seats</td>   <td><%=request.getParameter("txtSelectedValues") %></td></tr>
			<tr> <td><b>Mandatory Parameters</b></td></tr>
			
			<tr><td>Amount (Rs): </td><td><input type ="hidden" name="amount" value="<%=totalAmount %>" />
										  <input name="amountDummy" disabled value="<%=totalAmount %>" />
				</td><td>First Name:* </td><td><input name="firstname" id="firstname"  /></td></tr>
				
			<tr><td>Email:* </td><td><input name="email" id="email" onblur="ValidateEmail()"  /></td>
				<td>Phone:* </td><td><input name="phone" id="phone" onblur="phoneValidation()" /></td></tr>
				
			<tr><td>Product Info: </td>	
				<td colspan="3">
					<input name="productinfoDummy"  disabled value="<%=request.getParameter("txtSelectedValues") %>" > 
					<input type="hidden" name="productinfo"  value="<%=request.getParameter("txtSelectedValues").trim() %>" > 
				 </td></tr>
			
			<!-- local URIs -->
			 
			 <!--   <tr><td>Success URI: </td><td colspan="3"><input name="surl"   value="http://192.168.0.104:8080/goutamg/successResponse.jsp" size="64"  /></td></tr> 
			   <tr><td>Failure URI: </td><td colspan="3"><input name="furl"  value="http://192.168.0.104:8080/goutamg/failure.jsp" size="64" /></td></tr>    
			  -->  
			 
			<!-- Prod URIs -->
			
			   <tr><td>Success URI: </td><td colspan="3"><input type ="hidden" name="surl"  value="http://goutamghosh.in/successResponse.jsp" size="64"  /></td></tr>
			   <tr><td>Failure URI: </td><td colspan="3"><input type ="hidden" name="furl"  value="http://goutamghosh.in/failure.jsp" size="64" /></td></tr> 
			
			<tr><td colspan="3"><input type="hidden" name="service_provider" value="payu_paisa" /></td></tr>
	 </table>
	 <div align="center"><input class="btn btn-primary" type="submit" value="Go" > <a href="index.jsp">Back</a></div>
  </div>

</form>

<script type="text/javascript">

	function ValidateEmail() 
	{
	 if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(PayDetalisForm.email.value))
	  {	    return (true)	  }
	  
	 alert("You have entered an invalid email address!")
	    return (false)
	}
	
	function phoneValidation(){
		
		var val = PayDetalisForm.phone.value
		if (/^\d{10}$/.test(val)) {
		    // value is ok, use it
		} else {
		    alert("Invalid Phone Number; must be ten digits")
		    number.focus()
		    return false
		}
	}
	
	
	function validateForm() {
	    var x = PayDetalisForm.email.value;
	     
	    if (x == "") {
	        alert("Email must be filled out");
	        return false;
	    }
	    
	    var y = PayDetalisForm.phone.value;
	     
	    if (y == "") {
	        alert("Phone must be filled out");
	        return false;
	    }
	    
	    var z = PayDetalisForm.firstname.value;
	    
	    if (z == "") {
	        alert("First Name must be filled out");
	        return false;
	    }
	   
	}

</script>

</body>
</html>