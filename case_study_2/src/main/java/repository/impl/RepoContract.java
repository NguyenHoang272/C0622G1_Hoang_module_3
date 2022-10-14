package repository.impl;

import model.Contract;
import repository.IRepoContract;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class RepoContract implements IRepoContract {
    private BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_CONTRACT = "SELECT * FROM demo";
    @Override
    public List<Contract> getListContract() {
        List<Contract> contractList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CONTRACT);
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(preparedStatement);
            while (rs.next()){
                int id = rs.getInt("id");
                int facilityId = rs.getInt("facility_id");
                String name = rs.getString("name");
                String startDay = rs.getString("start_date");
                String endDay = rs.getString("end_date");
                double deposit = rs.getDouble("deposit");
                double totalPrice = rs.getDouble("total_price");
                contractList.add(new Contract(id,facilityId,name,startDay,endDay,deposit,totalPrice));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return contractList;
    }
}
