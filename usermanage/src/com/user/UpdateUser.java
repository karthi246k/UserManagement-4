
package com.user;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.user.model.Address;
import com.user.model.User;

// Update a user in the database.
public class UpdateUser extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        // Get the user ID from the Update button.
        int userId = Integer.parseInt(request.getParameter("id"));

        // Create DataAccess object.
        DataAccess dataAccess = new DataAccess();

        // Find the user.
        User user = dataAccess.findUser(userId);

        if (user != null) {

            // Find the user's home address.
            Address homeAddress = dataAccess.findAddress(user.getHomeAddressId());

            // Find the user's office address.
            Address officeAddress = dataAccess.findAddress(user.getOfficeAddressId());

            // Set the addresses inside the User object.
            user.setHomeAddress(homeAddress);
            user.setOfficeAddress(officeAddress);

            // Send the User object to update.jsp.
            request.setAttribute("user", user);

            // Display the update form.
            request.getRequestDispatcher("update.jsp").forward(request, response);

        } else {
            // User not found.
            response.sendRedirect("list");
        }
    }

    // Update the user details in the database.
    // Update the user and address details in the database.
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        // Get the user ID from the update form.
        int userId = Integer.parseInt(request.getParameter("id"));

        // Get the updated user details from the form.
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        // Get the updated home address details from the form.
        String homeStreetAddress = request.getParameter("homeStreetAddress");
        String homeCity = request.getParameter("homeCity");
        String homeState = request.getParameter("homeState");
        String homeZipCode = request.getParameter("homeZipCode");

        // Get the updated office address details from the form.
        String officeStreetAddress = request.getParameter("officeStreetAddress");
        String officeCity = request.getParameter("officeCity");
        String officeState = request.getParameter("officeState");
        String officeZipCode = request.getParameter("officeZipCode");

        // Create DataAccess object.
        DataAccess dataAccess = new DataAccess();

        // Find the existing user.
        User user = dataAccess.findUser(userId);

        if (user != null) {

            // Update the User object.
            user.setName(name);
            user.setPhone(phone);
            user.setEmail(email);

            // Find the existing home address.
            Address homeAddress = dataAccess.findAddress(user.getHomeAddressId());

            // Update the home address.
            if (homeAddress != null) {
                homeAddress.setStreetAddress(homeStreetAddress);
                homeAddress.setCity(homeCity);
                homeAddress.setState(homeState);
                homeAddress.setZipCode(homeZipCode);

                // Update the home address in the database.
                dataAccess.updateAddress(homeAddress);
            }

            // Find the existing office address.
            Address officeAddress = dataAccess.findAddress(user.getOfficeAddressId());

            // Update the office address.
            if (officeAddress != null) {
                officeAddress.setStreetAddress(officeStreetAddress);
                officeAddress.setCity(officeCity);
                officeAddress.setState(officeState);
                officeAddress.setZipCode(officeZipCode);

                // Update the office address in the database.
                dataAccess.updateAddress(officeAddress);
            }

            // Update the User object in the database.
            dataAccess.updateUser(user);
        }

        // Redirect back to the user list.
        response.sendRedirect("list");
    }
    
}