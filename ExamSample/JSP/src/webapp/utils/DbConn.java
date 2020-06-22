package webapp.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConn implements Utils {
    static Connection con = null;

    public static Connection getConnection()
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
