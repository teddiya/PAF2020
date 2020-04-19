package com.example.ecom.payload;

import com.example.ecom.model.Payment;

import java.util.List;

public class PayListResponse<T> {

    private List<Payment> payments;
    private int size;

    public PayListResponse(){

    }

    public PayListResponse(List<Payment> payments, int size) {
     this.payments = payments;
     this.size = size;
    }

    public List<Payment> getPayments() {
        return payments;
    }

    public void setPayments(List<Payment> payments) {
        this.payments = payments;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }
}
