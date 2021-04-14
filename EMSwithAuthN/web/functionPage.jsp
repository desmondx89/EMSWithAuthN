<%-- 
    Document   : functionPage
    Created on : 1 Feb, 2021, 12:23:06 PM
    Author     : Desmond
--%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="header.jsp"/>
    <body>
        <sql:setDataSource var="myDB" dataSource="jdbc.oraDS"/>
        <c:set var="actionValue" value='<%=request.getParameter("action")%>'/>
        <c:if test="${actionValue=='Add'}">
            <sql:update dataSource="${myDB}" var="count">
                INSERT INTO HR.EMP(ID,NAME,EMAIL,DEPT,SALARY) VALUES 
                (
                '<%=request.getParameter("aid")%>',
                '<%=request.getParameter("name")%>',
                '<%=request.getParameter("email")%>',
                '<%=request.getParameter("dept")%>',
                '<%=request.getParameter("salary")%>'
                )
            </sql:update>
        </c:if>
        <c:if test="${actionValue=='Update'}">
            <sql:update dataSource="${myDB}" var="count">
                UPDATE HR.EMP SET ID = '<%=request.getParameter("duid") %>',
                                  NAME = '<%=request.getParameter("duname") %>',
                                  EMAIL ='<%=request.getParameter("duemail") %>', 
                                  DEPT = '<%= request.getParameter("dudept") %>', 
                                  SALARY = '<%=request.getParameter("dusalary") %>' 
                WHERE ID = '<%=request.getParameter("duid")%>'
            </sql:update>
        </c:if>
        <c:if test="${actionValue=='Delete'}">
            <sql:update dataSource="${myDB}" var="count">
                DELETE HR.EMP WHERE ID = '<%=request.getParameter("duid")%>'
            </sql:update>
        </c:if>
        
                
                
        <%
//            request.setAttribute("searchResult", "desmond");
//        request.getRequestDispatcher("search.jsp").forward(request, response);
        request.getRequestDispatcher("home.jsp").forward(request, response);
        %>
        
    </body>
</html>
