package servlet;

import model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet",urlPatterns = "/list")
public class CustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer(1,"Mai Văn Hoàn","1983-08-20","Hà Nội","https://didongviet.vn/dchannel/wp-content/uploads/2022/01/cute-didongviet.jpg"));
        request.setAttribute("customerList",customerList);
        request.getRequestDispatcher("/result.jsp").forward(request,response);
    }
}
