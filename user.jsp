<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 
<sql:setDataSource
  driver="oracle.jdbc.driver.OracleDriver"
  url="jdbc:oracle:thin:@localhost:1521/xepdb1"
  user="csdc22bb_08"
  password="Toox1aa"
/>

<div>
  <h2>Login</h2>
</div>
<div>
		    <sql:query var="user2" 
		      sql="SELECT
	             Geburtsdatum,
	             VERSICHERUNGSNUMMER,
	             Vorname,
	             Nachname,
	             Postleitzahl,
	             Ort,
	             Strasse,
	             Hausnummer,
	             Tel1,
	             Tel2,
	             Tel3
               FROM person
               WHERE VERSICHERUNGSNUMMER = 4213 AND Geburtsdatum = to_timestamp('1989-04-02 00:00:00', 'yyyy-mm-dd hh24:mi:ss')" >
              
		    </sql:query>
        <form method="GET" action="index.jsp">
          <input type="hidden" name="menu" value="passagen"/>
          <table class="table table-sm">
          <c:forEach var="user" begin="0" items="${user2.rows}">
            <tr>
              <td scope="col">Versicherungsnummer</td>
              <td>${user.VERSICHERUNGSNUMMER}</td>
            </tr>
            <tr>
              <td scope="col">Geburtsdatum</td>
              <td>${user.Geburtsdatum}</td>
            </tr>
            <tr>
              <td scope="col">Vorname</td>
              <td>
                <input 
                  class="form-control form-control-sm"
                type="text" id="vorname" name="vorname" value="${user.Vorname}" />
              </td>
            </tr>
            <tr>
              <td scope="col">Nachname</td>
              <td>
                <input
                  type="text"
                  class="form-control form-control-sm"
                  id="nachname"
                  name="nachname"
                  value="${user.Nachname}"
                />
              </td>
            </tr>
            <tr>
              <td scope="col">Postleitzahl</td>
              <td>
                <input 
                  class="form-control form-control-sm"
                type="text" id="plz" name="plz" value="${user.Postleitzahl}" />
              </td>
            </tr>
            <tr>
              <td scope="col">Strasse</td>
              <td>
                <input
                  class="form-control form-control-sm"
                  type="text"
                  id="strasse"
                  name="strasse"
                  value="${user.Strasse}"
                />
              </td>
            </tr>
            <tr>
              <td scope="col">Hausnummer</td>
              <td>
                <input
                  class="form-control form-control-sm"
                  type="text"
                  id="hausnummer"
                  name="hausnummer"
                  value="${user.Hausnummer}"
                />
              </td>
            </tr>
            <tr>
              <td scope="col">Tel1</td>
              <td>
                <input 
                  class="form-control form-control-sm"
                type="text" id="tel1" name="tel1" value="${user.Tel1}" />
              </td>
            </tr>
            <tr>
              <td scope="col">Tel2</td>
              <td>
                <input 
                  class="form-control form-control-sm"
                type="text" id="tel2" name="tel2" value="${user.Tel2}" />
              </td>
            </tr>
            <tr>
              <td scope="col">Tel3</td>
              <td>
                <input 
                  class="form-control form-control-sm"
                type="text" id="tel3" name="tel3" value="${user.Tel3}" />
              </td>
            </tr>
          </c:forEach>
          </table>
          <div class="form-group">
            <button 
            type="submit" class="btn btn-primary float-right">Submit</button>
          </div>
        </form>

</div>
