<%@ page import="com.user.model.User" %>

<%
    // Get the User object sent by the UpdateUser servlet.
    User user = (User) request.getAttribute("user");

    // Get update success status.
    Boolean updateSuccess =
            (Boolean) request.getAttribute("updateSuccess");

    // Get update error message.
    String updateError =
            (String) request.getAttribute("updateError");
%>


<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Update User</title>

    <!-- Update page CSS -->
    <link rel="stylesheet" href="css/update.css">

</head>


<body>


<!-- ==================== Navbar ==================== -->

<nav class="navbar">

    <!-- Home -->

    <a href="index.jsp">
        Home
    </a>

</nav>


<!-- ==================== Main Container ==================== -->

<div class="container">


    <h1>
        Update User
    </h1>


    <!-- ==================== Update Form ==================== -->

    <form
        action="update"
        method="post"
        id="updateForm">


        <!-- Send User ID back to UpdateUser servlet -->

        <input
            type="hidden"
            name="id"
            value="<%= user.getId() %>">


        <!-- ==================== User Details ==================== -->

        <h2>
            User Details
        </h2>


        <label>
            Name:
        </label>

        <input
            type="text"
            name="name"
            value="<%= user.getName() %>"
            required>


        <label>
            Phone:
        </label>

        <input
            type="text"
            name="phone"
            value="<%= user.getPhone() %>"
            required>


        <label>
            Email:
        </label>

        <input
            type="email"
            name="email"
            value="<%= user.getEmail() %>"
            required>


        <!-- ==================== Home Address ==================== -->

        <h2>
            Home Address
        </h2>


        <label>
            Street Address:
        </label>

        <input
            type="text"
            name="homeStreetAddress"
            value="<%= user.getHomeAddress().getStreetAddress() %>"
            required>


        <label>
            City:
        </label>

        <input
            type="text"
            name="homeCity"
            value="<%= user.getHomeAddress().getCity() %>"
            required>


        <label>
            State:
        </label>

        <input
            type="text"
            name="homeState"
            value="<%= user.getHomeAddress().getState() %>"
            required>


        <label>
            Zip Code:
        </label>

        <input
            type="text"
            name="homeZipCode"
            value="<%= user.getHomeAddress().getZipCode() %>"
            required>


        <!-- ==================== Office Address ==================== -->

        <h2>
            Office Address
        </h2>


        <label>
            Street Address:
        </label>

        <input
            type="text"
            name="officeStreetAddress"
            value="<%= user.getOfficeAddress().getStreetAddress() %>"
            required>


        <label>
            City:
        </label>

        <input
            type="text"
            name="officeCity"
            value="<%= user.getOfficeAddress().getCity() %>"
            required>


        <label>
            State:
        </label>

        <input
            type="text"
            name="officeState"
            value="<%= user.getOfficeAddress().getState() %>"
            required>


        <label>
            Zip Code:
        </label>

        <input
            type="text"
            name="officeZipCode"
            value="<%= user.getOfficeAddress().getZipCode() %>"
            required>


        <!-- ==================== Buttons ==================== -->

        <div class="button-container">


            <!-- Update User -->

            <input
                type="submit"
                value="Update User"
                class="button update-button">


            <!-- Reset Form -->

            <input
                type="reset"
                value="Reset"
                class="button reset-button">


        </div>


    </form>


    <!-- ================================================= -->
    <!--          UPDATE CONFIRMATION POPUP               -->
    <!-- ================================================= -->

    <div
        id="confirmPopup"
        class="popup-overlay">


        <div class="popup-box">


            <!-- ==================== Title ==================== -->

            <div class="popup-title">

                Confirm Update

            </div>


            <!-- ==================== Message ==================== -->

            <div class="popup-message">

                Are you sure you want to update this user's details?

            </div>


            <!-- ==================== Buttons ==================== -->

            <div class="popup-buttons">


                <!-- Cancel -->

                <button
                    type="button"
                    class="popup-cancel"
                    id="cancelUpdate">

                    Cancel

                </button>


                <!-- Confirm -->

                <button
                    type="button"
                    class="popup-confirm"
                    id="confirmUpdate">

                    Update

                </button>


            </div>


        </div>

    </div>


</div>


<!-- ================================================= -->
<!--              UPDATE SUCCESS POPUP                 -->
<!-- ================================================= -->

<%
    if (updateSuccess != null && updateSuccess == true) {
%>

    <div
        id="updateSuccessPopup"
        class="popup-overlay show">


        <div class="popup-box">


            <!-- ==================== Title ==================== -->

            <div class="popup-title">

                Update Successful

            </div>


            <!-- ==================== Message ==================== -->

            <div class="popup-message">

                User details updated successfully.

            </div>


            <!-- ==================== Button ==================== -->

            <div class="popup-buttons">

                <button
                    type="button"
                    class="popup-confirm"
                    onclick="goToList();">

                    OK

                </button>

            </div>


        </div>

    </div>

<%
    }
%>


<!-- ================================================= -->
<!--                UPDATE ERROR POPUP                  -->
<!-- ================================================= -->

<%
    if (updateError != null) {
%>

    <div
        id="updateErrorPopup"
        class="popup-overlay show">


        <div class="popup-box">


            <!-- ==================== Title ==================== -->

            <div class="popup-title">

                Update Failed

            </div>


            <!-- ==================== Message ==================== -->

            <div class="popup-message">

                <%= updateError %>

            </div>


            <!-- ==================== Button ==================== -->

            <div class="popup-buttons">

                <button
                    type="button"
                    class="popup-cancel"
                    onclick="closeUpdateErrorPopup();">

                    OK

                </button>

            </div>


        </div>

    </div>

<%
    }
%>


<!-- ================================================= -->
<!--                 JavaScript                        -->
<!-- ================================================= -->

<script>


    // Get the update form.

    const updateForm =
        document.getElementById("updateForm");


    // Get the update confirmation popup.

    const confirmPopup =
        document.getElementById("confirmPopup");


    // Get the Cancel button.

    const cancelUpdate =
        document.getElementById("cancelUpdate");


    // Get the Confirm Update button.

    const confirmUpdate =
        document.getElementById("confirmUpdate");


    // Open confirmation popup
    // when Update User is clicked.

    updateForm.addEventListener(
        "submit",
        function(event) {

            // Stop the form from submitting immediately.

            event.preventDefault();


            // Show confirmation popup.

            confirmPopup.classList.add("show");

        }
    );


    // Cancel the update.

    cancelUpdate.addEventListener(
        "click",
        function() {

            // Close confirmation popup.

            confirmPopup.classList.remove("show");

        }
    );


    // Confirm the update.

    confirmUpdate.addEventListener(
        "click",
        function() {

            // Close confirmation popup.

            confirmPopup.classList.remove("show");


            // Submit the update form.

            updateForm.submit();

        }
    );


    // Close confirmation popup
    // when clicking outside the popup box.

    confirmPopup.addEventListener(
        "click",
        function(event) {

            if (event.target === confirmPopup) {

                confirmPopup.classList.remove("show");

            }

        }
    );


    /*
     * Go to the user list
     * after successful update.
     */

    function goToList() {

        window.location.href = "list";

    }


    /*
     * Close the update error popup.
     */

    function closeUpdateErrorPopup() {

        document.getElementById("updateErrorPopup")
                .style.display = "none";

    }


</script>


</body>

</html>