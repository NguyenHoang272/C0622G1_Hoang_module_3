package model.repository.impl;

import model.model.Category;
import model.model.Product;
import model.repository.BaseRepository;
import model.repository.IProductRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    public static final String SELECT_ALL_PRODUCTS = "SELECT * FROM thi_module_3.product;";
    public static final String SELECT_ALL_CATEGORIES = "SELECT * FROM thi_module_3.category;";
    public static final String INSERT_NEW_PRODUCT = "INSERT INTO `thi_module_3`.`product` " +
            "(`product_name`, `price`, `quantity`, `color`, `description`, `category_id`) \n" +
            "VALUES (?, ?, ?, ?, ?, ?);";

    public static final String SEARCH_PRODUCT = "select * from product\n" +
            "where product_name like ? and price like ?;";
    public static final String DELETE_PRODUCT = "DELETE FROM `thi_module_3`.`product` WHERE (`id` = ?);";

    @Override
    public List<Product> getListProduct() {
        List<Product> listProduct = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_PRODUCTS);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String productName = rs.getString("product_name");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                String color = rs.getString("color");
                String description = rs.getString("description");
                int category_id = rs.getInt("category_id");

                listProduct.add(new Product(id, productName, price, quantity, color, description, category_id));
            }

        } catch (SQLException throwAbles) {
            throwAbles.printStackTrace();
        }

        return listProduct;
    }

    @Override
    public List<Category> getListCategory() {

        List<Category> listCategory = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_CATEGORIES);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String categoryName = rs.getString("category_name");

                listCategory.add(new Category(id, categoryName));
            }

        } catch (SQLException throwAbles) {
            throwAbles.printStackTrace();
        }

        return listCategory;

    }

    @Override
    public boolean addProduct(Product newProduct) {
        boolean check = false;
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement ps = connection.prepareStatement(INSERT_NEW_PRODUCT);

            ps.setString(1, newProduct.getProductName());
            ps.setDouble(2, newProduct.getPrice());
            ps.setInt(3, newProduct.getQuantity());
            ps.setString(4, newProduct.getColor());
            ps.setString(5, newProduct.getDescription());
            ps.setInt(6, newProduct.getCategory_id());

            ps.executeUpdate();

            check = true;
        } catch (SQLException throwAbles) {
            throwAbles.printStackTrace();
        }

        return check;
    }

    @Override
    public List<Product> searchProduct(String productNameSearch, String priceSearch) {
        Connection connection = BaseRepository.getConnectDB();
        List<Product> foundProduct = new ArrayList<>();


        try {
            PreparedStatement ps = connection.prepareStatement(SEARCH_PRODUCT);

            ps.setString(1, "%" + productNameSearch + "%");
            ps.setString(2, "%" + priceSearch + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String productName = rs.getString("product_name");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                String color = rs.getString("color");
                String description = rs.getString("description");
                int category_id = rs.getInt("category_id");

                foundProduct.add(new Product(id, productName, price, quantity, color, description, category_id));
            }

        } catch (SQLException throwAbles) {
            throwAbles.printStackTrace();
        }


        return foundProduct;
    }

    @Override
    public boolean deleteProduct(int idDelete) {
        Connection connection = BaseRepository.getConnectDB();
        boolean check = false;

        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_PRODUCT);

            ps.setInt(1, idDelete);

            ps.executeUpdate();

            check = true;

        } catch (SQLException throwAbles) {
            throwAbles.printStackTrace();
        }

        return check;
    }
}