<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.sql.Date" %>

<sql:setDataSource driver="oracle.jdbc.driver.OracleDriver" url="jdbc:oracle:thin:@localhost:1521/xepdb1"
                   user="csdc22bb_08" password="Toox1aa"/>

<div>
    <h2>Daten &#252;berpr&#252;fen</h2>
</div>
<div>
    <sql:query var="passagier"
               sql="SELECT *
               FROM person
               NATURAL JOIN passagier
               WHERE VERSICHERUNGSNUMMER = ${param.versicherungsnummer} AND Geburtsdatum = to_timestamp('${param.geburtsdatum}', 'yyyy-mm-dd hh24:mi:ss')"/>

    <c:if test="${passagier.getRowCount() == 0}">

        <sql:query var="person" sql="SELECT *
               FROM person
               WHERE VERSICHERUNGSNUMMER = ${param.versicherungsnummer} AND Geburtsdatum = to_timestamp('${param.geburtsdatum}', 'yyyy-mm-dd hh24:mi:ss')"
        />

        <c:choose>
            <c:when test="${person.getRowCount() == 0}">
                <sql:update>
                    INSERT INTO PERSON(Geburtsdatum, Versicherungsnummer)
                    VALUES (?, ?)
                    <sql:param value="${Date.valueOf(param.geburtsdatum)}"/>
                    <sql:param value="${param.versicherungsnummer}"/>
                </sql:update>

                <sql:update>
                    INSERT INTO PASSAGIER(Geburtsdatum, Versicherungsnummer)
                    VALUES (?, ?)
                    <sql:param value="${Date.valueOf(param.geburtsdatum)}"/>
                    <sql:param value="${param.versicherungsnummer}"/>
                </sql:update>

            </c:when>
            <c:otherwise>
                <sql:update>
                    INSERT INTO PASSAGIER(Geburtsdatum, Versicherungsnummer)
                    VALUES (?, ?)
                    <sql:param value="${Date.valueOf(param.geburtsdatum)}"/>
                    <sql:param value="${param.versicherungsnummer}"/>
                </sql:update>
            </c:otherwise>
        </c:choose>

        <sql:query var="passagier"
                   sql="SELECT *
               FROM person
               natural join passagier
               WHERE VERSICHERUNGSNUMMER = ${param.versicherungsnummer} AND Geburtsdatum = to_timestamp('${param.geburtsdatum}', 'yyyy-mm-dd hh24:mi:ss')">
        </sql:query>

    </c:if>


    <form method="GET" action="index.jsp">
        <input type="hidden" name="menu" value="passagen"/>
        <table class="table table-sm">
            <c:forEach var="passagier" begin="0" items="${passagier.rows}">
                <input type="hidden" name="passagiernummer" value="${passagier.passagiernummer}">
                <tr>
                    <td scope="col">Versicherungsnummer</td>
                    <td>
                        <input class="form-control form-control-sm" type="text" id="versicherungsnummer"
                               name="versicherungsnummer" value="${passagier.Versicherungsnummer}" readonly/>
                    </td>
                        <%--                    <td>${passagier.Versicherungsnummer}</td>--%>
                </tr>

                <tr>
                    <td scope="col">Geburtsdatum</td>
                    <td>
                        <input class="form-control form-control-sm" type="date" id="geburtsdatum"
                               name="geburtsdatum" value="${param.geburtsdatum}" readonly/>
                            <%--                        <fmt:formatDate value="${passagier.Geburtsdatum}" pattern="yyyy-MM-dd"/>--%>
                    </td>
                </tr>
                <tr>
                    <td scope="col">Vorname</td>
                    <td>
                        <input class="form-control form-control-sm" type="text" id="vorname" name="vorname"
                               value="${passagier.Vorname}" required/>
                    </td>
                </tr>
                <tr>
                    <td scope="col">Nachname</td>
                    <td>
                        <input type="text" class="form-control form-control-sm" id="nachname" name="nachname"
                               value="${passagier.Nachname}" required/>
                    </td>
                </tr>
                <tr>
                    <td scope="col">Postleitzahl</td>
                    <td>
                        <input class="form-control form-control-sm" type="text" id="postleitzahl" name="postleitzahl"
                               value="${passagier.Postleitzahl}" required/>
                    </td>
                </tr>
                <tr>
                    <td scope="col">Strasse</td>
                    <td>
                        <input class="form-control form-control-sm" type="text" id="strasse" name="strasse"
                               value="${passagier.Strasse}" required/>
                    </td>
                </tr>
                <tr>
                    <td scope="col">Hausnummer</td>
                    <td>
                        <input class="form-control form-control-sm" type="text" id="hausnummer" name="hausnummer"
                               value="${passagier.Hausnummer}" required/>
                    </td>
                </tr>
                <tr>
                    <td scope="col">Tel1</td>
                    <td>
                        <input class="form-control form-control-sm" type="text" id="tel1" name="tel1"
                               value="${passagier.Tel1}" required/>
                    </td>
                </tr>
                <tr>
                    <td scope="col">Tel2</td>
                    <td>
                        <input class="form-control form-control-sm" type="text" id="tel2" name="tel2"
                               value="${passagier.Tel2}"/>
                    </td>
                </tr>
                <tr>
                    <td scope="col">Tel3</td>
                    <td>
                        <input class="form-control form-control-sm" type="text" id="tel3" name="tel3"
                               value="${passagier.Tel3}"/>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div class="form-group">
            <button type="submit" class="btn btn-primary float-right">Submit</button>
        </div>
    </form>

</div>