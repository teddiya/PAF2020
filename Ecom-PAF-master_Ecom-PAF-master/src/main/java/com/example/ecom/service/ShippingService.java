package com.example.ecom.service;

import com.example.ecom.model.Shipment;
import com.example.ecom.repository.ShippingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ShippingService {

    @Autowired
    private ShippingRepository shippingRepository;

    public Shipment shipProduct(Long current_user_id, String address) {

        Shipment shipment = new Shipment(current_user_id,address,"PENDING");

        return shippingRepository.save(shipment);

    }

    public List<Shipment> getAllShipments() {
        return shippingRepository.findAll();
    }

    public Optional<Shipment> findShipment(Long shipmentID) {
        return shippingRepository.findById(shipmentID);
    }

    public void deleteShipment(Shipment shipment) {
        shippingRepository.delete(shipment);
    }

    public Shipment updateShipment(Shipment update_shipment) {
        return shippingRepository.save(update_shipment);
    }
}
