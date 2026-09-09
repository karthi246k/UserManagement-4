package com.user;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.user.model.Address;
import com.user.model.User;

public class FindUser extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the user ID from the search form.
        String idParameter = request.getParameter("id");

        // If no ID is provided, just display the search page.
        if (idParameter == null || idParameter.trim().isEmpty()) {

            request.getRequestDispatcher("find.jsp").forward(request, response);

            return;
        }

        // Convert the user ID from String to int.
        int userId = Integer.parseInt(idParameter);

        // Create DataAccess object.
        DataAccess dataAccess = new DataAccess();

        // Find the user using the user ID.
        User user = dataAccess.findUser(userId);

        // If the user exists, find both addresses.
        if (user != null) {

            // Find the user's home address.
            Address homeAddress =
                    dataAccess.findAddress(user.getHomeAddressId());

            // Find the user's office address.
            Address officeAddress =
                    dataAccess.findAddress(user.getOfficeAddressId());

            // Set the addresses inside the User object.
            user.setHomeAddress(homeAddress);
            user.setOfficeAddress(officeAddress);
        }

        // Send the User object to find.jsp.
        request.setAttribute("user", user);

        // Display the find user page.
        request.getRequestDispatcher("find.jsp").forward(request, response);
    }
}