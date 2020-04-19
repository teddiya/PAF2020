package com.example.ecom.service;

import com.example.ecom.exception.BadRequestException;
import com.example.ecom.exception.ProductNotFoundException;
import com.example.ecom.model.Payment;
import com.example.ecom.model.Product;
import com.example.ecom.payload.ApiResponse;
import com.example.ecom.payload.PayListResponse;
import com.example.ecom.payload.PaymentResponse;
import com.example.ecom.repository.PaymentRepository;
import com.example.ecom.repository.ProductRepository;
import com.example.ecom.repository.UserRepository;
import com.example.ecom.security.CurrentUser;
import com.example.ecom.security.UserPrincipal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class PaymentService {

    @Autowired
    private PaymentRepository paymentRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private UserRepository userRepository;

    public List<Payment> getAllPayments() {

        return paymentRepository.findAll();

    }

    public int buy(Long productID, int quantity,Long user_id) {

        Optional<Product> product = productRepository.findById(productID);

        Product buy_product = null;

        if(product.isPresent()){

            buy_product = product.get();

            if(buy_product.getQuantity() == 0){
                return  0;
            }
            else if(quantity == 0){
                return  1;
            }
            else if(quantity > 10){
                return  2;
            }
            else if(quantity > buy_product.getQuantity()){
                return  3;
            }
            else{

                buy_product.setQuantity(buy_product.getQuantity() - quantity);

                productRepository.save(buy_product);

                Payment payment = new Payment(user_id, buy_product.getName() + " x " + quantity , buy_product.getPrice()*quantity,"Paid");

                paymentRepository.save(payment);

                return 4;
            }
        }
        else {
            throw new ProductNotFoundException("id - " + productID);
        }


    }
}
