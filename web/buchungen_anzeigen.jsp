<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.sql.Date" %>

<sql:setDataSource driver="oracle.jdbc.driver.OracleDriver" url="jdbc:oracle:thin:@localhost:1521/xepdb1"
                   user="csdc22bb_08" password="Toox1aa"/>

<c:if test="${empty passagiernummer}">
    <jsp:forward page="index.jsp">
        <jsp:param name="menu" value="login"/>
    </jsp:forward>
</c:if>

<sql:query var="buchungen">
    SELECT *
    FROM BUCHUNG
    WHERE Passagiernummer = ?
    <sql:param value="${passagiernummer}"/>
</sql:query>

<div>
    <h1>Ihre Buchungen</h1>
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
    >Zur&#252;ck zur Startseite</a
    >

</div>

