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
    public void addCustomer(Customer newCustomer) {
        repoCustomer.addCustomer(newCustomer);
    }

}
