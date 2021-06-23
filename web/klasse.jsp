<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.sql.Date" %>

<sql:setDataSource driver="oracle.jdbc.driver.OracleDriver" url="jdbc:oracle:thin:@localhost:1521/xepdb1"
                   user="csdc22bb_08" password="Toox1aa"/>



<div>
    <form method="POST" action="index.jsp">
        <input type="hidden" name="menu" value="buchen"/>
        <input type="hidden" name="passagennummer" value="${param.passagennummer}"/>
        <input type="hidden" name="passagiernummer" value="${passagiernummer}"/>

        <input type="radio" id="klasse1" name="klasse" value="First Class">
        <label for="klasse1">First Class</label><br>
        <input type="radio" id="klasse2" name="klasse" value="Business">
        <label for="klasse2">Business</label><br>
        <input type="radio" id="klasse3" name="klasse" value="Economy">
        <label for="klasse3">Economy</label><br>

        <button class="btn btn-primary btn-sm" type="submit">Buchen</button>
    </form>
</div>

