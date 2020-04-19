package com.example.ecom.service;


import com.example.ecom.model.Product;
import com.example.ecom.payload.ProductRequest;
import com.example.ecom.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;

    public Product addProduct(ProductRequest productRequest) {

        Product product = new Product();

        product.setName(productRequest.getName());
        product.setDescription(productRequest.getDescription());
        product.setPrice(productRequest.getPrice());
        product.setQuantity(productRequest.getQuantity());

        return productRepository.save(product);
    }

    public Product updateProduct(Product productRequest, Long productID) {

       Optional<Product> product = productRepository.findById(productID);

       if(!product.isPresent()){
           return null;
       }

       productRequest.setId(productID);

       return productRepository.save(productRequest);

    }

    public Optional<Product> viewProduct(Long productID) {

        return productRepository.findById(productID);
    }

    public void deleteProduct(Long productID) {
        productRepository.deleteById(productID);
    }

    public List<Product> viewProducts() {
        return  productRepository.findAll();
    }
}
