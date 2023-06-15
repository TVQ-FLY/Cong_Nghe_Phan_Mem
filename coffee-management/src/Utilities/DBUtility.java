/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utilities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author huyparody
 */
public class DBUtility {

    public static Connection openConnection() {
        Connection con = null;
        String url = "jdbc:mysql://localhost:3306/db_ql_quancafe?useUnicode=true&characterEncoding=UTF-8";
        String user = "root";
        String password = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
        } catch (Exception er) {
            er.printStackTrace();
        }
        return con;
    }

    public static void closeAll(Connection con, PreparedStatement pstmt, ResultSet rs) {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(DBUtility.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException ex) {
                Logger.getLogger(DBUtility.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(DBUtility.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}


//
//public class DBUtility {
//    public static Connection conn;
//
//    public static void getconnect(){
//        try {
//            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//        } catch (ClassNotFoundException e) {
//            throw new RuntimeException(e);
//        }
//
//        String user = "sa";
//        String pass = "123";
//
//        try {
//            conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName= quanlycoffee ;encrypt=true; trustServerCertificate=true",
//                    user, pass);
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//
//        if(conn == null){
//            System.out.println("Ket noi that bai ");
//        }else{
//            System.out.println("Ket noi thanh cong !!!");
//        }
//    }
//
//    public static void main(String[] args) {
//        getconnect();
//    }
//
//}
//
