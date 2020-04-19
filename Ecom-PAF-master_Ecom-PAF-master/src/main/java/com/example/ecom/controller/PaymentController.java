package com.example.ecom.controller;

import com.example.ecom.model.Payment;
import com.example.ecom.model.Shipment;
import com.example.ecom.payload.ApiResponse;
import com.example.ecom.payload.PayListResponse;
import com.example.ecom.payload.PaymentResponse;
import com.example.ecom.repository.PaymentRepository;
import com.example.ecom.repository.UserRepository;
import com.example.ecom.security.CurrentUser;
import com.example.ecom.security.UserPrincipal;
import com.example.ecom.service.PaymentService;
import com.example.ecom.service.ShippingService;
import com.example.ecom.util.Routes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/payment")
public class PaymentController {

    @Autowired
    PaymentRepository paymentRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    PaymentService paymentService;

    @Autowired
    ShippingService shippingService;

    private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);

    @GetMapping("/all")
    @PreAuthorize("hasRole('ADMIN')")
    public List<Payment> getPayments() {
        return paymentService.getAllPayments();
    }

    @PostMapping("/{productID}/buy")
    @PreAuthorize("hasRole('USER')")
    public ApiResponse pay(@CurrentUser UserPrincipal currentUser, @RequestParam(value = "quantity") int quantity, @RequestParam(value = "address") String address, @RequestParam(value = "card_type") String card_type, @RequestParam(value = "card_number") String card_number, @RequestParam(value = "cvs") String cvs, @PathVariable("productID") Long productID) {

        Long current_user_id = currentUser.getId();

        int status = paymentService.buy(productID,quantity,current_user_id);

        if(status == 0){
            return  new ApiResponse(false,"Sorry the product has out of stock");
        }
        else if(status == 1){
            return  new ApiResponse(false,"Please enter quantity greater than 0");
        }
        else if(status == 2){
            return  new ApiResponse(false,"Please enter quantity lower than 10");
        }
        else if(status == 3){
            return  new ApiResponse(false,"Sorry available product stock is lower than requested quantity");
        }
        else if(status == 4){

            Shipment shipment = shippingService.shipProduct(current_user_id, address);

            if(shipment != null){
                return  new ApiResponse(true,"Purchase successful.Product is shipped to: " + address);
            }
            else {
                return  new ApiResponse(false,"Something went wrong! Please try again...");
            }
        }
        else{
            return  new ApiResponse(false,"Something went wrong! Please try again...");
        }


    }




}
