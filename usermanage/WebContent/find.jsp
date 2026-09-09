<%@ page import="com.user.model.User" %>
<%@ page import="com.user.model.Address" %>

<%
    // Get the User object sent by the FindUser servlet.
    User user = (User) request.getAttribute("user");

    Address homeAddress = null;
    Address officeAddress = null;

    // Get addresses only when a user was found.
    if (user != null) {
        homeAddress = user.getHomeAddress();
        officeAddress = user.getOfficeAddress();
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Find User</title>

    <style>

        body {
            font-family: Arial, sans-serif;
        }

        .search-box {
            margin-bottom: 30px;
        }

        .tables-container {
            display: flex;
            gap: 15px;
            align-items: flex-start;
        }

        table {
            border-collapse: collapse;
        }

        th,
        td {
            border: 1px solid black;
            padding: 8px;
            white-space: nowrap;
        }

        th {
            background-color: #f2f2f2;
        }

        .not-found {
            color: red;
        }

    </style>

</head>

<body>

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

    <div class="tables-container">


        <table>

            <tr>
                <th colspan="4">User Details</th>
            </tr>

            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Phone</th>
                <th>Email</th>
            </tr>

            <tr>

                <td>
                    <%= user.getId() %>
                </td>

                <td>
                    <%= user.getName() %>
                </td>

                <td>
                    <%= user.getPhone() %>
                </td>

                <td>
                    <%= user.getEmail() %>
                </td>

            </tr>

        </table>


        <!-- ==================== Home Address ==================== -->

        <table>

            <tr>
                <th colspan="5">Home Address</th>
            </tr>

            <tr>
                <th>ID</th>
                <th>Street</th>
                <th>City</th>
                <th>State</th>
                <th>ZipCode</th>
            </tr>

            <%
                if (homeAddress != null) {
            %>

            <tr>

                <td>
                    <%= homeAddress.getId() %>
                </td>

                <td>
                    <%= homeAddress.getStreetAddress() %>
                </td>

                <td>
                    <%= homeAddress.getCity() %>
                </td>

                <td>
                    <%= homeAddress.getState() %>
                </td>

                <td>
                    <%= homeAddress.getZipCode() %>
                </td>

            </tr>

            <%
                }
            %>

        </table>


        <!-- ==================== Office Address ==================== -->

        <table>

            <tr>
                <th colspan="5">Office Address</th>
            </tr>

            <tr>
                <th>ID</th>
                <th>Street</th>
                <th>City</th>
                <th>State</th>
                <th>ZipCode</th>
            </tr>

            <%
                if (officeAddress != null) {
            %>

            <tr>

                <td>
                    <%= officeAddress.getId() %>
                </td>

                <td>
                    <%= officeAddress.getStreetAddress() %>
                </td>

                <td>
                    <%= officeAddress.getCity() %>
                </td>

                <td>
                    <%= officeAddress.getState() %>
                </td>

                <td>
                    <%= officeAddress.getZipCode() %>
                </td>

            </tr>

            <%
                }
            %>

        </table>


    </div>


    <%
        } else if (request.getParameter("id") != null) {
    %>

        <p class="not-found">
            User not found.
        </p>

    <%
        }
    %>


</body>

</html>