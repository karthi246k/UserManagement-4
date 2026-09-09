package com.user;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.user.model.Address;
import com.user.model.User;

public class InsertUser extends HttpServlet {

    // GET: Display the insert user form.
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("insert.jsp").forward(request, response);
    }

    // POST: Insert a new user and their addresses into the database.
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get user details from the form.
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        // Get home address details from the form.
        String homeStreetAddress = request.getParameter("homeStreetAddress");
        String homeCity = request.getParameter("homeCity");
        String homeState = request.getParameter("homeState");
        String homeZipCode = request.getParameter("homeZipCode");

        // Get office address details from the form.
        String officeStreetAddress = request.getParameter("officeStreetAddress");
        String officeCity = request.getParameter("officeCity");
        String officeState = request.getParameter("officeState");
        String officeZipCode = request.getParameter("officeZipCode");

        // Create the home Address object.
        Address homeAddress = new Address();
        homeAddress.setStreetAddress(homeStreetAddress);
        homeAddress.setCity(homeCity);
        homeAddress.setState(homeState);
        homeAddress.setZipCode(homeZipCode);

        // Create the office Address object.
        Address officeAddress = new Address();
        officeAddress.setStreetAddress(officeStreetAddress);
        officeAddress.setCity(officeCity);
        officeAddress.setState(officeState);
        officeAddress.setZipCode(officeZipCode);

        // Create DataAccess object.
        DataAccess dataAccess = new DataAccess();

        // Insert both addresses and get their generated IDs.
        int homeAddressId = dataAccess.insertAddress(homeAddress);
        int officeAddressId = dataAccess.insertAddress(officeAddress);

        // Create the User object.
        User user = new User();
        user.setName(name);
        user.setPhone(phone);
        user.setEmail(email);

        // Store the address IDs in the User object.
        user.setHomeAddressId(homeAddressId);
        user.setOfficeAddressId(officeAddressId);

        // Insert the User object into the database.
        dataAccess.insertUser(user);

        // Redirect to the user list after successful insertion.
        response.sendRedirect("list");
    }
}
