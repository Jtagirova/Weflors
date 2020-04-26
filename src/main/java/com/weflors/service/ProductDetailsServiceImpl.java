package com.weflors.service;

import com.weflors.repository.ProductRepository;
import com.weflors.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductDetailsServiceImpl {

    @Autowired
    private ProductRepository productRepository;

}
