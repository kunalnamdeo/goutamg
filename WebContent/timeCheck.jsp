<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="goutamg.kanwiz.util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Time Check</title>
</head>
<body>
	<input type="hidden" name="key"value="Q6hsrnOn" /> <!-- UFu3ed  -->
	<input type="hidden" name="hash_string" value="" />
	<input type="hidden" name="hash" value="" />
	<input type="hidden" name="txnid" value=""/>
   <%--  <input  type="text" id="timeOfDataLoad" name="timeOfDataLoad" value="<%=request.getParameter("timeOfDataLoad") %>"/>  --%>
  
	  <table class="table table-condensed">
			<%-- <tr><td>Event Id</td><td><%=request.getParameter("eventId") %></td></tr> --%>
			<tr><td>Event Name</td><td><%=request.getParameter("eventName") %></td></tr>
			<tr><td>EventDate</td>   <td><%=request.getParameter("eventDate") %></td></tr>
			<tr><td>Seats</td>   <td><%=request.getParameter("txtSelectedValues") %></td></tr>
			<tr> <td><b>Mandatory Parameters</b></td></tr>
			
			<tr><td>Amount: </td><td><input type ="hidden" name="amount" value="<%=request.getParameter("amount") %>" />
									 <input type ="text" name="amountDummy" disabled value="<%=request.getParameter("amount") %>" />
				</td><td>First Name:* </td><td><input name="firstname" id="firstname" value="<%=request.getParameter("firstname") %>" /></td>
			</tr>
				
			<tr><td>Email:* </td><td><input name="email" id="email" onblur="" value="<%=request.getParameter("email") %>" /></td>
				<td>Phone:* </td><td><input name="phone" id="phone" onblur="" value="<%=request.getParameter("phone") %>" /></td></tr>
				
			<tr><td>Product Info: </td>	
				
				<td colspan="3"><input type="hidden" name="productinfo"  value="<%=request.getParameter("productinfo") %>" >
					<input type="text" name="productinfoDummy"  value="<%=request.getParameter("productinfo") %>" >  </td></tr>
			
			<!-- local URIs -->
			
			 <!--    <tr><td>Success URI: </td><td colspan="3"><input name="surl" value="http://192.168.0.104:8080/goutamg/successResponse.jsp" size="64"  /></td></tr> 
			     <tr><td>Failure URI: </td><td colspan="3"><input name="furl" value="http://192.168.0.104:8080/goutamg/failure.jsp" size="64" /></td></tr>   -->
			  
			 
			<!-- Prod URIs -->
			
			  <tr><td>Success URI: </td><td colspan="3"><input name="surl" type ="hidden" value="http://goutamghosh.in/successResponse.jsp" size="64"  /></td></tr>
			   <tr><td>Failure URI: </td><td colspan="3"><input name="furl" type ="hidden" value="http://goutamghosh.in/failure.jsp" size="64" /></td></tr>  
			
			<tr><td colspan="3"><input type="hidden" name="service_provider" value="payu_paisa" /></td></tr>
	 </table>


		<%  
		
			ResultSet rs = null;
			Statement stmt = null; 
			Connection con = new DBConnection().getConnection();
			SimpleDateFormat sdf = null;
			Calendar cal = null; 
			Date timeOfDataLoadDate =  null;
			boolean errorFlag = false;
		    
		    try { 
		    	  int moneyPaid =0;

			     
				  char row ='\t';
				  String seatNum ="";
				  if(request.getParameter("productinfo")!= null){
					 
					  row  = request.getParameter("productinfo").trim().charAt(0);
					   
					  seatNum = request.getParameter("productinfo").trim();
					  seatNum = seatNum.substring(seatNum.lastIndexOf("-")+1,seatNum.length());
					   
					  //out.print("<br>"+row+":"+seatNum);
					  
					  stmt= con.createStatement();  
			  		  rs=stmt.executeQuery("select * from Ticket where event_id="+1+" and Row='"+row+"' and SeatNumber="+seatNum);
			  		  
			  		  while(rs.next()){
			  			moneyPaid = rs.getInt("MoneyPaid");
			  			System.out.println("moneyPaid:"+moneyPaid);
			  			if(moneyPaid != 0){
			  				errorFlag = true;	
			  			}
			  			 
			  		  }
					   
				  } 
				  if(con != null){
					   con.close();
				   }
				  
				  System.out.println("errorFlag:"+errorFlag);
				  if(errorFlag){
					  request.getRequestDispatcher("home.jsp").forward(request, response); 
				  } else {
					  request.getRequestDispatcher("DummyPaymentSuccess.jsp").forward(request, response);   
				  }
				  
				 
		    	
		    }catch(Exception e){
		    	 request.getRequestDispatcher("home.jsp").forward(request, response); 
				
			}
		    
		   
		 %>

</body>
</html>