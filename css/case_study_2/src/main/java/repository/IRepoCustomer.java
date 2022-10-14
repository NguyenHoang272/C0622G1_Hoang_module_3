package repository;

import model.person.Customer;

import java.util.List;

public interface IRepoCustomer {
   List<Customer> getListCustomer();

    boolean deleteCustomer(int id);

    void addCustomer(Customer customer);

    List<Customer> findCustomerByName(String name);

    Customer selectCustomer(int id);

    boolean updateCustomer(Customer customer);
}
