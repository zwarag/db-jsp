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
    <%--   todo change statement to show only the passages that the passager hasn't booked yet --%>
    <c:if test="${empty passagiernummer}">
        <jsp:forward page="index.jsp">
            <jsp:param name="menu" value="login"/>
        </jsp:forward>
    </c:if>
    <sql:query var="passagen"
               sql="SELECT * FROM passage
                    WHERE passagennummer
                    NOT IN
                    (SELECT passagennummer FROM buchung
                    WHERE passagiernummer = ?)">
        <sql:param value="${passagiernummer}"/>
    </sql:query>

    <table class="table table-sm">

        <tr>
            <th scope="col">No.</th>
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
                <td>${passage.zielhafen}</td>
                <td>${passage.abfahrtszeit}</td>
                <td>${passage.ankunftszeit}</td>
                <td>
                    <form METHOD="POST" action="index.jsp"> <!-- use the controller to update session attribute -->
                        <input type="hidden" name="menu" value="klasse"/>
                        <input type="hidden" name="passagennummer" value="${passage.passagennummer}"/>
                        <input type="hidden" name="passagiernummer" value="${param.passagiernummer}"/>
                        <button class="btn btn-primary btn-sm" type="submit">Buchen</button>
                    </form>
                        <%--                    <button class="btn btn-primary btn-sm">Buchen</button>--%>
                </td>
            </tr>

        </c:forEach>
    </table>
</div>
