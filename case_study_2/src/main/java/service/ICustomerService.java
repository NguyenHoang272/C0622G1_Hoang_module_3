package service;

import model.person.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> getListCustomer();

    boolean deleteCustomer(int id);

    void addCustomer(Customer customer);

    List<Customer> findByCustomerByName(String name);

    Customer selectCustomer(int id);

    boolean updateCustomer(Customer customer);

}
