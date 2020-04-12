/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.petru.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Petru
 */
public class DbConnection {
    
    private static DbConnection instance;
    private Connection connection;
    private String url = "jdbc:mysql://localhost:3306/webdb?useUnicode=true&characterEncoding=utf8&useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC";
    private String username = "root";
    private String password = "1234";

    private DbConnection() throws SQLException {
        try {
            this.connection = (Connection) DriverManager.getConnection(url, username, password);
            System.out.println("Connected to DataBase!!!");
        } catch (Exception ex) {
            System.out.println("Database Connection Failed : " + ex.getMessage());
        }
    }

    public Connection getConnection() {
        return connection;
    }

    synchronized public static DbConnection getInstance() throws SQLException {
        if (instance == null) {
            instance = new DbConnection();
        }else {
            if (instance.getConnection().isClosed()) instance = new DbConnection();
        }
        
              return instance;
    
    }
}
