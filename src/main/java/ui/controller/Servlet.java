package ui.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import domain.model.Product;
import domain.db.ProductDatabase;

@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDatabase database = new ProductDatabase();

    public Servlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
        System.out.println();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String destination;
        String command = request.getParameter("command");
        if (command == null || command.trim().isEmpty())
            command = "";
        switch (command) {
            case "add":
                destination = add(request, response);
                break;
            case "overview":
                destination = overview(request, response);
                break;
            case "confirm":
                destination = getConfirmation();
                break;
            case "delete":
                destination = delete(request, response);
                break;
            case "search":
                destination = search(request, response);
                break;
            case "searchResult":
                destination = searchResult(request, response);
                break;
            case "edit":
                destination = edit(request, response);
                break;
            case "editProduct":
                destination = editProduct(request, response);
                break;
            case "home":
            default:
                destination = home(request, response);
        }
        request.getRequestDispatcher(destination).forward(request, response);
    }

    private String home(HttpServletRequest request, HttpServletResponse response) {
        Product mostExpensiveProduct = database.getMostExpensiveProduct();
        request.setAttribute("mostExpensive", mostExpensiveProduct);

        Cookie visitCount = getCookie(request, "visitCount");
        if (visitCount == null) {
            visitCount = new Cookie("visitCount", "1");
        } else {
            int counter = Integer.parseInt(visitCount.getValue()) + 1;
            visitCount.setValue(Integer.toString(counter));
        }
        response.addCookie(visitCount);
        request.setAttribute("visitCount", visitCount.getValue());
        return "index.jsp";
    }


    private String add(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<String> errors = new ArrayList<String>();
        Product product = new Product();
        setName(product, request, errors);
        setType(product, request, errors);
        setPrice(product, request, errors);
        setDateOfPurchase(product, request, errors);
        if (errors.size() == 0) {
            try {
                database.addProduct(product);
                return overview(request, response);
            }
            catch (IllegalArgumentException exc) {
                request.setAttribute("error", exc.getMessage());
                return "add.jsp";
            }
        }
        else {
            request.setAttribute("errors", errors);
            return "add.jsp";
        }
    }

    private void setName(Product product, HttpServletRequest request, ArrayList<String> errors) {
        String name = request.getParameter("name");
        try {
            product.setName(name);
            request.setAttribute("nameClass", "has-success");
            request.setAttribute("namePreviousValue", name);
        }
        catch (IllegalArgumentException exc) {
            errors.add(exc.getMessage());
            request.setAttribute("nameClass", "has-error");
        }
    }

    private void setType(Product product, HttpServletRequest request, ArrayList<String> errors) {
        String type = request.getParameter("type");
        try {
            product.setType(type);
            request.setAttribute("typeClass", "has-success");
            request.setAttribute("typePreviousValue", type);
        }
        catch (IllegalArgumentException exc) {
            errors.add(exc.getMessage());
            request.setAttribute("typeClass", "has-error");
        }
    }

    private void setPrice(Product product, HttpServletRequest request, ArrayList<String> errors) {
        double price;
        if (request.getParameter("price").trim().isEmpty()) {
            price = 0;
        } else {
            price = Double.parseDouble(request.getParameter("price"));
        }
        try {
            product.setPrice(price);
            request.setAttribute("priceClass", "has-success");
            request.setAttribute("pricePreviousValue", price);
        }
        catch (IllegalArgumentException exc) {
            errors.add(exc.getMessage());
            request.setAttribute("priceClass", "has-error");
        }
    }

    private void setDateOfPurchase(Product product, HttpServletRequest request, ArrayList<String> errors) {
        LocalDate dateOfPurchase;
        if (request.getParameter("dateOfPurchase").trim().isEmpty()) {
            dateOfPurchase = null;
        } else {
            dateOfPurchase = LocalDate.parse(request.getParameter("dateOfPurchase"));
        }
        try {
            product.setDateOfPurchase(dateOfPurchase);
            request.setAttribute("dateOfPurchaseClass", "has-success");
            request.setAttribute("dateOfPurchasePreviousValue", dateOfPurchase);
        }
        catch (IllegalArgumentException exc) {
            errors.add(exc.getMessage());
            request.setAttribute("dateOfPurchaseClass", "has-error");
        }
    }

    private String overview(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("products", database.getAllProducts());
        return "overview.jsp";
    }

    private String delete(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        database.removeProduct(name);
        return overview(request, response);
    }

    private String search(HttpServletRequest request, HttpServletResponse response) {
        return "search.jsp";
    }

    private String searchResult(HttpServletRequest request, HttpServletResponse response) {
        String searchName = request.getParameter("searchName");
        Product product = database.findProduct(searchName);
        if (product == null || searchName == null || searchName.trim().isEmpty()) {
            return "notFound.jsp";
        } else {
            request.setAttribute("product", product);
            return "found.jsp";
        }
    }

    private String edit(HttpServletRequest request, HttpServletResponse response) {
        return "edit.jsp";
    }

    private String editProduct(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<String> errors = new ArrayList<>();
        Product product = new Product();
        setName(product, request, errors);
        setType(product, request, errors);
        setPrice(product, request, errors);
        setDateOfPurchase(product, request, errors);
        try {
            database.editProduct(product, request.getParameter("oldName"));
        }
        catch (IllegalArgumentException exc) {
            request.setAttribute("errors", errors);
            return edit(request, response);
        }
        request.setAttribute("errors", errors);
        return overview(request, response);

    }

    private String getConfirmation() {
        return "confirm.jsp";
    }

    public Cookie getCookie(HttpServletRequest request, String cookie) {
        Cookie[] cookies = request.getCookies();
        if (cookies == null) return null;
        for (Cookie c: cookies) {
            if (c.getName().equals(cookie)) {
                return c;
            }
        }
        return null;
    }
}

