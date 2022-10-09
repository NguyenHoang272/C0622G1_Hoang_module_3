package controller;

import model.person.Employee;
import service.IEmployeeService;
import service.impl.EmployeeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "EmployeesServlet", urlPatterns = "/employees")
public class EmployeesServlet extends HttpServlet {
    private IEmployeeService employeeService = new EmployeeService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                create(request, response);
                break;
            case "edit":
                edit(request, response);
                break;
            default:
                listCustomer(request, response);
                break;
        }
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("birthday");
        String idCard = request.getParameter("id-card");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phonenumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int educationId = Integer.parseInt(request.getParameter("educationId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        String username = request.getParameter("username");
        Employee newEmployee = new Employee(id,name, dateOfBirth, idCard, salary, phone, email, address, positionId, educationId, divisionId, username);
        employeeService.updateEmployee(newEmployee);
        try {
            request.getRequestDispatcher("view/edit_employees.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("birthday");
        String idCard = request.getParameter("id-card");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phonenumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int educationId = Integer.parseInt(request.getParameter("educationId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        String username = request.getParameter("username");
        Employee newEmployee = new Employee(name, dateOfBirth, idCard, salary, phone, email, address, positionId, educationId, divisionId, username);
        employeeService.addEmployee(newEmployee);
        try {
            request.getRequestDispatcher("view/add_employees.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showNewForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteEmployees(request, response);
                break;
            case "find":
                findEmployees(request, response);
                break;
            default:
                listCustomer(request, response);
                break;
        }
    }

    private void findEmployees(HttpServletRequest request, HttpServletResponse response) {
        String search = request.getParameter("search");
        List<Employee> employeeList = employeeService.selectEmployeeByName(search);
        request.setAttribute("listEmployees",employeeList);
        try {
            request.getRequestDispatcher("view/employees.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/add_employees.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee existEmployee = employeeService.selectEmployee(id);
        try {
            request.setAttribute("employee",existEmployee);
            request.getRequestDispatcher("view/edit_employees.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteEmployees(HttpServletRequest request, HttpServletResponse response) {
       int id = Integer.parseInt(request.getParameter("id"));
       employeeService.deleteEmployee(id);
       List<Employee> list = employeeService.getListEmployees();
       request.setAttribute("listEmployees",list);
        try {
            request.getRequestDispatcher("view/employees.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> list = employeeService.getListEmployees();
        request.setAttribute("listEmployees", list);
        try {
            request.getRequestDispatcher("view/employees.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
