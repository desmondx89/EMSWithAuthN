

<jsp:include page="header.jsp" />
    <body>
        <form action="EMSServlet" method="POST">
            <label>
                <%= request.getAttribute("status") != null ? "User is already logged in " + request.getAttribute("status") : ""%>
            </label>    
            <table style="align-content: center">
                <tr>
                    <td colspan="2">
                        <label style="color: red; font-weight: bold;">
                            <%= request.getAttribute("Error!") != null ? "Invalid Credentials" : ""%> 
                        </label>
                    </td>
                </tr>

                <tr>
                    <td>
                        Enter Username: 
                    </td>
                    <td>
                        <input type="text" name="username"/>
                    </td>
                </tr>

                <tr>
                    <td>
                        Enter Password: 
                    </td>
                    <td>
                        <input type="text" name="pwd"/>
                    </td>
                </tr>
                <tr>
                    <td align="center"><input type="reset" value="Reset"</td>
                    <td align="center"><input type="submit" name="action" value="Login"</td>
                </tr>
            </table>
        </form>
    </body>
<jsp:include page="footer.jsp" />