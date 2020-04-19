package com.example.ecom.util;

public class Routes {



    // PRODUCT API
    // root path = "/api/products"
    public static final String PRODUCT_INSERT = "/"; // POST
    public static final String PRODUCT_UPDATE = "/{productID}"; // PUT
    public static final String PRODUCT_VIEW = "/{productID}"; // GET
    public static final String PRODUCT_ALL= "/"; // GET
    public static final String PRODUCT_DELETE = "/{productID}"; // DELETE

    // PAYMENT API
    // root path = "/api/payment"
    public static final String PAYMENT_ALL = "/all"; // GET
    public static final String PRODUCT_PURCHASE = "/{productID}/buy"; // POST

    // AUTH API
    // root path = "/api/auth"
    public static final String USER_SIGNIN = "/signin"; // POST
    public static final String USER_SIGNUP = "/signup"; // POST

    // USER Mgt. API
    // root path = "/api"
    public static final String USER_DETAILS = "/user/me"; // GET
    public static final String USERNAME_AVAILABILITY = "/user/checkUsernameAvailability"; // GET
    public static final String EMAIL_AVAILABILITY = "/user/checkEmailAvailability"; // GET



}
