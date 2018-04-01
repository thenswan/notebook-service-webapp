package com.notebookservice.service;

import com.notebookservice.model.User;

public interface UserService {
    void save(User user);
    User findByUsername(String username);
}
