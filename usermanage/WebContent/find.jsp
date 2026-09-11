<%@ page import="com.user.model.User" %>

<%
    // Get the User object sent by the FindUser servlet.
    User user = (User) request.getAttribute("user");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Find User</title>

    <link rel="stylesheet" href="css/find.css">

</head>

<body>

    <nav class="navbar">

        <div class="logo">
            User Management System
        </div>

        <a class="home" href="./">
            Home
        </a>

    </nav>


    <main class="main">

        <div class="box">

            <h1>Find User</h1>


            <!-- ==================== Search User ==================== -->

            <div class="search-box">

                <form action="find" method="get">

                    <label>User ID:</label>

                    <input type="number"
                           name="id"
                           required>

                    <input type="submit"
                           value="Find User">

                </form>

            </div>


            <%
                // Display user details only when a user was found.
                if (user != null) {
            %>


            <!-- ==================== User Details ==================== -->

            <div class="details-section">

                <h2>User Details</h2>

                <table>

                    <tr>
                        <th>ID</th>
                        <td>
                            <%= user.getId() %>
                        </td>
                    </tr>

                    <tr>
                        <th>Name</th>
                        <td>
                            <%= user.getName() %>
                        </td>
                    </tr>

                    <tr>
                        <th>Phone</th>
                        <td>
                            <%= user.getPhone() %>
                        </td>
                    </tr>

                    <tr>
                        <th>Email</th>
                        <td>
                            <%= user.getEmail() %>
                        </td>
                    </tr>

                </table>

            </div>


            <!-- ==================== Home Address ==================== -->

            <div class="details-section">

                <h2>Home Address</h2>

                <table>

                    <tr>
                        <th>Street</th>
                        <td>
                            <%= user.getHomeAddress() != null ? user.getHomeAddress().getStreetAddress() : "" %>
                        </td>
                    </tr>

                    <tr>
                        <th>City</th>
                        <td>
                            <%= user.getHomeAddress() != null ? user.getHomeAddress().getCity() : "" %>
                        </td>
                    </tr>

                    <tr>
                        <th>State</th>
                        <td>
                            <%= user.getHomeAddress() != null ? user.getHomeAddress().getState() : "" %>
                        </td>
                    </tr>

                    <tr>
                        <th>ZipCode</th>
                        <td>
                            <%= user.getHomeAddress() != null ? user.getHomeAddress().getZipCode() : "" %>
                        </td>
                    </tr>

                </table>

            </div>


            <!-- ==================== Office Address ==================== -->

            <div class="details-section">

                <h2>Office Address</h2>

                <table>

                    <tr>
                        <th>Street</th>
                        <td>
                            <%= user.getOfficeAddress() != null ? user.getOfficeAddress().getStreetAddress() : "" %>
                        </td>
                    </tr>

                    <tr>
                        <th>City</th>
                        <td>
                            <%= user.getOfficeAddress() != null ? user.getOfficeAddress().getCity() : "" %>
                        </td>
                    </tr>

                    <tr>
                        <th>State</th>
                        <td>
                            <%= user.getOfficeAddress() != null ? user.getOfficeAddress().getState() : "" %>
                        </td>
                    </tr>

                    <tr>
                        <th>ZipCode</th>
                        <td>
                            <%= user.getOfficeAddress() != null ? user.getOfficeAddress().getZipCode() : "" %>
                        </td>
                    </tr>

                </table>

            </div>


            <%
                } else if (request.getParameter("id") != null) {
            %>


                <!-- ==================== User Not Found ==================== -->

                <p class="not-found">
                    User not found.
                </p>


            <%
                }
            %>


        </div>

    </main>


</body>

</html>