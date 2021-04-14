
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="header.jsp" />
<sql:setDataSource var="myDB" dataSource="jdbc.oraDS" />
<sql:query dataSource="jdbc.oraDS" var="rs">
    SELECT ID,NAME,EMAIL,DEPT,SALARY FROM HR.EMP ORDER BY ID
</sql:query>
<sql:query dataSource="jdbc.oraDS" var="auto">
    SELECT (MAX(ID)+1) as MAXID FROM HR.EMP
</sql:query>


<body>
    <a href="search.jsp" class="searchButton">Search</a>
    <br>
    <br>
    <table border='2' width='100%' style='text-align: center'>
        <tr class="tableHeader" style='font-weight: bold; background-color: lightblue'>
            <th>ID</th>
            <th>NAME</th>
            <th>EMAIL</th>
            <th>DEPT</th>
            <th>SALARY</th>
            <th colspan='2'>FUNCTIONS</th>
        </tr>
        <c:forEach var="row" items="${rs.rows}">
            <tr>
            <form action="functionPage.jsp" method="POST">
                <td><input style="background-color: black; color: white; border: 0px; text-align: center;" type="text" name="duid" value="${row.id}" readonly="true" onfocus="blur()"/></td>
                <td><input type="text" name="duname" value="${row.name}" contenteditable="true"/></td>
                <td><input type="text" name="duemail" value="${row.email}" contenteditable="true"/></td>
                <td><input type="text" name="dudept" value="${row.dept}" contenteditable="true"/></td>
                <td><input type="text" name="dusalary" value="${row.salary}" contenteditable="true"/></td>

                <td>
                    <%
                        String usrName = session.getAttribute("user").toString();
                        if (usrName.equals("admin")) {
                    %>
                    <input type="submit" name="action" value="Delete">
                    <input type="submit" name="action" value="Update">
                    <%
                    } else {
                    %>
                    <input style="background-color: black; color: white; border: 0px;" align="center" type="text" contenteditable="false" value="Insufficient Access Rights">
                    <%
                        }
                    %>
            </form>
        </td>
    </tr>

</c:forEach>
<c:forEach var="row" items="${auto.rows}">
    <tr>
    <form action="functionPage.jsp" method="POST">

        <td><input style="background-color: black; color: white; border: 0px; text-align: center;" type="text" name="aid" value="${row.MAXID}" readonly="true" onfocus="blur()"/></td>
        <td><input type="text" name="name"></td>
        <td><input type="text" name="email"></td>
        <td><input type="text" name="dept"></td>
        <td><input type="text" name="salary"></td>
        <td colspan="2"><input type="submit" name="action" value="Add"</td>
    </form>
</c:forEach>
</tr>


</table>


<form action="EMSServlet" method="POST">
    <input type="hidden" name="userid" value='<%=request.getAttribute("user")%>'  />
    <br>   
<!--    Click here to Logout &nbsp;&nbsp;&nbsp; -->
    <input type="submit" name="action" value="Logout" />
</form>

</body>

<jsp:include page="footer.jsp" />
