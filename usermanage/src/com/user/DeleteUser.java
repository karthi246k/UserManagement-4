package com.user;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.user.model.User;

public class DeleteUser extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // Get user ID from the request.
            int userId = Integer.parseInt(
                    request.getParameter("id")
            );

            // Create DataAccess object.
            DataAccess dataAccess = new DataAccess();

            // Find the user.
            User user = dataAccess.findUser(userId);

            // Check whether the user exists.
            if (user != null) {

                // Delete the user.
                dataAccess.deleteUser(user);
                //throw new Exception("Test exception");

                // Delete successful.
                request.setAttribute("deleteSuccess", true);

            } else {

                // User was not found.
                request.setAttribute(
                        "deleteError",
                        "User not found."
                );
            }

        } catch (Exception e) {

            // Print actual error in server console.
            e.printStackTrace();

            // Delete failed.
            request.setAttribute(
                    "deleteError",
                    "Unable to delete the user. Please try again."
            );
        }

        // Go back to the user list.
        // The popup will be displayed from list.jsp.
        DataAccess dataAccess = new DataAccess();

        request.setAttribute(
                "users",
                dataAccess.listAllUsers()
        );

        request.getRequestDispatcher("list.jsp")
               .forward(request, response);
    }
}