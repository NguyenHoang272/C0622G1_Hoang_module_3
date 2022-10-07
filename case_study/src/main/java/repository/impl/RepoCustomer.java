package repository.impl;

import model.person.Customer;
import repository.IRepoCustomer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RepoCustomer implements IRepoCustomer {
    private static final String INSERT_CUSTOMER_SQL = "INSERT INTO customer ( customer_type_id, name,date_of_birth,gender,id_card,phone_number,email,address) VALUES ( ?, ?, ?, ?, ? , ?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from customer where id =?";
    private static final String SELECT_ALL_CUSTOMER = "select * from customer";
    private static final String DELETE_CUSTOMER_SQL = "delete from customer where id = ?;";
    private static final String UPDATE_CUSTOMER_SQL = "update customer set name = ?,email= ?, country =? where id = ?;";
    private static final String SELECT_CUSTOMER_BY_COUNTRY = "select * from customer where country like ?";
    private BaseRepository baseRepository = new BaseRepository();

    public RepoCustomer() {
    }

    @Override
    public List<Customer> getListCustomer() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareCall(SELECT_ALL_CUSTOMER);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int customerTypeId = rs.getInt("customer_type_id");
                String name = rs.getString("name");
                String dateOfBirth = rs.getString("date_of_birth");
                boolean gender = rs.getBoolean("gender");
                String idCard = rs.getString("id_card");
                String phoneNumber = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");
                customerList.add(new Customer(id, customerTypeId, name, dateOfBirth, gender, idCard, phoneNumber, email, address));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }

    @Override
    public void addCustomer(Customer newCustomer) {
        Connection connection = baseRepository.getConnection();
        System.out.println(INSERT_CUSTOMER_SQL);
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER_SQL);
            preparedStatement.setString(1, String.valueOf(newCustomer.getCustomerType()));
            preparedStatement.setString(2, newCustomer.getName());
            preparedStatement.setString(3, newCustomer.getDateOfBirth());
            preparedStatement.setBoolean(4, newCustomer.isGender());
            preparedStatement.setString(5, newCustomer.getIdCard());
            preparedStatement.setString(6, newCustomer.getPhone());
            preparedStatement.setString(7, newCustomer.getEmail());
            preparedStatement.setString(8, newCustomer.getAddress());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}

