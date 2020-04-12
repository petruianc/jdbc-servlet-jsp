/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.petru.model;

/**
 *
 * @author Petru
 */
public class User {
    
    private Integer id;
    private String firstName;
    private String lastName;
    private String email;
    private String password;

    public User() {
    }

    public User(Integer id, String lastName, String firstName, String email, String password) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
    }

    
    
    public Integer getId() {
        return id;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }
    
    public String getEmail(){
        return email;
    }
    
    public String getPassword() {
        return password;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    public void setLastName(String lastName) {
	this.lastName = lastName;
    }
    
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    
    public void setEmail(String email) {
	this.email = email;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + ", password=" + password + '}';
    }

    
    
    
}
