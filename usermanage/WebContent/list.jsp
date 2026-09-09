<%@ page import="java.util.List" %>
<%@ page import="com.user.model.User" %>

<%
    // Get the list of users sent by the ListUser servlet.
    List<User> users = (List<User>) request.getAttribute("users");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>All Users</title>

<style>

    /* ==================== Global ==================== */

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: Arial, Helvetica, sans-serif;
        background: #ffffff;
        color: #111111;
    }


    /* ==================== Navbar ==================== */

    .navbar {
        height: 68px;

        background: #111111;

        display: flex;
        align-items: center;
        justify-content: space-between;

        padding: 0 7%;

        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.12);
    }

    .logo {
        color: #ffffff;

        font-size: 21px;
        font-weight: 600;

        letter-spacing: 0.3px;
    }

    .nav-links {
        display: flex;
        align-items: center;

        gap: 10px;
    }

    .nav-links a {
        color: #ffffff;

        text-decoration: none;

        font-size: 14px;

        padding: 8px 14px;

        border: 1px solid transparent;
        border-radius: 5px;

        transition: 0.25s ease;
    }

    .nav-links a:hover {
        background: #ffffff;
        color: #111111;
    }


    /* ==================== Page Container ==================== */

    .page-container {
        width: 100%;

        padding: 40px 4%;
    }

    .page-container h1 {
        text-align: center;

        font-size: 30px;
        font-weight: 600;

        margin-bottom: 35px;
    }


    /* ==================== Table Wrapper ==================== */

    .table-wrapper {
        width: 100%;

        overflow-x: auto;

        overflow-y: visible;
    }


    /* ==================== Main Table ==================== */

    .main-table {
        width: 1700px;
        min-width: 1700px;

        border-collapse: collapse;

        table-layout: fixed;

        background: #ffffff;
    }


    /* ==================== Table Cells ==================== */

    .main-table th,
    .main-table td {
        min-height: 42px;

        padding: 8px 10px;

        text-align: center;

        vertical-align: middle;

        border: 1px solid #111111;

        /*
         * Allow long content to wrap
         * instead of coming outside the cell.
         */
        white-space: normal;

        overflow-wrap: anywhere;

        word-break: break-word;

        overflow: hidden;
    }


    /* ==================== Section Headings ==================== */

    .section-heading {
        height: 48px !important;

        padding: 10px !important;

        background: #000000;

        color: #ffffff;

        font-size: 15px;

        font-weight: 600;

        text-align: center;

        vertical-align: middle;
    }


    /* ==================== Section Borders ==================== */

    /*
     * Actions | User Details
     */
    .actions-section {
        border-right: 5px solid #000000 !important;
    }


    /*
     * User Details | Home Address
     */
    .user-section {
        border-right: 5px solid #000000 !important;
    }


    /*
     * Home Address | Office Address
     */
    .home-section {
        border-right: 5px solid #000000 !important;
    }


    /* ==================== Column Headings ==================== */

    .column-heading {
        height: 44px;

        background: #111111;

        color: #ffffff;

        font-size: 14px;

        font-weight: 600;

        text-align: center;

        vertical-align: middle;
    }


    /* ==================== Data Cells ==================== */

    .main-table td {
        background: #ffffff;

        color: #111111;

        font-size: 14px;

        line-height: 1.4;
    }


    /* ==================== Actions ==================== */

    .update-column {
        width: 100px;
    }

    .delete-column {
        width: 100px;
    }


    /*
     * Thick border after Delete column
     */
    .delete-cell {
        border-right: 5px solid #000000 !important;
    }


    /* ==================== User Details ==================== */

    .id-column {
        width: 80px;
    }

    .name-column {
        width: 140px;
    }

    .phone-column {
        width: 140px;
    }

    .email-column {
        width: 200px;
    }


    /*
     * Thick border after Email column
     */
    .email-cell {
        border-right: 5px solid #000000 !important;

        white-space: normal !important;

        overflow-wrap: anywhere;

        word-break: break-word;
    }


    /* ==================== Home Address ==================== */

    .home-street-column {
        width: 190px;
    }

    .home-city-column {
        width: 110px;
    }

    .home-state-column {
        width: 110px;
    }

    .home-zip-column {
        width: 60px;
    }


    /*
     * Thick border after Home ZipCode
     */
    .home-zip-cell {
        border-right: 5px solid #000000 !important;
    }


    /* ==================== Office Address ==================== */

    .office-street-column {
        width: 190px;
    }

    .office-city-column {
        width: 110px;
    }

    .office-state-column {
        width: 110px;
    }

    .office-zip-column {
        width: 60px;
    }


    /* ==================== Address Cells ==================== */

    .home-street-cell,
    .home-city-cell,
    .home-state-cell,
    .home-zip-cell,
    .office-street-cell,
    .office-city-cell,
    .office-state-cell,
    .office-zip-cell {
        white-space: normal !important;

        overflow-wrap: anywhere;

        word-break: break-word;
    }


    /* ==================== Forms ==================== */

    form {
        margin: 0;
    }


    /* ==================== Buttons ==================== */

    input[type="submit"] {
        background: #111111;

        color: #ffffff;

        border: 1px solid #111111;

        padding: 7px 12px;

        border-radius: 4px;

        cursor: pointer;

        font-size: 13px;

        transition: 0.2s ease;
    }

    input[type="submit"]:hover {
        background: #ffffff;

        color: #111111;
    }


    /* ==================== Update Button ==================== */

    .update-btn {
        background: #ffffff !important;

        color: #111111 !important;

        border: 1px solid #111111 !important;
    }

    .update-btn:hover {
        background: #111111 !important;

        color: #ffffff !important;
    }


    /* ==================== Delete Button ==================== */

    .delete-btn {
        background: #111111 !important;

        color: #ffffff !important;

        border: 1px solid #111111 !important;
    }

    .delete-btn:hover {
        background: #ffffff !important;

        color: #111111 !important;
    }


    /* ==================== Empty Users Message ==================== */

    .no-users {
        text-align: center;

        padding: 30px;

        font-size: 16px;

        border: 1px solid #111111;
    }


    /* ==================== Responsive ==================== */

    @media (max-width: 1200px) {

        .page-container {
            padding: 40px 20px;
        }

        .table-wrapper {
            width: 100%;

            overflow-x: auto;
        }

        .main-table {
            width: 1700px;

            min-width: 1700px;
        }
    }


    @media (max-width: 600px) {

        .navbar {
            height: auto;

            min-height: 68px;

            padding: 12px 20px;

            flex-direction: column;

            gap: 10px;
        }

        .logo {
            font-size: 18px;
        }

        .nav-links {
            gap: 3px;
        }

        .nav-links a {
            padding: 7px 9px;

            font-size: 13px;
        }

        .page-container {
            padding: 30px 15px;
        }

        .page-container h1 {
            font-size: 25px;

            margin-bottom: 25px;
        }

        .main-table {
            width: 1700px;

            min-width: 1700px;
        }
    }

</style>

</head>


<body>


    <!-- ==================== Navbar ==================== -->

    <nav class="navbar">

        <div class="logo">
            User Management System
        </div>

        <div class="nav-links">

            <a href="./">Home</a>

        </div>

    </nav>


    <!-- ==================== Page ==================== -->

    <div class="page-container">

        <h1>All Users</h1>


        <div class="table-wrapper">


            <!-- ==================== ONE SINGLE TABLE ==================== -->

            <table class="main-table" border="1">


                <!-- ==================== Section Headings ==================== -->

                <tr>

                    <th class="section-heading actions-section"
                        colspan="2">

                        Actions

                    </th>


                    <th class="section-heading user-section"
                        colspan="4">

                        User Details

                    </th>


                    <th class="section-heading home-section"
                        colspan="4">

                        Home Address

                    </th>


                    <th class="section-heading office-section"
                        colspan="4">

                        Office Address

                    </th>

                </tr>


                <!-- ==================== Column Headings ==================== -->

                <tr>


                    <!-- Actions -->

                    <th class="column-heading update-column">
                        Update
                    </th>

                    <th class="column-heading delete-column">
                        Delete
                    </th>


                    <!-- User Details -->

                    <th class="column-heading id-column">
                        ID
                    </th>

                    <th class="column-heading name-column">
                        Name
                    </th>

                    <th class="column-heading phone-column">
                        Phone
                    </th>

                    <th class="column-heading email-column">
                        Email
                    </th>


                    <!-- Home Address -->

                    <!--<th>ID</th>-->

                    <th class="column-heading home-street-column">
                        Street
                    </th>

                    <th class="column-heading home-city-column">
                        City
                    </th>

                    <th class="column-heading home-state-column">
                        State
                    </th>

                    <th class="column-heading home-zip-column">
                        ZipCode
                    </th>


                    <!-- Office Address -->

                    <!--<th>ID</th>-->

                    <th class="column-heading office-street-column">
                        Street
                    </th>

                    <th class="column-heading office-city-column">
                        City
                    </th>

                    <th class="column-heading office-state-column">
                        State
                    </th>

                    <th class="column-heading office-zip-column">
                        ZipCode
                    </th>

                </tr>


                <%
                    // Display each user's details.
                    for (User user : users) {
                %>


                <!-- ==================== User Row ==================== -->

                <tr>


                    <!-- ==================== Actions ==================== -->


                    <!-- Update button -->

                    <td>

                        <form action="update"
                              method="get"
                              style="display:inline;">

                            <!-- Send the User ID to UpdateUser servlet -->

                            <input type="hidden"
                                   name="id"
                                   value="<%= user.getId() %>">

                            <input type="submit"
                                   value="Update">

                        </form>

                    </td>


                    <!-- Delete button -->

                    <td class="delete-cell">

                        <form action="delete"
                              method="post">

                            <!-- Send the User ID to DeleteUser servlet -->

                            <input type="hidden"
                                   name="id"
                                   value="<%= user.getId() %>">

                            <input type="submit"
                                   value="Delete"
                                   onclick="return confirm('Are you sure you want to delete this user?');">

                        </form>

                    </td>


                    <!-- ==================== User Details ==================== -->


                    <td>
                        <%= user.getId() %>
                    </td>


                    <td>
                        <%= user.getName() %>
                    </td>


                    <td>
                        <%= user.getPhone() %>
                    </td>


                    <td class="email-cell">
                        <%= user.getEmail() %>
                    </td>


                    <!-- ==================== Home Address ==================== -->


                    <!--<td><%= user.getHomeAddress().getId() %></td>-->


                    <td>
                        <%= user.getHomeAddress().getStreetAddress() %>
                    </td>


                    <td>
                        <%= user.getHomeAddress().getCity() %>
                    </td>


                    <td>
                        <%= user.getHomeAddress().getState() %>
                    </td>


                    <td class="home-zip-cell">
                        <%= user.getHomeAddress().getZipCode() %>
                    </td>


                    <!-- ==================== Office Address ==================== -->


                    <!--<td><%= user.getOfficeAddress().getId() %></td>-->


                    <td>
                        <%= user.getOfficeAddress().getStreetAddress() %>
                    </td>


                    <td>
                        <%= user.getOfficeAddress().getCity() %>
                    </td>


                    <td>
                        <%= user.getOfficeAddress().getState() %>
                    </td>


                    <td>
                        <%= user.getOfficeAddress().getZipCode() %>
                    </td>


                </tr>


                <%
                    }
                %>


            </table>


        </div>

    </div>


</body>

</html>