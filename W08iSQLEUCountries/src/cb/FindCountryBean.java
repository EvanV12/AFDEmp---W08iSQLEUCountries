package cb;

import java.sql.*;
import java.util.ArrayList;

public class FindCountryBean {
	private String country = "";
	private String capital = "";
	private String language = "";
	private String currency = "";
	
	public FindCountryBean(){}
	
	public ArrayList<Country> findCountry(){
	    Connection conn = null;
		Statement statement = null;
		String SQLStr = "";
		ResultSet rs = null;
		ArrayList<Country> al = new ArrayList<Country>();
	    
		if (country == null && capital == null && language == null &&
				currency == null && country.equals("") &&
				capital.equals("") && language.equals("") && currency.equals("")) {			
			al = null;
		} else {
			SQLStr = "SELECT * FROM `test`.`eu_countries` WHERE capital like '%' ";
			if (country != null && !country.equals(""))
				SQLStr += "AND country like '" + country + "' ";
			if (capital != null && !capital.equals(""))
				SQLStr += "AND capital like '" + capital + "' ";
			if (language != null && !language.equals(""))
				SQLStr += "AND language like '" + language + "' ";
			if (currency != null && !currency.equals(""))
				SQLStr += "AND currency = " + currency + " ";
			
			
			try {
		    	// get connection
		    	conn = DriverManager.getConnection("jdbc:mysql://" + 
		    				"5.189.135.166:3011/test?useUnicode=yes&characterEncoding=UTF-8&useSSL=false", 
		    				"java", "java");
	    		
	    		System.out.println(SQLStr);
	    		statement = conn.createStatement();
	    		rs = statement.executeQuery(SQLStr);
	    		
	    		while(rs.next()){
	    			Country row = new Country();
	    			row.setCountry(rs.getString("country"));
	    			row.setCapital(rs.getString("capital"));
	    			row.setLanguage(rs.getString("language"));
	    			row.setCurrency(rs.getString("currency"));
	    			al.add(row);
	    		}
	    		
		    } catch (SQLException sqlEx) {
		    	System.err.println(sqlEx.getMessage());
		    } catch (Exception ex) {
				System.err.println(ex.getMessage());
		    } finally {
		    	try {
			        if (statement != null) {
		        		statement.close();
			        }
			        conn.close();
		    	} catch(final SQLException sqlEx){
		    		System.err.println(sqlEx.getMessage());
		    	}
	    	}
		}
		return al;
	}

	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}

	public String getCapital() {
		return capital;
	}
	public void setCapital(String capital) {
		this.capital = capital;
	}

	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}

	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}

}

