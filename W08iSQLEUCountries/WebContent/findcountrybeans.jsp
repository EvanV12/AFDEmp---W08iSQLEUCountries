
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,cb.beans.Country"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="findcountrybeans" scope="request" class="cb.beans.FindCountryBean" />
<jsp:setProperty name="findcountrybeans" property="country" param="country" />
<jsp:setProperty name="findcountrybeans" property="capital" param="capital" />
<jsp:setProperty name="findcountrybeans" property="language" param="language" />
<jsp:setProperty name="findcountrybeans" property="currency" param="currency" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Χώρες - Εύρεση</title>
</head>
<body>
	<br />
	<br />
	<br />
	<div style="width: 400px; margin: auto">
		<form name="mainform" action="findcountrybeans.jsp" method="post">
			<table style="width: 400px" border="1">
				<tr>
					<td colspan="2" style="border: none;"><b>Εύρεση
							χώρας</b></td>
				</tr>
				<tr>
					<td colspan="2" style="border: none;" height="10"></td>
				</tr>
				<tr>
					<td width="200">Χώρα:</td>
					<td width="200" align="center"><input type="text"
						name="country" value="<%=findcountrybeans.getCountry()%>"
						maxlength="8" /></td>
				</tr>
				<tr>
					<td width="200">Πρωτεύουσα:</td>
					<td width="200" align="center"><input type="text"
						name="capital" value="<%=findcountrybeans.getCapital()%>" /></td>
				</tr>
				<tr>
					<td width="200">Γλώσσα:</td>
					<td width="200" align="center"><input type="text" name="language"
						value="<%=findcountrybeans.getLanguage()%>" /></td>
				</tr>
				<tr>
					<td width="200">Νόμισμα:</td>
					<td width="200" align="center"><input type="text" name="currency"
						value="<%=findcountrybeans.getCurrency()%>" /></td>
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
		if (request.getParameter("country") != null || request.getParameter("capital") != null
				|| request.getParameter("language") != null || request.getParameter("currency") != null) {
			ArrayList<Country> al = findcountrybeans.findCountry();
			if (al != null && al.size() > 0) {
	%>
	<div style="width: 800px; margin: auto;">
		<table style="width: 800px" border="1">
			<tr>
				<td><b>Χώρα</b></td>
				<td><b>Πρωτεύουσα</b></td>
				<td><b>Γλώσσα</b></td>
				<td><b>Νόμισμα</b></td>
			</tr>
			<%
				for (int i = 0; i < al.size(); i++) {
			%>
			<tr>
				<td><%=al.get(i).getCountry()%></td>
				<td><%=al.get(i).getCapital()%></td>
				<td><%=al.get(i).getLanguage()%></td>
				<td><%=al.get(i).getCurrency()%></td>
			</tr>
			<%
				}
			%>
		</table>
		<%
			} else {
		%>
		<div style="width: 400px; text-align: center; margin: auto">
			<p>Δε βρέθηκαν εγγραφές για τα παραπάνω κριτήρια</p>
		</div>
		<%
			}
			}
		%>
		<div style="width: 400px; margin: auto; text-align: right">
			<br /> <input type="button" onclick="window.location = 'index.jsp'"
				value="Επιστροφή" title="Επιστροφή στην αρχική σελίδα" />
		</div>
	</div>
</body>
</html>