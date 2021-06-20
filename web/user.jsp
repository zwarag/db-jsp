<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.sql.Date" %>

<sql:setDataSource driver="oracle.jdbc.driver.OracleDriver" url="jdbc:oracle:thin:@localhost:1521/xepdb1"
                   user="csdc22bb_08" password="Toox1aa"/>

<div>
    <h2>Daten &#252;berpr&#252;fen</h2>
</div>
<div>
    <sql:query var="user"
               sql="SELECT *
               FROM person
               WHERE VERSICHERUNGSNUMMER = ${param.versicherungsnummer} AND Geburtsdatum = to_timestamp('${param.geburtsdatum}', 'yyyy-mm-dd hh24:mi:ss')">

    </sql:query>

    <c:if test="${user.getRowCount() == 0}">
        <sql:update>
            INSERT INTO PERSON(Geburtsdatum, Versicherungsnummer)
            VALUES (?, ?)
            <sql:param value="${Date.valueOf(param.geburtsdatum)}"/>
            <sql:param value="${param.versicherungsnummer}"/>
        </sql:update>

        <sql:query var="user"
                   sql="SELECT *
               FROM person
               WHERE VERSICHERUNGSNUMMER = ${param.versicherungsnummer} AND Geburtsdatum = to_timestamp('${param.geburtsdatum}', 'yyyy-mm-dd hh24:mi:ss')">
        </sql:query>

    </c:if>


    <form method="GET" action="index.jsp">
        <input type="hidden" name="menu" value="passagen"/>
        <table class="table table-sm">
            <c:forEach var="user" begin="0" items="${user.rows}">
                <tr>
                    <td scope="col">Versicherungsnummer</td>
                    <td>${user.Versicherungsnummer}</td>
                </tr>
                <tr>
                    <td scope="col">Geburtsdatum</td>
                    <td>${user.Geburtsdatum}</td>
                </tr>
                <tr>
                    <td scope="col">Vorname</td>
                    <td>
                        <input class="form-control form-control-sm" type="text" id="vorname" name="vorname"
                               value="${user.Vorname}"/>
                    </td>
                </tr>
                <tr>
                    <td scope="col">Nachname</td>
                    <td>
                        <input type="text" class="form-control form-control-sm" id="nachname" name="nachname"
                               value="${user.Nachname}"/>
                    </td>
                </tr>
                <tr>
                    <td scope="col">Postleitzahl</td>
                    <td>
                        <input class="form-control form-control-sm" type="text" id="plz" name="plz"
                               value="${user.Postleitzahl}"/>
                    </td>
                </tr>
                <tr>
                    <td scope="col">Strasse</td>
                    <td>
                        <input class="form-control form-control-sm" type="text" id="strasse" name="strasse"
                               value="${user.Strasse}"/>
                    </td>
                </tr>
                <tr>
                    <td scope="col">Hausnummer</td>
                    <td>
                        <input class="form-control form-control-sm" type="text" id="hausnummer" name="hausnummer"
                               value="${user.Hausnummer}"/>
                    </td>
                </tr>
                <tr>
                    <td scope="col">Tel1</td>
                    <td>
                        <input class="form-control form-control-sm" type="text" id="tel1" name="tel1"
                               value="${user.Tel1}"/>
                    </td>
                </tr>
                <tr>
                    <td scope="col">Tel2</td>
                    <td>
                        <input class="form-control form-control-sm" type="text" id="tel2" name="tel2"
                               value="${user.Tel2}"/>
                    </td>
                </tr>
                <tr>
                    <td scope="col">Tel3</td>
                    <td>
                        <input class="form-control form-control-sm" type="text" id="tel3" name="tel3"
                               value="${user.Tel3}"/>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div class="form-group">
            <button type="submit" class="btn btn-primary float-right">Submit</button>
        </div>
    </form>

</div>