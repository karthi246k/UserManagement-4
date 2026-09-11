<%@ page import="java.util.List" %>
<%@ page import="com.user.model.User" %>

<%
    // Get the list of users sent by the servlet.
    List<User> users =
            (List<User>) request.getAttribute("users");


    // Get delete success status.
    Boolean deleteSuccess =
            (Boolean) request.getAttribute("deleteSuccess");


    // Get delete error message.
    String deleteError =
            (String) request.getAttribute("deleteError");
%>


<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>All Users</title>

    <link rel="stylesheet" href="css/list.css">

    <link rel="stylesheet" href="css/delete.css">

</head>


<body>


    <!-- ==================== Navbar ==================== -->

    <nav class="navbar">

        <div class="logo">
            User Management System
        </div>


        <div class="nav-links">

            <a href="./">
                Home
            </a>

        </div>

    </nav>


    <!-- ==================== Page ==================== -->

    <div class="page-container">

        <h1>
            All Users
        </h1>


        <div class="table-wrapper">


            <!-- ==================== ONE SINGLE TABLE ==================== -->

            <table class="main-table" border="1">


                <!-- ==================== Section Headings ==================== -->

                <tr>

                    <!-- Actions -->

                    <th
                        class="section-heading actions-section"
                        colspan="2">

                        Actions

                    </th>


                    <!-- User Details -->

                    <th
                        class="section-heading user-section"
                        colspan="4">

                        User Details

                    </th>


                    <!-- Home Address -->

                    <th
                        class="section-heading home-section"
                        colspan="4">

                        Home Address

                    </th>


                    <!-- Office Address -->

                    <th
                        class="section-heading office-section"
                        colspan="4">

                        Office Address

                    </th>

                </tr>


                <!-- ==================== Column Headings ==================== -->

                <tr>


                    <!-- ==================== Actions ==================== -->

                    <th class="column-heading update-column">

                        Update

                    </th>


                    <th class="column-heading delete-column">

                        Delete

                    </th>


                    <!-- ==================== User Details ==================== -->

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


                    <!-- ==================== Home Address ==================== -->

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


                    <!-- ==================== Office Address ==================== -->

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
                    // Display each user.
                    for (User user : users) {
                %>


                <!-- ==================== User Row ==================== -->

                <tr>


                    <!-- ==================== Update ==================== -->

                    <td>

                        <form
                            action="update"
                            method="get"
                            style="display:inline;">

                            <!-- Send User ID to UpdateUser servlet -->

                            <input
                                type="hidden"
                                name="id"
                                value="<%= user.getId() %>">


                            <input
                                type="submit"
                                value="Update">

                        </form>

                    </td>


                    <!-- ==================== Delete ==================== -->

                    <td class="delete-cell">

                        <!--
                            Open custom delete popup.

                            Pass the user's ID
                            and user's name.
                        -->

                        <button
                            type="button"
                            class="delete-btn"
                            onclick="showDeletePopup(
                                <%= user.getId() %>,
                                '<%= user.getName().replace("'", "\\'") %>'
                            );">

                            Delete

                        </button>

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


    <!-- ================================================= -->
    <!--              DELETE POPUP                        -->
    <!-- ================================================= -->

    <jsp:include page="delete.jsp" />


    <!-- ================================================= -->
    <!--              DELETE SUCCESS POPUP                -->
    <!-- ================================================= -->

    <%
        if (deleteSuccess != null && deleteSuccess == true) {
    %>

        <div
            class="delete-popup-overlay"
            id="deleteSuccessPopup">

            <div class="delete-popup-box">

                <h2>
                    Delete Successful
                </h2>

                <p>
                    User deleted successfully.
                </p>

                <button
                    type="button"
                    class="delete-confirm-btn"
                    onclick="closeDeleteSuccessPopup();">

                    OK

                </button>

            </div>

        </div>

    <%
        }
    %>


    <!-- ================================================= -->
    <!--              DELETE ERROR POPUP                   -->
    <!-- ================================================= -->

    <%
        if (deleteError != null) {
    %>

        <div
            class="delete-popup-overlay"
            id="deleteErrorPopup">

            <div class="delete-popup-box">

                <h2>
                    Delete Failed
                </h2>

                <p>
                    <%= deleteError %>
                </p>

                <button
                    type="button"
                    class="delete-cancel-btn"
                    onclick="closeDeleteErrorPopup();">

                    OK

                </button>

            </div>

        </div>

    <%
        }
    %>


    <!-- ================================================= -->
    <!--                 JAVASCRIPT                       -->
    <!-- ================================================= -->

    <script>


        /*
         * Close delete success popup.
         */
        function closeDeleteSuccessPopup() {

            document.getElementById("deleteSuccessPopup")
                    .style.display = "none";

        }


        /*
         * Close delete error popup.
         */
        function closeDeleteErrorPopup() {

            document.getElementById("deleteErrorPopup")
                    .style.display = "none";

        }


    </script>


</body>

</html>