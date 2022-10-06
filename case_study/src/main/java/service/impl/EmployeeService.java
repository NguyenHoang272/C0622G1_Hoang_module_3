package service.impl;

import model.person.Employee;
import repository.IRepoEmployees;
import repository.impl.RepoEmployees;
import service.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {
    IRepoEmployees repoEmployees = new RepoEmployees();
    @Override
    public List<Employee> getListEmployees() {
        return repoEmployees.getListEmployees();
    }

    @Override
    public void addEmployee(Employee newEmployee) {
        repoEmployees.addEmployee(newEmployee);
    }

    @Override
    public Employee selectEmployee(int id) {
        return repoEmployees.selectEmployee(id);
    }

    @Override
    public boolean updateEmployee(Employee employee) {
        return repoEmployees.updateEmployee(employee);
    }

    @Override
    public boolean deleteEmployee(int id) {
       return repoEmployees.deleteEmployee(id);
    }

    @Override
    public List<Employee> selectEmployeeByName(String search) {

        return repoEmployees.selectEmployeeByName(search);
    }
}
