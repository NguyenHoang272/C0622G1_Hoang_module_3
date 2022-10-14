package repository;

import model.person.Employee;

import java.util.List;

public interface IRepoEmployees {
    List<Employee> getListEmployees();

    void addEmployee(Employee newEmployee);

    Employee selectEmployee(int id);

    boolean updateEmployee(Employee employee);

    boolean deleteEmployee(int id);

    List<Employee> selectEmployeeByName(String search);
}
