package com.example.ecom.controller;

import com.example.ecom.exception.ShipmentNotFoundException;
import com.example.ecom.model.Shipment;
import com.example.ecom.payload.ApiResponse;
import com.example.ecom.service.ShippingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/shipments")
public class ShippingController {

    @Autowired
    private ShippingService shippingService;

    @RequestMapping("/all")
    @PreAuthorize("hasRole('ADMIN')")
    public List<Shipment> viewShipments(){
        return shippingService.getAllShipments();
    }

    @GetMapping("/{ShipmentID}")
    @PreAuthorize("hasRole('ADMIN')")
    public Shipment getShipment(@PathVariable("ShipmentID") Long ShipmentID) {

        Optional<Shipment> shipment = shippingService.findShipment(ShipmentID);

        if(shipment.isPresent()){
            return shipment.get();
        }
        else{
            throw new ShipmentNotFoundException("Shipment not found with ID: " + ShipmentID);
        }
    }

    @DeleteMapping("/{ShipmentID}")
    @PreAuthorize("hasRole('ADMIN')")
    public ApiResponse deleteUser(@PathVariable("ShipmentID") Long ShipmentID){

        shippingService.deleteShipment(this.getShipment(ShipmentID));

        return  new ApiResponse(true,"User has deleted successfully");
    }

    @PutMapping("/{ShipmentID}")
    @PreAuthorize("hasRole('USER')")
    public ApiResponse updateUser(@PathVariable("ShipmentID") Long ShipmentID, @Valid @RequestBody Shipment shipment){

        Shipment update_shipment = this.getShipment(ShipmentID);

        if(shippingService.updateShipment(update_shipment) != null){
            return new ApiResponse(true,"Shipment has updated successfully");
        }
        else{
            return new ApiResponse(false,"Shipment has updated successfully");
        }
    }
}
