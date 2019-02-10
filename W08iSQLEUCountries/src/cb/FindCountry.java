package cb;
 
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
/**
 * Servlet implementation class FindCar
 */
public class FindCountry extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    public FindCountry() {
        super();
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = null;
        Statement statement = null;
        String SQLStr;
        ResultSet rs = null;
 
        request.setCharacterEncoding("UTF-8");
        String country = request.getParameter("country");
        String capital = request.getParameter("capital");
        String language = request.getParameter("language");
        String currency = request.getParameter("currency");
       
 
        SQLStr = "SELECT * FROM `test`.`eu_countries` WHERE capital like '%' ";
        if (country != null && !country.equals(""))
            SQLStr += "AND country like '" + country + "' ";
        if (capital != null && !capital.equals(""))
            SQLStr += "AND capital like '" + capital + "' ";
        if (language != null && !language.equals(""))
            SQLStr += "AND language like '" + language + "' ";
        if (currency != null && !currency.equals(""))
            SQLStr += "AND currency like '" + currency + "' ";
 
        try {
            // get connection
            conn = DriverManager.getConnection(
                    "jdbc:mysql://5.189.135.166:3011/test?useUnicode=yes&characterEncoding=UTF-8&useSSL=false", 
                    "java", "java");
 
            System.out.println(SQLStr);
            statement = conn.createStatement();
            rs = statement.executeQuery(SQLStr);
            request.setAttribute("countries", rs);
            request.getRequestDispatcher("/findcountry.jsp").forward(request, response);
 
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
            } catch (final SQLException sqlEx) {
                System.err.println(sqlEx.getMessage());
            }
        }
    }
}
 
 