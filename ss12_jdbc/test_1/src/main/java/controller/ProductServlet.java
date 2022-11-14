package controller;

import service.impl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;

@WebServlet(name = "ProductServlet", urlPatterns = "/product")
public class ProductServlet extends HttpServlet {
    ProductService productService = new ProductService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "deleteProduct":
                deleteProduct(request, response);
                break;
            default:
                showProdctList(request,response);
                break;
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int idDelete = Integer.parseInt(request.getParameter("idDelete"));
        String mess = "Delete Successfully!";

        if (!productService.deleteProduct(idDelete)) {
            mess = "Delete Failed!";
        }
        request.setAttribute("mess", mess);
        request.setAttribute("productList",productService.getListProduct());
        request.setAttribute("categoryList",productService.getListCategory());

        try {
            request.getRequestDispatcher("/view/product/product.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            default:
                showProdctList(request, response);
        }
    }

    private void showProdctList(HttpServletRequest request, HttpServletResponse response) {

        request.setAttribute("productList", productService.getListProduct());
        request.setAttribute("categoryList", productService.getListCategory());

        try {
            request.getRequestDispatcher("view/product/product.jsp").forward(request, response);
        } catch (IOException | ServletException e) {
            e.printStackTrace();
        }
    }
}
