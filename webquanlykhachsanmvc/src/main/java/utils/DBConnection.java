package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnection {

    private static String UserName = "sa";

    private static String PassWord = "123";

    private static String DataBaseName = "QuanLyKhachSan";

    private static String ServerName = "localhost";

    private static String DriverClass =
            "com.microsoft.sqlserver.jdbc.SQLServerDriver";

    private static String DriverURL =
            "jdbc:sqlserver://localhost:1433;"
            + "databaseName=QuanLyKhachSan;"
            + "user=sa;"
            + "password=123;"
            + "encrypt=false;"
            + "trustServerCertificate=true;";

    private static Connection cnn = null;

    private static Statement stm = null;

    static {

        try {

            Class.forName(DriverClass);

            System.out.println("LOAD DRIVER SUCCESS");

        } catch (Exception ex) {

            System.out.println("LOAD DRIVER FAIL");

            ex.printStackTrace();
        }
    }

    public static Connection getConnection() {

        try {

            if (cnn == null || cnn.isClosed()) {

                cnn = DriverManager.getConnection(DriverURL);

                stm = cnn.createStatement();

                System.out.println("KET NOI SQL THANH CONG");
            }

        } catch (Exception ex) {

            System.out.println("LOI KET NOI SQL");

            ex.printStackTrace();
        }

        return cnn;
    }

    public static void closeConnection() {

        try {

            if (stm != null) {

                stm.close();
            }

            if (cnn != null) {

                cnn.close();
            }

        } catch (SQLException ex) {

            ex.printStackTrace();
        }
    }
}