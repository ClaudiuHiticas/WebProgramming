package webapp.repository;

import webapp.model.Asset;
import webapp.utils.DbConn;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AssetsRepository {
    private Connection connection;
    private Integer id;

    public AssetsRepository(Integer id) {
        this.connection = DbConn.getConnection();
        this.id = id;
    }

    public ArrayList<Asset> findAll(){
        ArrayList<Asset> assets = new ArrayList<>();
        try{
            Statement statement = connection.createStatement();
            String sql = "select * from Assets where userId= '" + id + "'";
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                assets.add(new Asset
                        (resultSet.getInt("id"),
                        resultSet.getInt("userId"),
                        resultSet.getString("name"),
                        resultSet.getString("description"),
                        resultSet.getInt("value")));
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return assets;
    }


    public void addMany(List<Asset> assets){
        try{
            assets.forEach(a -> {
                PreparedStatement sql = null;
                try {
                    sql = connection.prepareStatement("insert into Assets(userId, name, description, value) values (?,?,?,?)");
                    sql.setInt(1, a.getUserId());
                    sql.setString(2, a.getName());
                    sql.setString(3, a.getDescription());
                    sql.setInt(4, a.getValue());
                    sql.execute();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            });
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}

