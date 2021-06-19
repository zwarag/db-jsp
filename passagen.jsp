<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 
<sql:setDataSource
  driver="oracle.jdbc.driver.OracleDriver"
  url="jdbc:oracle:thin:@localhost:1521/xepdb1"
  user="csdc22bb_08"
  password=""
/>

<div>
  <h2>Login</h2>
</div>
<div>
    <sql:query var="user" 
		      sql="SELECT
                Passagennummer,
	            Abfahrtshafen,
	            Zielhafen,
	            Abfahrtszeit,
	            Ankunftszeit
                FROM passage" >
		    </sql:query>
    
    <table class="table table-sm">
        <tr>
            <th scope="col">P NR.</th>
            <th scope="col">Von</th>
            <th scope="col">Nach</th>
            <th scope="col">Abfahrtszeit</th>
            <th scope="col">Ankunftszeit</th>
            <th scope="col">Buchen</th>
        </tr>
        <tr>
            <td>1</td>
            <td>Lissabon</td>
            <td>marseille</td>
            <td>1.1.2020 22:00</td>
            <td>2.1.2020 13:00</td>
            <td><button class="btn btn-primary btn-sm">Buchen</button></td>
        </tr>
        <tr>
            <td>2</td>
            <td>Genua</td>
            <td>San Remo</td>
            <td>1.1.2020 10:00</td>
            <td>1.1.2020 14:00</td>
            <td><button class="btn btn-primary btn-sm">Buchen</button></td>
        </tr>
    </table>
</div>
