package dataBase;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider implements Provider {
    static Connection con = null;

    public static Connection getCon()
    {
        try
        {
            Class.forName(JDBC_DRIVER);
            con = DriverManager.getConnection(DB_URL,DbUser,DbPassword);
        }
        catch (Exception e)
        {
            System.out.println(e);
        }
        return con;
    }
}
