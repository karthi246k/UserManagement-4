package com.user.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "address_4")
public class Address {

    // Primary key generated automatically by the database.
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String streetAddress;
    private String city;
    private String state;
    private String zipCode;


    // ==================== Getters and Setters ====================

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getStreetAddress() {
        return streetAddress;
    }

    public void setStreetAddress(String streetAddress) {
        this.streetAddress = streetAddress;
    }


    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }


    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }


    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }
}