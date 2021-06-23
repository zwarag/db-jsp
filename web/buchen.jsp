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
    <sql:param value="${passagiernummer}"/>
</sql:query>

<c:if test="${exists.getRowCount() == 0}">
    <sql:update>
        INSERT INTO BUCHUNG(Passagennummer, Passagiernummer, Buchungsdatum, Klasse)
        VALUES (?, ?, CURRENT_TIMESTAMP, ?)
        <sql:param value="${param.passagennummer}"/>
        <sql:param value="${passagiernummer}"/>
        <sql:param value="${param.klasse}"/>
    </sql:update>
</c:if>

<jsp:forward page="index.jsp">
    <jsp:param name="menu" value="buchungen_anzeigen"/>
</jsp:forward>

