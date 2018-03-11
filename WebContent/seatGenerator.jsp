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
<title>Seat Generator</title>
</head>
<body>
<!-- 
44 -2 -S,R
42-2- Q,O
41-3-P,N,M
38-1-L
37-1-K
35-1-J
34-1-I
32-1-H
31-2-G,F
28-2-E,D
27-1-C
25-1-B
24-1-A
-->
</body>
		<%  
			ResultSet rs = null;
			Statement stmt = null; 
			Connection con = new DBConnection().getConnection();
			SimpleDateFormat sdf = null;
			Calendar cal = null;
			Date date = new Date();
			
		    try{  
		    	stmt= con.createStatement();  
	  			rs=stmt.executeQuery("select * from Ticket where event_id="+1);
		    }
			catch(Exception e){
				e.printStackTrace() ;
			}  
		    
		    try {
		    	sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		    	
		    }catch(Exception e){
				e.printStackTrace() ;
			}
		   
		 %>

			<div align ="center">
					<input  type="hidden" id="timeOfDataLoad" name="timeOfDataLoad" value="<%=sdf.format(date) %>"/>
					 <br> 
      				<table><tr><td>Selected-Seats:
      					<input  type="hidden" id="txtSelectedValues" name="txtSelectedValues" size="12"/>
      				    <input  type="text" disabled id="txtSelectedValuesDummy" disabled name="txtSelectedValuesDummy" size="12"/>&nbsp;</td><td>
      					<input  type="button" class="btn btn-primary" onclick="cleanSelection()" value="Clear" name="Clear"/>
      					</td></tr>
      				</table>
      				
 					<div align = "center" ><h2><span class="glyphicon glyphicon-picture"></span></h2> <p>Stage Here</p></div>
					 
				    <table border="1">
					     <tr>
			  			 <% while(rs.next())  {	 %> 
			  				    
						        	<td> 
						        		
						        		 <%  if("YES".equalsIgnoreCase (rs.getString("BLOCKED") ) ) { %>
						        	    		  <span class="glyphicon  glyphicon-check"></span> 
						        	 	
						        	    <%  } else   if("0".equalsIgnoreCase (rs.getString("MoneyPaid") ) &&  "NO".equalsIgnoreCase (rs.getString("BLOCKED") ) ) { %>
						        	    		<a  onclick="selectSeat('<%= rs.getString("Row")+"-"+rs.getString("SeatNumber")%>')" 
						        	 	        	id='<%= rs.getString("Row")+"-"+rs.getString("SeatNumber")%>'	><span class="glyphicon glyphicon-user"></span></a>
						        	 	
						        	    <%  } else { %>
						        	      		<span class="glyphicon  glyphicon-check"></span> 
						        	 	
						        	    <%  } %>
						        	
						        	 </td>
						        	 	
							        	 <%   	
								        	if( rs.getString("SeatNumber").equalsIgnoreCase("1")) { 
								        		%><td><%= rs.getString("Row")%></td><tr/><tr> 
								         <% } 
							
					   		
					   	 } //while loop end  %>
				   	     </tr>
		  			 </table> 
		  			 <%
		  			 	if(con != null){
		  			 		con.close();
		  			 	}
		  			 %>
		  		<br>	 
			    <div align="center"><input class="btn btn-primary" type="submit" value="Go"></div>
			</div>	
</html>