package model.service.impl;

import model.model.Category;
import model.model.Product;
import model.repository.impl.ProductRepository;
import model.service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    ProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> getListProduct() {
        return productRepository.getListProduct();
    }

    @Override
    public List<Category> getListCategory() {

        return productRepository.getListCategory();
    }

    @Override
    public boolean addProduct(Product newProduct) {
        return productRepository.addProduct(newProduct);
    }

    @Override
    public List<Product> searchProduct(String productNameSearch, String priceSearch) {
        return productRepository.searchProduct(productNameSearch, priceSearch);
    }

    @Override
    public boolean deleteProduct(int idDelete) {
        return productRepository.deleteProduct(idDelete);
    }
}
