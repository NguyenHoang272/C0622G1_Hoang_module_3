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
    private static final String INSERT_CUSTOMER_SQL = "INSERT INTO customer (customer_type_id,name,date_of_birth,gender,id_card,phone_number, email,address) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_ALL_CUSTOMER = "select * from customer where is_delete = 0";
    private static final String DELETE_CUSTOMER_SQL = "update customer set is_delete = 1  where id = ?;";
    private static final String UPDATE_CUSTOMER_SQL = "update customer set customer_type_id = ?,name= ?,date_of_birth=?,gender=?,id_card=?,phone_number=?, email=?,address=? where id = ?;";
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
            while (rs.next()){
                int id = rs.getInt("id");
                int customerTypeId = rs.getInt("customer_type_id");
                String name = rs.getString("name");
                String dateOfBirth = rs.getString("date_of_birth");
                boolean gender = rs.getBoolean("gender");
                String idCard = rs.getString("id_card");
                String phoneNumber = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");
                customerList.add(new Customer(id,customerTypeId,name,dateOfBirth,gender,idCard,phoneNumber,email,address));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }

    @Override
    public boolean deleteCustomer(int id) {
        boolean delete = false;
       Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CUSTOMER_SQL);
            preparedStatement.setInt(1,id);
            System.out.println(preparedStatement);
            delete = preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return delete;
    }

    @Override
    public void addCustomer(Customer customer) {
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER_SQL);
            preparedStatement.setInt(1, customer.getCustomerType());
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setString(3, customer.getDateOfBirth());
            preparedStatement.setBoolean(4, customer.isGender());
            preparedStatement.setString(5, customer.getIdCard());
            preparedStatement.setString(6, customer.getPhone());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Customer> findCustomerByName(String name) {
        List<Customer> customerListFind = new ArrayList<>();
        List<Customer> customers = getListCustomer();

        for (Customer customer: customers) {
            if(customer.getName().contains(name)){
                customerListFind.add(customer);
            }
        }
        return customerListFind;
    }

    @Override
    public Customer selectCustomer(int id) {
        List<Customer> customers = getListCustomer();
        for (Customer customer: customers) {
            if (customer.getCustomerId()==id){
                return customer;
            }
        }
        return null;
    }

    @Override
    public boolean updateCustomer(Customer customer) {
        boolean updateCustomer = false;
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER_SQL);
            preparedStatement.setInt(1, customer.getCustomerType());
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setString(3, customer.getDateOfBirth());
            preparedStatement.setBoolean(4, customer.isGender());
            preparedStatement.setString(5, customer.getIdCard());
            preparedStatement.setString(6, customer.getPhone());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());
            preparedStatement.setInt(9, customer.getCustomerId());
            System.out.println(preparedStatement);
            updateCustomer = preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return updateCustomer;
    }
}
