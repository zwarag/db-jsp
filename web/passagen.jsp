<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.sql.Date" %>

<sql:setDataSource driver="oracle.jdbc.driver.OracleDriver" url="jdbc:oracle:thin:@localhost:1521/xepdb1"
                   user="csdc22bb_08" password="Toox1aa"/>

<div>
    <h2>Verf&#252;gbare Passagen</h2>
</div>
<div>
    <sql:update var="count">
        UPDATE Person
        SET Vorname=?,
        Nachname=?,
        Postleitzahl=?,
        Strasse=?,
        Hausnummer=?,
        tel1=?,
        tel2=?,
        tel3=?
        WHERE Versicherungsnummer=? AND Geburtsdatum=?
        <sql:param value="${param.vorname}"/>
        <sql:param value="${param.nachname}"/>
        <sql:param value="${param.postleitzahl}"/>
        <sql:param value="${param.strasse}"/>
        <sql:param value="${param.hausnummer}"/>
        <sql:param value="${param.tel1}"/>
        <sql:param value="${param.tel2}"/>
        <sql:param value="${param.tel3}"/>
        <sql:param value="${param.versicherungsnummer}"/>
        <sql:dateParam value="${Date.valueOf(param.geburtsdatum)}"/>
    </sql:update>

    <sql:query var="passagen"
               sql="SELECT *
                FROM passage">
    </sql:query>

    <table class="table table-sm">

        <tr>
            <th scope="col">Passagennummer</th>
            <th scope="col">Von</th>
            <th scope="col">Nach</th>
            <th scope="col">Abfahrtszeit</th>
            <th scope="col">Ankunftszeit</th>
            <th scope="col">Buchen</th>
        </tr>

        <c:forEach var="passage" begin="0" items="${passagen.rows}">
            <tr>
                <td>${passage.passagennummer}</td>
                <td>${passage.abfahrtshafen}</td>
                <td>${passage.ankunftshafen}</td>
                <td>${passage.abfahrtszeit}</td>
                <td>${passage.ankunftszeit}</td>
                <td>
                    <button class="btn btn-primary btn-sm">Buchen</button>
                </td>
            </tr>

        </c:forEach>
    </table>
</div>
