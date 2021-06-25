/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asg.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import static jdk.nashorn.internal.runtime.JSType.isNumber;

/**
 *
 * @author HP
 */
public class DBUtils {
        public static Connection getConnection() throws ClassNotFoundException, SQLException{
        Connection conn = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url="jdbc:sqlserver://localhost:1433;databaseName=WebDatabase6";
        conn=DriverManager.getConnection(url, "sa", "123456");
        return conn;
    }
        
        public static boolean checkFormat(String ID){
            boolean check = false;
            if(ID.startsWith("F-")){
                if(isNumber(ID.charAt(2)) && isNumber(ID.charAt(3)) && isNumber(ID.charAt(4)))
                check = true;
            }
            return check;
        }
}
