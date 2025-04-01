package dao;

class CustomerBean{

    private int customerID;

    private String customerName, email, countryCode, mobileNumber;

    private String address, userID, password, preferences;

    public CustomerBean(int customerID, String customerName, String email, String countryCode, String mobileNumber,

                    String address, String userID, String password, String preferences) {

        this.customerID = customerID;

        this.customerName = customerName;

        this.email = email;

        this.countryCode = countryCode;

        this.mobileNumber = mobileNumber;

        this.address = address;

        this.userID = userID;

        this.password = password;

        this.preferences = preferences;

    }


    public int getCustomerID() { return customerID; }

    public String getCustomerName() { return customerName; }

    public String getEmail() { return email; }

    public String getCountryCode() { return countryCode; }

    public String getMobileNumber() { return mobileNumber; }

    public String getAddress() { return address; }

    public String getUserID() { return userID; }

    public String getPassword() { return password; }

    public String getPreferences() { return preferences; }

}

