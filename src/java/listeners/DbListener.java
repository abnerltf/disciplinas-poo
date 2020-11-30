/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package listeners;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.*;
import models.Disciplina;

/**
 * Web application lifecycle listener.
 *
 * @author root
 */
public class DbListener implements ServletContextListener {
    
    private static final String DB_URL = "jdbc:sqlite:P2AbnerLima.db";
    private static final String CLASS_NAME = "org.sqlite.JDBC";
    
    public static Connection getConnection () throws Exception {
        return DriverManager.getConnection(DB_URL);
    }
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        Connection con = null;
        Statement stmt = null;
        
        try {
            System.out.println("b");Class.forName(CLASS_NAME);
            System.out.println("a");con = getConnection();
            stmt = con.createStatement();
            System.out.println("a");
            stmt.execute(Disciplina.getTableStatement());
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
