package controller;

import model.person.Customer;
import model.person.Employee;
import service.ICustomerService;
import service.impl.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    private ICustomerService customerService = new CustomerService();
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
//            case "edit":
//                edit(request, response);
//                break;
            default:
                listCustomer(request, response);
                break;
        }
    }
    private void create(HttpServletRequest request, HttpServletResponse response) {
        int customerType = Integer.parseInt(request.getParameter("customerType"));
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("birthday");
        boolean gender= Boolean.parseBoolean(request.getParameter("gender"));
        String idCard = request.getParameter("id-card");
        String phone = request.getParameter("phonenumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer newCustomer = new Customer(  customerType,  name,  dateOfBirth,  gender,  idCard,  phone,  email,  address);
        customerService.addCustomer(newCustomer);
        try {
            request.getRequestDispatcher("view/add_customer.jsp").forward(request, response);
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
//                case "edit":
//                    showEditForm(request, response);
//                    break;
//                case "delete":
//                    deleteCustomer(request, response);
//                    break;
            default:
                listCustomer(request, response);
                break;
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/add_customer.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customers = customerService.getListCustomer();
        request.setAttribute("listCustomer",customers);
        try {
            request.getRequestDispatcher("view/customer.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

