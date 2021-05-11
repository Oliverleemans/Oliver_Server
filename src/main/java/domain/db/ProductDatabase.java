package domain.db;

import domain.model.Product;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class ProductDatabase {
    private static ArrayList<Product> products = new ArrayList<>();

    public ProductDatabase() {
        this.addProduct(new Product("Razer Deathadder V2 Pro", "mouse", 139.99, LocalDate.of(2021, 02, 10)));
        this.addProduct(new Product("Razer Huntsman Elite", "keyboard", 209.59, LocalDate.of(2021, 01, 17)));
        this.addProduct(new Product("MSI Optix G27CQ4", "monitor", 329.00, LocalDate.of(2021, 02, 10)));
    }

    public ArrayList<Product> getAllProducts() {
        return products;
    }

    public void addProduct(Product product) {
        if (product == null)
            throw new IllegalArgumentException("Voer een geldig product in!");
        if (findProduct(product.getName()) != null)
            throw new IllegalArgumentException("Dit product is al toegevoegd aan de lijst!");
        products.add(product);
    }

    public void removeProduct(String name) {
        products.remove(findProduct(name));
    }

    public static Product findProduct(String name) {
        if (name == null || name.trim().isEmpty())
            throw new IllegalArgumentException("Voer een geldige naam in!");
        for (Product product : products) {
            if (product.getName().equals(name))
                return product;
        }
        return null;
    }

    public static Product getMostExpensiveProduct() {
        if (products.size() == 0)
            return null;
        Product mostExpensive = products.get(0);
        for (Product product : products) {
            if (product.getPrice() > mostExpensive.getPrice())
                mostExpensive = product;
        }
        return mostExpensive;
    }

    public void editProduct(Product product, String name) {
        Product editedProduct = ProductDatabase.findProduct(name);
        editedProduct.setName(product.getName());
        editedProduct.setType(product.getType());
        editedProduct.setPrice(product.getPrice());
        editedProduct.setDateOfPurchase(product.getDateOfPurchase());
    }
}