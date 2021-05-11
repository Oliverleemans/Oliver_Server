package domain.model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class Product {
    private String name;
    private String type;
    private double price;
    private LocalDate dateOfPurchase;

    public Product(String name, String type, double price, LocalDate dateOfPurchase) {
        this.setName(name);
        this.setType(type);
        this.setPrice(price);
        this.setDateOfPurchase(dateOfPurchase);
    }

    public Product() {}

    public void setName(String name) {
        if (name == null || name.trim().isEmpty()) {
            throw new IllegalArgumentException("Voer een geldige naam in!");
        }
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setType(String type) {
        if (type == null || type.equals("select")) {
            throw new IllegalArgumentException("Selecteer een geldig type!");
        }
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public String getTypeImage() {
        return "<img src='images/icons/" + this.getType() + ".svg'>";
    }

    public void setPrice(double price) {
        if (price < 0) {
            throw new IllegalArgumentException("Voer een geldige prijs in!");
        }
        this.price = price;
    }

    public double getPrice() {
        return price;
    }

    public void setDateOfPurchase(LocalDate dateOfPurchase) {
        if (dateOfPurchase == null) throw new IllegalArgumentException("Voer een geldige datum in!");
        if (dateOfPurchase.isAfter(LocalDate.now())) {
            throw new IllegalArgumentException("De datum mag niet in de toekomst liggen!");
        }
        this.dateOfPurchase = dateOfPurchase;
    }

    public LocalDate getDateOfPurchase() {
        return dateOfPurchase;
    }

    public String getFormattedDateOfPurchase() {
        return dateOfPurchase.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
    }

    public String toString() {
        return "'" + name + "'" + " dat werd gekocht op " + dateOfPurchase + "\n voor €" + price;
    }
}




