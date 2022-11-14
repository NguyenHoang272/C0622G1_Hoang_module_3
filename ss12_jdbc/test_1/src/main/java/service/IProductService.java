package service;

import model.Category;
import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> getListProduct();
    List<Category> getListCategory();
    boolean addProduct (Product newProduct);
    boolean deleteProduct(int idDelete);
    List<Product> searchProduct (String productNameSearch, String priceSearch );

}
