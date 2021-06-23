<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<sql:setDataSource driver="oracle.jdbc.driver.OracleDriver" url="jdbc:oracle:thin:@localhost:1521/xepdb1"
                   user="csdc22bb_08" password="Toox1aa"/>

<div>
    <h2>Login</h2>
</div>
<div>
    <form method="GET" action="index.jsp">
        <input type="hidden" name="menu" value="user"/>
        <table class="table table-sm">
            <tr>
                <td>
                    <label for="versicherungsnummer">Versicherungsnummer</label>
                </td>
                <td>
                    <input class="form-control form-control-sm" type="number" min="1000" max="9999"
                           id="versicherungsnummer"
                           name="versicherungsnummer" required/>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="geburtsdatum">Geburtsdatum</label>
                </td>
                <td>
                    <input class="form-control form-control-sm" type="date" id="geburtsdatum" name="geburtsdatum"
                           required/>
                </td>
            </tr>
        </table>
        <div class="form-group">
            <button type="submit" class="btn btn-primary float-right">Login</button>
        </div>
    </form>
</div>