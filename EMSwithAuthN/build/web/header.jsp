<%-- 
    Document   : header
    Created on : 1 Feb, 2021, 3:19:44 PM
    Author     : Desmond
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Management System</title>
        <link href="css/emswa.css" rel="stylesheet" type="text/css"/>

    <table width="100%">
        <tr>
        <h1>EMPLOYEE MANAGEMENT SYSTEM</h1>
        <br>
        </tr>
        <tr>
            Welcome <% 
                if(session.getAttribute("user")==null){
                    out.println("Guest");
                }else{
                    out.println(session.getAttribute("user").toString().substring(0, 1).toUpperCase() + session.getAttribute("user").toString().substring(1));
                }
            %> 
        </tr>
        <br>
    </table>
    <br>
</head>
