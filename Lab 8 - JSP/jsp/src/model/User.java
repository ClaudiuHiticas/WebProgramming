package model;


import dataBase.ConnectionProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class User {
    static Connection con;
    static PreparedStatement ps;


    private String username;
    private String password;

    public Board board;
    private Double id;

    public User() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public User(Double id){
        this.id = id;
        this.board = new Board();
    }

    public Double getUserId() {
        return this.id;
    }

    public boolean isUser(String username)
    {
        try {
            con = ConnectionProvider.getCon();
            ps = con.prepareStatement("select * from users where username=?");
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            while(rs.next())
            {
                if(rs.getString(1).equals(username))
                {
                    return true;
                }
            }
            return false;
        }
        catch (Exception e)
        {
            System.out.println(e);
        }
        return false;
    }

    public void registerUser(String sUsername, String sUserPassword)
    {
        try
        {
            con = ConnectionProvider.getCon();
            ps = con.prepareStatement("insert into users value(?,?)");
            ps.setString(1, sUsername);
            ps.setString(2,sUserPassword);
            ps.execute();
            this.username = sUsername;
            this.password = sUserPassword;
        }
        catch (Exception e)
        {
            System.out.println(e);
        }
    }

}