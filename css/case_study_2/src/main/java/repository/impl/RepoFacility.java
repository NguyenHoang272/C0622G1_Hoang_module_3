package repository.impl;

import model.facility.Facility;
import repository.IRepoFacility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RepoFacility implements IRepoFacility {
    private BaseRepository baseRepository = new BaseRepository();
    private static final String INSERT_FACILITY_SQL = "INSERT INTO facility (name, area, cost, max_people, standard_room, description_other_convenience, pool_area, number_of_floors,facility_free ,rent_type_id, facility_type_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_ALL_FACILITY = "select * from facility where is_delete = 0;";
    private static final String DELETE_FACILITY_SQL = "update facility set is_delete = 1 where id = ?;";
    private static final String UPDATE_FACILITY_SQL = "update facility set name = ?,area=?,cost =?,max_people=?,standard_room=?, description_other_convenience= ?, pool_area =?,number_of_floors=?,facility_free=?,rent_type_id =?, facility_type_id =? where id =?;";

    @Override
    public List<Facility> getListService() {
        List<Facility> facilityList = new ArrayList<>();

        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_FACILITY);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int area = rs.getInt("area");
                double price = rs.getDouble("cost");
                int maxPeople = rs.getInt("max_people");
                int rentTypeId = rs.getInt("rent_type_id");
                int facilityTypeId = rs.getInt("facility_type_id");
                String standardRoom = rs.getString("standard_room");
                String descriptionOtherConvenience = rs.getString("description_other_convenience");
                double poolArea = rs.getDouble("pool_area");
                int floors = rs.getInt("number_of_floors");
                String facilityFree = rs.getString("facility_free");
                facilityList.add(new Facility(id, name, area, price, maxPeople, rentTypeId, facilityTypeId, standardRoom, descriptionOtherConvenience, poolArea, floors, facilityFree));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return facilityList;
    }

    @Override
    public boolean deleteFacility(int id) {
        boolean deleteFacility = false;
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_FACILITY_SQL);
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            deleteFacility = preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return deleteFacility;
    }

    @Override
    public List<Facility> findByName(String search) {
        List<Facility> facilityListFind = new ArrayList<>();
        List<Facility> facilityList = getListService();
        for (Facility item : facilityList) {
            if (item.getServiceName().contains(search)) {
                facilityListFind.add(item);
            }
        }
        return facilityListFind;
    }

    @Override
    public void addFacility(Facility newfacility) {
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_FACILITY_SQL);
            preparedStatement.setString(1,newfacility.getServiceName());
            preparedStatement.setInt(2,newfacility.getUsingArea());
            preparedStatement.setDouble(3,newfacility.getPrice());
            preparedStatement.setInt(4,newfacility.getMaximumPeople());
            preparedStatement.setString(5,newfacility.getStandardRoom());
            preparedStatement.setString(6,newfacility.getDescriptionOtherConvenience());
            preparedStatement.setDouble(7,newfacility.getPoolArea());
            preparedStatement.setInt(8,newfacility.getFloor());
            preparedStatement.setString(9,newfacility.getFacilityFree());
            preparedStatement.setInt(10,newfacility.getRentalType());
            preparedStatement.setInt(11,newfacility.getFacilityType());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    @Override
    public Facility selectFacility(int id) {
        List<Facility> facilityList = getListService();
        for (Facility facility: facilityList) {
            if (facility.getServiceID() == id){
                return facility;
            }
        }
        return null;
    }

    @Override
    public boolean editFacility(Facility newfacility) {
        boolean editFacility = false;
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_FACILITY_SQL);
            preparedStatement.setString(1,newfacility.getServiceName());
            preparedStatement.setInt(2,newfacility.getUsingArea());
            preparedStatement.setDouble(3,newfacility.getPrice());
            preparedStatement.setInt(4,newfacility.getMaximumPeople());
            preparedStatement.setString(5,newfacility.getStandardRoom());
            preparedStatement.setString(6,newfacility.getDescriptionOtherConvenience());
            preparedStatement.setDouble(7,newfacility.getPoolArea());
            preparedStatement.setInt(8,newfacility.getFloor());
            preparedStatement.setString(9,newfacility.getFacilityFree());
            preparedStatement.setInt(10,newfacility.getRentalType());
            preparedStatement.setInt(11,newfacility.getFacilityType());
            preparedStatement.setInt(12, newfacility.getServiceID());
            System.out.println(preparedStatement);
            editFacility = preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return editFacility;
    }

    @Override
    public List<Facility> find(String search, int type) {
        List<Facility> facilityList = getListService();
        List<Facility> listFind = new ArrayList<>();
        for (Facility item: facilityList) {
            if (item.getFacilityType()==type && item.getServiceName().contains(search)){
                listFind.add(item);
            }
        }
        return listFind;
    }
}
