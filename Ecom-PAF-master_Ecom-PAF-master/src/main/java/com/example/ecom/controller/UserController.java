package com.example.ecom.controller;

import com.example.ecom.exception.UserNotFoundException;
import com.example.ecom.model.Product;
import com.example.ecom.model.User;
import com.example.ecom.payload.*;
import com.example.ecom.repository.UserRepository;
import com.example.ecom.security.UserPrincipal;
import com.example.ecom.security.CurrentUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @GetMapping("/user/me")
    public UserSummary getCurrentUser(@CurrentUser UserPrincipal currentUser) {
        UserSummary userSummary = new UserSummary(currentUser.getId(), currentUser.getUsername(), currentUser.getName());
        return userSummary;
    }

    @GetMapping("/user/checkUsernameAvailability")
    public UserIdentityAvailability checkUsernameAvailability(@RequestParam(value = "username") String username) {
        Boolean isAvailable = !userRepository.existsByUsername(username);
        return new UserIdentityAvailability(isAvailable);
    }

    @GetMapping("/user/checkEmailAvailability")
    public UserIdentityAvailability checkEmailAvailability(@RequestParam(value = "email") String email) {
        Boolean isAvailable = !userRepository.existsByEmail(email);
        return new UserIdentityAvailability(isAvailable);
    }

    @GetMapping
    @PreAuthorize("hasRole('ADMIN')")
    public List<User> getAllUsers(){

        return userRepository.findAll();
    }

    @GetMapping("/{userID}")
    @PreAuthorize("hasRole('ADMIN')")
    public User getUser(@PathVariable("userID") Long userID){

        Optional<User> user = userRepository.findById(userID);

        if(user.isPresent()){
            return user.get();
        }
        else{
            throw new UserNotFoundException("User not found with ID: " + userID);
        }
    }

    @DeleteMapping("/{userID}")
    @PreAuthorize("hasRole('ADMIN')")
    public ApiResponse deleteUser(@PathVariable("userID") Long userID){

        userRepository.delete(this.getUser(userID));

        return  new ApiResponse(true,"User has deleted successfully");
    }

    @PutMapping("/{userID}")
    @PreAuthorize("hasRole('USER')")
    public ApiResponse updateUser(@PathVariable("userID") Long userID, @Valid @RequestBody User user){

        User update_user = this.getUser(userID);

        userRepository.save(update_user);

        return new ApiResponse(true,"User has updated successfully");

    }
}
