<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.sql.Date" %>

<sql:setDataSource driver="oracle.jdbc.driver.OracleDriver" url="jdbc:oracle:thin:@localhost:1521/xepdb1"
                   user="csdc22bb_08" password="Toox1aa"/>

<sql:query var="exists">
    SELECT Buchungsnummer
    FROM BUCHUNG
    WHERE Passagennummer = ? AND Passagiernummer = ?
    <sql:param value="${param.passagennummer}"/>
    <sql:param value="${param.passagiernummer}"/>
</sql:query>


<c:if test="${exists.getRowCount() == 0}">
    <sql:update>
        INSERT INTO BUCHUNG(Passagennummer, Passagiernummer,Buchungsdatum, Klasse)
        VALUES (?, ?, CURRENT_TIMESTAMP, ?)
        <sql:param value="${param.passagennummer}"/>
        <sql:param value="${param.passagiernummer}"/>
        <sql:param value="${param.klasse}"/>
    </sql:update>
</c:if>

<sql:query var="buchungen">
    SELECT *
    FROM BUCHUNG
    WHERE Passagiernummer = ?
    <sql:param value="${param.passagiernummer}"/>
</sql:query>


<div>
    <table>

        <tr>
            <th scope="col">Passagier No.</th>
            <th scope="col">Passagen No.</th>
            <th scope="col">Buchungs No.</th>
            <th scope="col">Buchungsdatum</th>
            <th scope="col">Klasse</th>
        </tr>

        <c:forEach var="buchungen" begin="0" items="${buchungen.rows}">
            <tr>
                <td>${buchungen.passagiernummer}</td>
                <td>${buchungen.passagennummer}</td>
                <td>${buchungen.buchungsnummer}</td>
                <td>${buchungen.buchungsdatum}</td>
                <td>${buchungen.klasse}</td>
            </tr>
        </c:forEach>


    </table>
    <a
            href="index.jsp"
            id="startmenu"
    >Zurück zur Startseite</a
    >

</div>

