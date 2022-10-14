package service.impl;

import model.person.Customer;
import repository.IRepoCustomer;
import repository.impl.RepoCustomer;
import service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    private IRepoCustomer repoCustomer = new RepoCustomer();

    @Override
    public List<Customer> getListCustomer() {
        return repoCustomer.getListCustomer();
    }

    @Override
    public boolean deleteCustomer(int id) {
        return repoCustomer.deleteCustomer(id);
    }

    @Override
    public void addCustomer(Customer customer) {
        repoCustomer.addCustomer(customer);
    }

    @Override
    public List<Customer> findByCustomerByName(String name) {
        return repoCustomer.findCustomerByName(name);
    }

    @Override
    public Customer selectCustomer(int id) {
        return repoCustomer.selectCustomer(id);
    }

    @Override
    public boolean updateCustomer(Customer customer) {
        return repoCustomer.updateCustomer(customer);
    }
}
