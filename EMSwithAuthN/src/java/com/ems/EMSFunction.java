/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ems;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.annotation.Resource;
import javax.ejb.Stateless;
import javax.sql.DataSource;

/**
 *
 * @author Desmond
 */
@Stateless
public class EMSFunction {

    @Resource(name = "jdbc.oraDS")

    DataSource ds;

    Connection conn;

    public boolean loginCheck(String userid) throws SQLException {
        conn = ds.getConnection();
        String stmt = "SELECT INUSE from HR.AUTH_TBL where USERID='" + userid + "'";

        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(stmt);

        if (rs.next()) {
            if (rs.getInt(1) == 1) {
                System.out.println("User is already logged in.." + rs.getInt(1));
                conn.close();
                return true;
            }

        }
        conn.close();
        return false;
    }

    public void setLoginStatus(String userid) throws SQLException {
        conn = ds.getConnection();
        String stmt = "UPDATE HR.AUTH_TBL SET INUSE=1 WHERE USERID='" + userid + "'";
        Statement st = conn.createStatement();
        st.executeUpdate(stmt);
        conn.close();
    }

    public void setLogoutStatus(String userid) throws SQLException {
        conn = ds.getConnection();
        String stmt = "UPDATE HR.AUTH_TBL SET INUSE=0 WHERE USERID='" + userid + "'";
        Statement st = conn.createStatement();
        st.executeUpdate(stmt);
        conn.close();
    }

    public String login(String userid, String pwd) throws SQLException {
        conn = ds.getConnection();
        String stmt = "SELECT USERNAME FROM HR.AUTH_TBL WHERE USERID='" + userid + "' and PASSWORD='" + pwd + "'";
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(stmt);

        if (rs.next()) {
            String user = rs.getString(1);
            System.out.println("Username = " + user);
            conn.close();
            return user.trim();
        } else {
            conn.close();
            System.out.println("Invalid Credentials");
            return "Invalid";
        }
    }
}
