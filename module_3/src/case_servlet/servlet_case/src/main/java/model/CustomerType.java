package model;

public class CustomerType {
    private int customerType;
    private String name;

    public CustomerType() {
    }

    public CustomerType(int customerType, String name) {
        this.customerType = customerType;
        this.name = name;
    }

    public int getCustomerType() {
        return customerType;
    }

    public void setCustomerType(int customerType) {
        this.customerType = customerType;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
