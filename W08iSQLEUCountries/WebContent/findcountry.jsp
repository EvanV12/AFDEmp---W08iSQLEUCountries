<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Χώρες - Εύρεση</title>
</head>
<style>
input {
	background: lavender;
}
</style>
<body>
	<br />
	<br />
	<br />
	<%
		String country = "";
		String capital = "";
		String language = "";
		String currency = "";
		
		if (request.getParameter("country") != null)
			country = request.getParameter("country");
		if (request.getParameter("capital") != null)
			capital = request.getParameter("capital");
		if (request.getParameter("language") != null)
			language = request.getParameter("language");
		if (request.getParameter("currency") != null)
			currency = request.getParameter("currency");
		
	%>
	<div style="width: 400px; margin: auto">
		<form name="mainform" action="FindCountry" method="post">
			<table style="width: 400px" border="1">
				<tr>
					<td colspan="2" align="center" style="border: none; color: darkgreen;"><b>Εύρεση
							χώρας</b></td>
				</tr>
				<tr>
					<td colspan="2" style="border: none;" height="10"></td>
				</tr>
				<tr>
					<td width="200">Χώρα:</td>
					<td width="200" align="center"><input type="text"
						name="country" value="<%=country%>" maxlength="8" /></td>
				</tr>
				<tr>
					<td width="200">Πρωτεύουσα:</td>
					<td width="200" align="center"><input type="text"
						name="capital" value="<%=capital%>" /></td>
				</tr>
				<tr>
					<td width="200">Γλώσσα:</td>
					<td width="200" align="center"><input type="text" name="language"
						value="<%=language%>" /></td>
				</tr>
				<tr>
					<td width="200">Νόμισμα:</td>
					<td width="200" align="center"><input type="text" name="currency"
						value="<%=currency%>" /></td>
				</tr>
				
				<tr>
					<td colspan="2" height="10" style="border: none;"></td>
				</tr>
				<tr>
					<td width="200" style="border: none;" align="center"><input
						type="reset" value="Καθαρισμός"
						title="Κλικ για καθαρισμό της φόρμας" /></td>
					<td width="200" style="border: none;" align="center"><input
						type="submit" value="Εύρεση" title="Κλικ για αναζήτηση" /></td>
				</tr>
				<tr>
					<td colspan="2" height="15" style="border: none;"></td>
				</tr>
			</table>
		</form>
	</div>
	<br />
	<br />
	<%
		ResultSet countries = (ResultSet) request.getAttribute("countries");
		if (countries != null) {
			if (countries.next() == false) {
		%>
		<div style="width: 400px; text-align: center; margin: auto">
			<p>Δε βρέθηκαν εγγραφές για τα παραπάνω κριτήρια</p>
		</div>
		<% }
			else { %>
	<div style="width: 800px; margin: auto;">
		<table style="width: 800px" border="1">
			<tr>
				<td><b>Χώρα</b></td>
				<td><b>Πρωτεύουσα</b></td>
				<td><b>Γλώσσα</b></td>
				<td><b>Νόμισμα</b></td>
			</tr>
			<%
			countries.beforeFirst();
				while (countries.next()) {
			%>
				<tr>
					<td><%= countries.getString(1) %></td>
					<td><%= countries.getString(2) %></td>
					<td><%= countries.getString(3) %></td>
					<td><%= countries.getString(4) %></td>
				</tr>
			<%
				}
			} 
			%>
		</table>
		<%
			}
		%>
		
		<div style="width: 400px; margin: auto; text-align: right">
			<br /> <input type="button" onclick="window.location = 'index.htm'"
				value="Επιστροφή" title="Επιστροφή στην αρχική σελίδα" />
		</div>
	</div>
</body>
</html>