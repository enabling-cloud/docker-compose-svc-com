<%@ page import="java.util.*" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.Binding" %>
<%@ page import="javax.naming.Binding" %>
<%@ page import="javax.naming.InitialContext" %> 
<%@ page import="javax.naming.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.net.*" %> 

<% 

String url = getProperties().getProperty("url");

System.out.println("Url : " + url);

HttpURLConnection con = createConnection(url);

int responseCode = con.getResponseCode();
System.out.println("\nSending 'GET' request to URL : " + url);
System.out.println("Response Code : " + responseCode);


// print result
out.write(getResponse(con).toString());


%>


<%! 

private static Properties getProperties() throws Exception {
	Properties props = new Properties();
	try {
		Context ctx = new InitialContext();

		for (Enumeration<Binding> e = ctx.listBindings("java:comp/env"); e.hasMoreElements();) {
			Binding bind = e.nextElement();
			Object value = bind.getObject();
			props.put(bind.getName(), value);

		}	
	} catch(NamingException e) {
		
	}
	
	return props;	
}

private static StringBuffer getResponse(HttpURLConnection con) throws Exception {
	BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
	String inputLine;
	StringBuffer response = new StringBuffer();

	while ((inputLine = in.readLine()) != null) {
		response.append(inputLine);
	}
	in.close();
	return response;
}

private static HttpURLConnection createConnection(String url) throws Exception {
	URL obj = new URL(url);
	HttpURLConnection con = (HttpURLConnection) obj.openConnection();

	// optional default is GET
	con.setRequestMethod("GET");

	// add request header
	con.setRequestProperty("User-Agent", "Mozilla/5.0");
	return con;
}

%>
