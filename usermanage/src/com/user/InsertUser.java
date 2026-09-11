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
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("insert.jsp").forward(request, response);
    }


    // POST: Insert a new user and their addresses.
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            

            // Get user details.
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");


            // Create home address.
            Address homeAddress = new Address();

            homeAddress.setStreetAddress(
                    request.getParameter("homeStreetAddress"));

            homeAddress.setCity(
                    request.getParameter("homeCity"));

            homeAddress.setState(
                    request.getParameter("homeState"));

            homeAddress.setZipCode(
                    request.getParameter("homeZipCode"));


            // Create office address.
            Address officeAddress = new Address();

            officeAddress.setStreetAddress(
                    request.getParameter("officeStreetAddress"));

            officeAddress.setCity(
                    request.getParameter("officeCity"));

            officeAddress.setState(
                    request.getParameter("officeState"));

            officeAddress.setZipCode(
                    request.getParameter("officeZipCode"));


            // Create User object.
            User user = new User();

            user.setName(name);
            user.setPhone(phone);
            user.setEmail(email);

            // Set address objects directly.
            user.setHomeAddress(homeAddress);
            user.setOfficeAddress(officeAddress);


            // Insert user.
            DataAccess dataAccess = new DataAccess();

            dataAccess.insertUser(user);
            //throw new Exception("Test exception");

            // Insert successful.
            request.setAttribute("insertSuccess", true);

            request.getRequestDispatcher("insert.jsp").forward(request, response);


        } catch (Exception e) {

            // Print the actual error in the server console.
            e.printStackTrace();

            // Send error message to JSP.
            request.setAttribute(
                    "insertError",
                    "Unable to add the user. Please try again."
            );

            request.getRequestDispatcher("insert.jsp")
                   .forward(request, response);
        }
    }
}