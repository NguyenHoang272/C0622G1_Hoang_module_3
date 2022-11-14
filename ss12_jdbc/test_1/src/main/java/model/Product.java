package model;

public class Product {
    private int id;
    private String productName;
    private double price;
    private int quantity;
    private String color;
    private String description;
    private int category_id;

    public Product() {
    }

    public Product(int id, String productName, double price, int quantity, String color, String description, int category_id) {
        this.id = id;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.color = color;
        this.description = description;
        this.category_id = category_id;
    }


    public Product(String productName, double price, int quantity, String color, String description, int category_id) {
//        this.id = id;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.color = color;
        this.description = description;
        this.category_id = category_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }
}
