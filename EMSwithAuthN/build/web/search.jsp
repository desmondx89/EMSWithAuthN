<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="header.jsp" />
<c:choose>
    <c:when test="${not empty param.idInput}">
        <sql:query dataSource="jdbc.oraDS" var="byID">
            SELECT * FROM HR.EMP WHERE ID='<%=request.getParameter("idInput")%>'
        </sql:query>
    </c:when>
</c:choose>
<c:choose>
    <c:when test="${not empty param.nameInput}">
        <sql:query dataSource="jdbc.oraDS" var="byName">
            SELECT * FROM HR.EMP WHERE LOWER(NAME) LIKE LOWER('<%=request.getParameter("nameInput")%>%')
        </sql:query>
    </c:when>    
</c:choose>
<c:choose>
    <c:when test="${not empty param.deptInput}">
        <sql:query dataSource="jdbc.oraDS" var="byDept">
            SELECT * FROM HR.EMP WHERE DEPT='<%=request.getParameter("deptInput")%>'
        </sql:query>
    </c:when>    
</c:choose>

<body>
    <h2>Employee Search Function </h2>
    <!--<h2><%=request.getAttribute("searchResult")%></h2>-->
    <!--<form action="functionPage.jsp" method="POST">-->

    <form action="search.jsp" method="POST">
        <table class="searchTable">
            <tr>
                <td class="searchRow">
                    <label>Search by Employee ID</label>
                </td>
                <td class="searchRow">
                    <input type="text" id="idInput" name="idInput">
                </td>
            </tr>

            <tr>
                <td class="searchRow">
                    <label>Search by Employee Name</label>
                </td>
                <td class="searchRow">
                    <input type="text" id="nameInput" name="nameInput">
                </td>
            </tr>

            <tr>
                <td class="searchRow">
                    <label>Search by Employee Department</label>
                </td>
                <td class="searchRow">
                    <input type="text" id="deptInput" name="deptInput">
                </td>
            </tr>
            <tr>
                <td align="center"><input type="reset" value="Reset"</td>
                <td align="center"><input type="submit" name="action" value="Submit"</td>
            </tr>

        </table>
    </form>    
    <br>


    <table>
        <c:if test="${not empty param.idInput}">
            <tr class="tableHeader">
                <th>ID</th>
                <th>NAME</th>
                <th>EMAIL</th>
                <th>DEPARTMENT</th>
                <th>SALARY</th>
                <th colspan='2'>FUNCTIONS</th>
            </tr>
        </c:if>
        <c:forEach var="row" items="${byID.rows}">
            <tr>
            <form action="functionPage.jsp" method="POST">
                <%
                    String usrName = session.getAttribute("user").toString();
                    if (usrName.equals("admin")) {
                %>
                <td><input style="background-color: black; color: white; border: 0px; text-align: center;" type="text" name="duid" value="${row.id}" readonly="true" onfocus="blur()"/></td>
                <td><input type="text" name="duname" value="${row.name}" contenteditable="true"/></td>
                <td><input type="text" name="duemail" value="${row.email}" contenteditable="true"/></td>
                <td><input type="text" name="dudept" value="${row.dept}" contenteditable="true"/></td>
                <td><input type="text" name="dusalary" value="${row.salary}" contenteditable="true"/></td>
                <td>
                    <!--<input type="submit" name="action" value="Delete">-->
                    <input type="submit" name="action" value="Update">
                </td>

                <%
                } else {
                %>
                <td><input class="tdUser" type="text" name="duid" value="${row.id}" readonly="true" onfocus="blur()"/></td>
                <td><input class="tdUser" type="text" name="duname" value="${row.name}" readonly="true" onfocus="blur()"/></td>
                <td><input class="tdUser" type="text" name="duemail" value="${row.email}" readonly="true" onfocus="blur()"/></td>
                <td><input class="tdUser" type="text" name="dudept" value="${row.dept}" readonly="true" onfocus="blur()"/></td>
                <td><input class="tdUser" type="text" name="dusalary" value="${row.salary}" readonly="true" onfocus="blur()"/></td>
                <td>
                    <input style="background-color: black; color: white; border: 0px;" align="center" type="text" contenteditable="false" value="Insufficient Access Rights">
                </td>
                <%
                    }
                %>
            </form>
        </tr>
    </c:forEach>
</table>


<table>
    <c:if test="${not empty param.nameInput}">
        <tr class="tableHeader">
            <th>ID</th>
            <th>NAME</th>
            <th>EMAIL</th>
            <th>DEPARTMENT</th>
            <th>SALARY</th>
            <th colspan='2'>FUNCTIONS</th>
        </tr>
    </c:if>
    <c:forEach var="row" items="${byName.rows}">
        <tr>
        <form action="functionPage.jsp" method="POST">
            <%
                String usrName1 = session.getAttribute("user").toString();
                if (usrName1.equals("admin")) {
            %>
            <td><input style="background-color: black; color: white; border: 0px; text-align: center;" type="text" name="duid" value="${row.id}" readonly="true" onfocus="blur()"/></td>
            <td><input type="text" name="duname" value="${row.name}" contenteditable="true"/></td>
            <td><input type="text" name="duemail" value="${row.email}" contenteditable="true"/></td>
            <td><input type="text" name="dudept" value="${row.dept}" contenteditable="true"/></td>
            <td><input type="text" name="dusalary" value="${row.salary}" contenteditable="true"/></td>
            <td>
                <!--<input type="submit" name="action" value="Delete">-->
                <input type="submit" name="action" value="Update">
            </td>

            <%
            } else {
            %>
            <td><input class="tdUser" type="text" name="duid" value="${row.id}" readonly="true" onfocus="blur()"/></td>
            <td><input class="tdUser" type="text" name="duname" value="${row.name}" readonly="true" onfocus="blur()"/></td>
            <td><input class="tdUser" type="text" name="duemail" value="${row.email}" readonly="true" onfocus="blur()"/></td>
            <td><input class="tdUser" type="text" name="dudept" value="${row.dept}" readonly="true" onfocus="blur()"/></td>
            <td><input class="tdUser" type="text" name="dusalary" value="${row.salary}" readonly="true" onfocus="blur()"/></td>
            <td>
                <input style="background-color: black; color: white; border: 0px;" align="center" type="text" contenteditable="false" value="Insufficient Access Rights">
            </td>
            <%
                }
            %>
        </form>
    </tr>
</c:forEach>
</table>

<table>
    <c:if test="${not empty param.deptInput}">
        <tr class="tableHeader">
            <th>ID</th>
            <th>NAME</th>
            <th>EMAIL</th>
            <th>DEPARTMENT</th>
            <th>SALARY</th>
            <th colspan='2'>FUNCTIONS</th>
        </tr>
    </c:if>
    <c:forEach var="row" items="${byDept.rows}">
        <tr>
        <form action="functionPage.jsp" method="POST">
            <%
                String usrName2 = session.getAttribute("user").toString();
                if (usrName2.equals("admin")) {
            %>
            <td><input style="background-color: black; color: white; border: 0px; text-align: center;" type="text" name="duid" value="${row.id}" readonly="true" onfocus="blur()"/></td>
            <td><input type="text" name="duname" value="${row.name}" contenteditable="true"/></td>
            <td><input type="text" name="duemail" value="${row.email}" contenteditable="true"/></td>
            <td><input type="text" name="dudept" value="${row.dept}" contenteditable="true"/></td>
            <td><input type="text" name="dusalary" value="${row.salary}" contenteditable="true"/></td>
            <td>
                <!--<input type="submit" name="action" value="Delete">-->
                <input type="submit" name="action" value="Update">
            </td>

            <%
            } else {
            %>
            <td><input class="tdUser" type="text" name="duid" value="${row.id}" readonly="true" onfocus="blur()"/></td>
            <td><input class="tdUser" type="text" name="duname" value="${row.name}" readonly="true" onfocus="blur()"/></td>
            <td><input class="tdUser" type="text" name="duemail" value="${row.email}" readonly="true" onfocus="blur()"/></td>
            <td><input class="tdUser" type="text" name="dudept" value="${row.dept}" readonly="true" onfocus="blur()"/></td>
            <td><input class="tdUser" type="text" name="dusalary" value="${row.salary}" readonly="true" onfocus="blur()"/></td>
            <td>
                <input style="background-color: black; color: white; border: 0px;" align="center" type="text" contenteditable="false" value="Insufficient Access Rights">
            </td>
            <%
                }
            %>
        </form>
    </tr>
</c:forEach>
</table>
<br>
<br>

<!--In order to return to home page or log out-->
<table>
    <tr>
        <td style="align-content: center; vertical-align: center;">
            <form action="home.jsp" method="POST">
                <input type="submit" value="Return to Home">
            </form>
        </td>
        <td style="align-content: center; vertical-align: center;">
            <form action="EMSServlet" method="POST">
                <input type="hidden" name="userid" value='<%=request.getAttribute("user")%>'  />
                <input type="submit" name="action" value="Logout" />
            </form>
        </td>
    </tr>
</table>

<!--Script to disable the other fields-->                
<script type="text/javascript">

    var input1 = document.getElementById("idInput");
    input1.oninput = function () {
        document.getElementById("nameInput").disabled = this.value != "";
        document.getElementById("deptInput").disabled = this.value != "";
    }

    var input2 = document.getElementById("nameInput");
    input2.oninput = function () {
        document.getElementById("idInput").disabled = this.value != "";
        document.getElementById("deptInput").disabled = this.value != "";
    }

    var input3 = document.getElementById("deptInput");
    input3.oninput = function () {
        document.getElementById("idInput").disabled = this.value != "";
        document.getElementById("nameInput").disabled = this.value != "";
    }

</script>

</body>

<jsp:include page="footer.jsp"/>
