package com.user;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.user.model.Address;
import com.user.model.User;

// Delete a user and the user's addresses from the database.
public class DeleteUser extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the user ID from the delete form.
        int userId = Integer.parseInt(request.getParameter("id"));

        // Create DataAccess object.
        DataAccess dataAccess = new DataAccess();

        // Find the user using the user ID.
        User user = dataAccess.findUser(userId);

        if (user != null) {

            // Get the home/office address ID before deleting the user.
            int homeAddressId = user.getHomeAddressId();
            int officeAddressId = user.getOfficeAddressId();


            dataAccess.deleteUser(user);

            // Find and delete the home/office address.
            Address homeAddress = dataAccess.findAddress(homeAddressId);

            if (homeAddress != null) {
                dataAccess.deleteAddress(homeAddress);
            }

            Address officeAddress = dataAccess.findAddress(officeAddressId);

            if (officeAddress != null) {
                dataAccess.deleteAddress(officeAddress);
            }
        }

        response.sendRedirect("list");
    }
}

