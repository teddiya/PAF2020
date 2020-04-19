+package com.example.ecom.controller;

import com.example.ecom.exception.ProductNotFoundException;
import com.example.ecom.model.Product;
import com.example.ecom.payload.ApiResponse;
import com.example.ecom.payload.ProductRequest;
import com.example.ecom.repository.UserRepository;
import com.example.ecom.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.validation.Valid;
import java.net.URI;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/products")
public class ProductController {

    @Autowired
    ProductController productController;

    @Autowired
    UserRepository userRepository;

    @Autowired
    ProductService productService;

    private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);


    @PostMapping
    @PreAuthorize("hasRole('SELLER')")
    public ResponseEntity<?> insertProduct(@Valid @RequestBody ProductRequest productRequest) {

        Product product = productService.addProduct(productRequest);

        URI location = ServletUriComponentsBuilder
                .fromCurrentRequest().path("/{productID}")
                .buildAndExpand(product.getId()).toUri();

        return ResponseEntity.created(location)
                .body(new ApiResponse(true, "Product Stored Successfully"));

    }

    @PutMapping("/{productID}")
    @PreAuthorize("hasRole('SELLER')")
    public ResponseEntity<?> updateProduct(@Valid @RequestBody Product productRequest, @PathVariable("productID") Long productID) {

        Product product = productService.updateProduct(productRequest, productID);

        URI location = ServletUriComponentsBuilder
                .fromCurrentRequest().path("/{productID}")
                .buildAndExpand(product.getId()).toUri();

        return ResponseEntity.created(location)
                .body(new ApiResponse(true, "Product Stored Successfully"));

    }

    @GetMapping("/{productID}")
    @PreAuthorize("hasRole('USER')")
    public Product viewProduct(@PathVariable("productID") Long productID) {

        Optional<Product> products = productService.viewProduct(productID);

        if(!products.isPresent()){
            throw new ProductNotFoundException("id - " + productID);
        }

        URI location = ServletUriComponentsBuilder
                .fromCurrentRequest().path("/{productID}")
                .buildAndExpand(productID).toUri();

        return products.get();

    }

    @GetMapping
    @PreAuthorize("hasRole('USER') || hasRole('SELLER')")
    public List<Product> viewProducts() {

        List<Product> products = productService.viewProducts();

        URI location = ServletUriComponentsBuilder
                .fromCurrentRequest().path("/")
                .buildAndExpand().toUri();

        return products;

    }

    @DeleteMapping("/{productID}")
    @PreAuthorize("hasRole('SELLER')")
    public ResponseEntity<?> deleteProducts(@PathVariable("productID") Long productID) {

        productService.deleteProduct(productID);

        URI location = ServletUriComponentsBuilder
                .fromCurrentRequest().path("/")
                .buildAndExpand().toUri();

        return ResponseEntity.created(location)
                .body(new ApiResponse(true, "Product deleted Successfully"));

    }
}
