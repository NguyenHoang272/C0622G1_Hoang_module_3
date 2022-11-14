package repository;

import model.Category;
import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> getListProduct();

    List<Category> getListCategory();

    boolean addProduct(Product newProduct);

    List<Product> searchProduct(String productNameSearch, String priceSearch);

    boolean deleteProduct(int idDelete);
}

