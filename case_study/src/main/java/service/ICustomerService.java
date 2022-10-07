package service;

import model.person.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> getListCustomer();
    void addCustomer(Customer newCustomer);
}
