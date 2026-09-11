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

    // Display the update form.
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // Get the user ID from the request.
            int userId = Integer.parseInt(request.getParameter("id"));

            // Create DataAccess object.
            DataAccess dataAccess = new DataAccess();

            // Find the user.
            User user = dataAccess.findUser(userId);

            // Check whether the user exists.
            if (user != null) {

                // Send the user to update.jsp.
                request.setAttribute("user", user);

                request.getRequestDispatcher("update.jsp").forward(request, response);

            } else {

                // User was not found.
                response.sendRedirect("list");
            }

        } catch (Exception e) {

            // Print actual error in server console.
            e.printStackTrace();

            // Go back to the user list if the update page cannot be loaded.
            response.sendRedirect("list");
        }
    }


    // Update the user and address details.
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // ==================== User ID ====================

            // Get the user ID from the update form.
            int userId = Integer.parseInt(request.getParameter("id"));


            // ==================== User Details ====================

            // Get updated user details.
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");


            // ==================== Home Address ====================

            // Get updated home address details.
            String homeStreetAddress = request.getParameter("homeStreetAddress");
            String homeCity = request.getParameter("homeCity");
            String homeState = request.getParameter("homeState");
            String homeZipCode = request.getParameter("homeZipCode");


            // ==================== Office Address ====================

            // Get updated office address details.
            String officeStreetAddress = request.getParameter("officeStreetAddress");
            String officeCity = request.getParameter("officeCity");
            String officeState = request.getParameter("officeState");
            String officeZipCode = request.getParameter("officeZipCode");


            // ==================== DataAccess ====================

            // Create DataAccess object.
            DataAccess dataAccess = new DataAccess();


            // ==================== Find User ====================

            // Find the existing user.
            User user = dataAccess.findUser(userId);


            // ==================== Check User ====================

            if (user != null) {


                // ==================== Update User ====================

                user.setName(name);
                user.setPhone(phone);
                user.setEmail(email);


                // ==================== Update Home Address ====================

                Address homeAddress = user.getHomeAddress();

                if (homeAddress != null) {

                    homeAddress.setStreetAddress(homeStreetAddress);
                    homeAddress.setCity(homeCity);
                    homeAddress.setState(homeState);
                    homeAddress.setZipCode(homeZipCode);
                }


                // ==================== Update Office Address ====================

                Address officeAddress = user.getOfficeAddress();

                if (officeAddress != null) {

                    officeAddress.setStreetAddress(officeStreetAddress);
                    officeAddress.setCity(officeCity);
                    officeAddress.setState(officeState);
                    officeAddress.setZipCode(officeZipCode);
                }


                // ==================== Save Everything ====================

                // Update user and addresses.
                //
                // CascadeType.MERGE in User.java
                // allows the associated addresses
                // to be merged.

                dataAccess.updateUser(user);


                // ==================== Update Successful ====================
                //throw new Exception("Not Found");
                // Send success information to update.jsp.
                request.setAttribute("updateSuccess", true);

                // Send the updated user back to update.jsp.
                request.setAttribute("user", user);


            } else {

                // User was not found.
                request.setAttribute("updateError", "User not found.");
            }


        } catch (Exception e) {

            // Print actual error in server console.
            e.printStackTrace();


            // Send error message to update.jsp.
            request.setAttribute("updateError", "Unable to update the user. Please try again.");


            /*
             * Try to load the user again so that
             * update.jsp can display the form.
             */
            try {

                // Get the user ID again.
                int userId = Integer.parseInt(request.getParameter("id"));

                // Create DataAccess object.
                DataAccess dataAccess = new DataAccess();

                // Find the user again.
                User user = dataAccess.findUser(userId);

                // Send the user back to update.jsp.
                request.setAttribute("user", user);

            } catch (Exception ex) {

                // Print actual error in server console.
                ex.printStackTrace();
            }
        }


        // Display update.jsp.
        //
        // update.jsp will show:
        // - Success popup if updateSuccess == true
        // - Error popup if updateError != null

        request.getRequestDispatcher("update.jsp").forward(request, response);
    }
}