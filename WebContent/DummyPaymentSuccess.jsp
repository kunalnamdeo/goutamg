<%@page import="java.util.Enumeration"%>
<%@page import="goutamg.kanwiz.util.JavaIntegrationKit"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dummy Payment Success Page</title>
</head>
<body>
Dummy Payment Success Page
<%
 
/*   Enumeration<String> params = request.getParameterNames(); 
while(params.hasMoreElements()){
 String paramName = params.nextElement();
 System.out.println("Parameter Name - "+paramName+", Value - "+request.getParameter(paramName));
 out.println("Parameter Name - "+paramName+", Value - "+request.getParameter(paramName));
}  */
     
    JavaIntegrationKit integrationKit = new JavaIntegrationKit(); 
	Map<String, String> values = integrationKit.hashCalMethod(request, response);
	PrintWriter writer = response.getWriter();  
	//build HTML code
	String htmlResponse = "<html> <body> \n"
	        + "      \n"
	        + "  \n"
	        + "  <h1>PayUForm </h1>\n"
	        + "  \n" + "<div>"
	        + "        <form id=\"payuform\" action=\"" + values.get("action") + "\"  name=\"payuform\" method=POST >\n"
	        + "      <input type=\"hidden\" name=\"key\" value=" + values.get("key").trim() + ">"
	        + "      <input type=\"hidden\" name=\"hash\" value=" + values.get("hash").trim() + ">"
	        + "      <input type=\"hidden\" name=\"txnid\" value=" + values.get("txnid").trim() + ">"
	        + "      <table>\n"
	        + "        <tr>\n"
	        + "          <td><b>Mandatory Parameters</b></td>\n"
	        + "        </tr>\n"
	        + "        <tr>\n"
	        + "         <td>Amount: </td>\n"
	        + "          <td><input name=\"amount\" value=" + values.get("amount").trim() + " /></td>\n"
	        + "          <td>First Name: </td>\n"
	        + "          <td><input name=\"firstname\" id=\"firstname\" value=" + values.get("firstname").trim() + " /></td>\n"
	        + "        <tr>\n"
	        + "          <td>Email: </td>\n"
	        + "          <td><input name=\"email\" id=\"email\" value=" + values.get("email").trim() + " /></td>\n"
	        + "          <td>Phone: </td>\n"
	        + "          <td><input name=\"phone\" value=" + values.get("phone") + " ></td>\n"
	        + "        </tr>\n"
	        + "        <tr>\n"
	        + "          <td>Product Info: </td>\n"
	        + "<td><input name=\"productinfo\" value=" + values.get("productinfo").trim() + " ></td>\n"
	        + "        </tr>\n"
	        + "        <tr>\n"
	        + "          <td>Success URI: </td>\n"
	        + "          <td colspan=\"3\"><input name=\"surl\"  size=\"64\" value=" + values.get("surl") + "></td>\n"
	        + "        </tr>\n"
	        + "        <tr>\n"
	        + "          <td>Failure URI: </td>\n"
	        + "          <td colspan=\"3\"><input name=\"furl\" value=" + values.get("furl") + " size=\"64\" ></td>\n"
	        + "        </tr>\n"
	        + "\n"
	        + "        <tr>\n"
	        + "          <td colspan=\"3\"><input type=\"hidden\" name=\"service_provider\" value=\"payu_paisa\" /></td>\n"
	        + "        </tr>\n"
	        + "             <tr>\n"
	        + "          <td><b>Optional Parameters</b></td>\n"
	        + "        </tr>\n"
	        + "        <tr>\n"
	        + "          <td>Last Name: </td>\n"
	        + "          <td><input name=\"lastname\" id=\"lastname\" value=" + values.get("lastname") + " ></td>\n"
	        + "          <td>Cancel URI: </td>\n"
	        + "          <td><input name=\"curl\" value=" + values.get("curl") + " ></td>\n"
	        + "        </tr>\n"
	        + "        <tr>\n"
	        + "          <td>Address1: </td>\n"
	        + "          <td><input name=\"address1\" value=" + values.get("address1") + " ></td>\n"
	        + "          <td>Address2: </td>\n"
	        + "          <td><input name=\"address2\" value=" + values.get("address2") + " ></td>\n"
	        + "        </tr>\n"
	        + "        <tr>\n"
	        + "          <td>City: </td>\n"
	        + "          <td><input name=\"city\" value=" + values.get("city") + "></td>\n"
	        + "          <td>State: </td>\n"
	        + "          <td><input name=\"state\" value=" + values.get("state") + "></td>\n"
	        + "        </tr>\n"
	        + "        <tr>\n"
	        + "          <td>Country: </td>\n"
	        + "          <td><input name=\"country\" value=" + values.get("country") + " ></td>\n"
	        + "          <td>Zipcode: </td>\n"
	        + "          <td><input name=\"zipcode\" value=" + values.get("zipcode") + " ></td>\n"
	        + "        </tr>\n"
	        + "          <td>UDF1: </td>\n"
	        + "          <td><input name=\"udf1\" value=" + values.get("udf1") + "></td>\n"
	        + "          <td>UDF2: </td>\n"
	        + "          <td><input name=\"udf2\" value=" + values.get("udf2") + "></td>\n"
	        + " <td><input name=\"hashString\" value=" + values.get("hashString") + "></td>\n"
	        + "          <td>UDF3: </td>\n"
	        + "          <td><input name=\"udf3\" value=" + values.get("udf3") + " ></td>\n"
	        + "          <td>UDF4: </td>\n"
	        + "          <td><input name=\"udf4\" value=" + values.get("udf4") + " ></td>\n"
	        + "          <td>UDF5: </td>\n"
	       + "          <td><input name=\"udf5\" value=" + values.get("udf5") + " ></td>\n"
	         + "          <td>PG: </td>\n"
	       + "          <td><input name=\"pg\" value=" + values.get("pg") + " ></td>\n"
	        + "        <td colspan=\"4\"><input type=\"submit\" value=\"Submit\"  /></td>\n"
	        + "      \n"
	        + "    \n"
	        + "      </table>\n"
	        + "    </form>\n"
	        + " <script> "
	        + " document.getElementById(\"payuform\").submit(); "
	        + " </script> "
	        + "       </div>   "
	        + "  \n"
	        + "  </body>\n"
	        + "</html>";
	//return response
	writer.println(htmlResponse);


%>
</body>
</html>