package com.user.model;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "user_4")
public class User {

    // Primary key generated automatically by the database.
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    // User details.
    private String name;
    private String phone;
    private String email;

    // Home address relationship.
    @OneToOne(cascade = {
        CascadeType.PERSIST,
        CascadeType.MERGE,
        CascadeType.REMOVE
    })
    @JoinColumn(name = "homeAddressId")
    private Address homeAddress;

    //Office address relationship.
    @OneToOne(cascade = {
        CascadeType.PERSIST,
        CascadeType.MERGE,
        CascadeType.REMOVE
    })
    @JoinColumn(name = "officeAddressId")
    private Address officeAddress;

    // ==================== Getters and Setters ====================

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    public Address getHomeAddress() {
        return homeAddress;
    }

    public void setHomeAddress(Address homeAddress) {
        this.homeAddress = homeAddress;
    }


    public Address getOfficeAddress() {
        return officeAddress;
    }

    public void setOfficeAddress(Address officeAddress) {
        this.officeAddress = officeAddress;
    }
}