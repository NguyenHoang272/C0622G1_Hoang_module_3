package model;

public class Contract {
    private int contractId;
    private int facilityId;
    private String customerName;
    private String starDay;
    private String endDay;
    private double deposit;
    private double totalPrice;

    public Contract() {
    }

    public Contract(int contractId, int facilityId, String customerName, String starDay, String endDay, double deposit, double totalPrice) {
        this.contractId = contractId;
        this.facilityId = facilityId;
        this.customerName = customerName;
        this.starDay = starDay;
        this.endDay = endDay;
        this.deposit = deposit;
        this.totalPrice = totalPrice;
    }

    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
    }

    public int getFacilityId() {
        return facilityId;
    }

    public void setFacilityId(int facilityId) {
        this.facilityId = facilityId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getStarDay() {
        return starDay;
    }

    public void setStarDay(String starDay) {
        this.starDay = starDay;
    }

    public String getEndDay() {
        return endDay;
    }

    public void setEndDay(String endDay) {
        this.endDay = endDay;
    }

    public double getDeposit() {
        return deposit;
    }

    public void setDeposit(double deposit) {
        this.deposit = deposit;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
}
