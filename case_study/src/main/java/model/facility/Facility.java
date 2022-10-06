package model.facility;

import java.util.Objects;

public abstract class Facility {
    private String serviceID;
    private String serviceName;
    private int usingArea;
    private double price;
    private int maximumPeople;
    private int rentalType;
    private int facilityType;
    private String standardRoom;
    private String descriptionOtherConvenience;
    private double poolArea;
    private int floor;
    private String facilityFree;

    public Facility() {
    }

    public Facility(String serviceID, String serviceName, int usingArea, double price, int maximumPeople, int rentalType, int facilityType, String standardRoom, String descriptionOtherConvenience, double poolArea, int floor, String facilityFree) {
        this.serviceID = serviceID;
        this.serviceName = serviceName;
        this.usingArea = usingArea;
        this.price = price;
        this.maximumPeople = maximumPeople;
        this.rentalType = rentalType;
        this.facilityType = facilityType;
        this.standardRoom = standardRoom;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
        this.poolArea = poolArea;
        this.floor = floor;
        this.facilityFree = facilityFree;
    }

    public Facility(String serviceName, int usingArea, double price, int maximumPeople, int rentalType, int facilityType, String standardRoom, String descriptionOtherConvenience, double poolArea, int floor, String facilityFree) {
        super();
        this.serviceName = serviceName;
        this.usingArea = usingArea;
        this.price = price;
        this.maximumPeople = maximumPeople;
        this.rentalType = rentalType;
        this.facilityType = facilityType;
        this.standardRoom = standardRoom;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
        this.poolArea = poolArea;
        this.floor = floor;
        this.facilityFree = facilityFree;
    }

    public String getServiceID() {
        return serviceID;
    }

    public void setServiceID(String serviceID) {
        this.serviceID = serviceID;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public int getUsingArea() {
        return usingArea;
    }

    public void setUsingArea(int usingArea) {
        this.usingArea = usingArea;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getMaximumPeople() {
        return maximumPeople;
    }

    public void setMaximumPeople(int maximumPeople) {
        this.maximumPeople = maximumPeople;
    }

    public int getRentalType() {
        return rentalType;
    }

    public void setRentalType(int rentalType) {
        this.rentalType = rentalType;
    }

    public int getFacilityType() {
        return facilityType;
    }

    public void setFacilityType(int facilityType) {
        this.facilityType = facilityType;
    }

    public String getStandardRoom() {
        return standardRoom;
    }

    public void setStandardRoom(String standardRoom) {
        this.standardRoom = standardRoom;
    }

    public String getDescriptionOtherConvenience() {
        return descriptionOtherConvenience;
    }

    public void setDescriptionOtherConvenience(String descriptionOtherConvenience) {
        this.descriptionOtherConvenience = descriptionOtherConvenience;
    }

    public double getPoolArea() {
        return poolArea;
    }

    public void setPoolArea(double poolArea) {
        this.poolArea = poolArea;
    }

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }

    public String getFacilityFree() {
        return facilityFree;
    }

    public void setFacilityFree(String facilityFree) {
        this.facilityFree = facilityFree;
    }
}
