package model.person;

public class Employee {
    private int employeeId;
    private String name;
    private String dateOfBirth;
    private String idCard;
    private double wage;
    private String phone;
    private String email;
    private String address;
    private int positionId;
    private int educationDegreeId;
    private int divisionId;
    private String username;

    public Employee(String name, String dateOfBirth, String idCard, double wage, String phone, String email, String address, int positionId, int educationDegreeId, int division_Id, String username) {
        super();
        this.name = name;
        this.dateOfBirth = dateOfBirth;
        this.idCard = idCard;
        this.wage = wage;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.positionId = positionId;
        this.educationDegreeId = educationDegreeId;
        this.divisionId = division_Id;
        this.username = username;
    }

    public Employee(int employeeId, String name, String dateOfBirth, String idCard, double wage, String phone, String email, String address, int positionId, int educationDegreeId, int division_Id, String username) {
        this.employeeId = employeeId;
        this.name = name;
        this.dateOfBirth = dateOfBirth;
        this.idCard = idCard;
        this.wage = wage;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.positionId = positionId;
        this.educationDegreeId = educationDegreeId;
        this.divisionId = division_Id;
        this.username = username;
    }


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Employee() {
    }

    public Employee(int employeeId, String name, String dateOfBirth, String idCard, double wage, String phone, String email, String address, int positionId, int educationDegreeId, int division_Id) {
        this.employeeId = employeeId;
        this.name = name;
        this.dateOfBirth = dateOfBirth;
        this.idCard = idCard;
        this.wage = wage;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.positionId = positionId;
        this.educationDegreeId = educationDegreeId;
        this.divisionId = divisionId;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public double getWage() {
        return wage;
    }

    public void setWage(double wage) {
        this.wage = wage;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPositionId() {
        return positionId;
    }

    public void setPositionId(int positionId) {
        this.positionId = positionId;
    }

    public int getEducationDegreeId() {
        return educationDegreeId;
    }

    public void setEducationDegreeId(int educationDegreeId) {
        this.educationDegreeId = educationDegreeId;
    }

    public int getDivisionId() {
        return divisionId;
    }

    public void setDivision_Id(int division_Id) {
        this.divisionId = division_Id;
    }

}
