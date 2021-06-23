<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.sql.Date" %>

<sql:setDataSource driver="oracle.jdbc.driver.OracleDriver" url="jdbc:oracle:thin:@localhost:1521/xepdb1"
                   user="csdc22bb_08" password="Toox1aa"/>

<sql:update>
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
    <sql:param value="${versicherungsnummer}"/>
    <sql:dateParam value="${geburtsdatum}"/>
</sql:update>

<jsp:forward page="index.jsp">
    <jsp:param name="menu" value="passagen"/>
</jsp:forward>