package com.user;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.user.model.User;

public class ListUser extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                         throws ServletException, IOException {

        DataAccess dataAccess = new DataAccess();

        List<User> users = dataAccess.listAllUsers();

        request.setAttribute("users", users);

        request.getRequestDispatcher("list.jsp").forward(request, response);
    }
}