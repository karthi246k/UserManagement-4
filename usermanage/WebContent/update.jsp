<%@ page import="com.user.model.User" %>
<%@ page import="com.user.model.Address" %>

<%
    // Get the User object sent by the UpdateUser servlet.
    User user = (User) request.getAttribute("user");

    // Get the user's home address.
    Address homeAddress = user.getHomeAddress();

    // Get the user's office address.
    Address officeAddress = user.getOfficeAddress();
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Update User</title>


    <style>


        /* ==================== Global ==================== */

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }


        body {
            font-family: Arial, Helvetica, sans-serif;

            background: #f5f5f5;

            color: #111111;

            min-height: 100vh;
        }


        /* ==================== Navbar ==================== */

        .navbar {
            width: 100%;

            height: 65px;

            background: #111111;

            display: flex;

            align-items: center;

            padding: 0 7%;

            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
        }


        .navbar a {
            color: #ffffff;

            text-decoration: none;

            font-size: 15px;

            font-weight: 500;

            padding: 9px 16px;

            border: 1px solid #ffffff;

            border-radius: 5px;

            transition: 0.2s ease;
        }


        .navbar a:hover {
            background: #ffffff;

            color: #111111;
        }


        /* ==================== Main Container ==================== */

        .container {
            width: 100%;

            max-width: 850px;

            margin: 45px auto;

            padding: 0 20px;
        }


        /* ==================== Main Heading ==================== */

        .container > h1 {
            text-align: center;

            font-size: 30px;

            font-weight: 600;

            margin-bottom: 30px;

            color: #111111;
        }


        /* ==================== Form ==================== */

        form {
            width: 100%;

            background: #ffffff;

            border: 2px solid #111111;

            border-radius: 8px;

            padding: 30px;

            box-shadow: 0 3px 12px rgba(0, 0, 0, 0.08);
        }


        /* ==================== Section Heading ==================== */

        h2 {
            font-size: 19px;

            font-weight: 600;

            background: #111111;

            color: #ffffff;

            padding: 11px 15px;

            margin: 0 0 22px 0;

            border-radius: 5px;
        }


        h2:not(:first-of-type) {
            margin-top: 30px;
        }


        /* ==================== Labels ==================== */

        label {
            display: block;

            font-size: 14px;

            font-weight: 600;

            margin-bottom: 7px;

            color: #222222;
        }


        /* ==================== Input Fields ==================== */

        input[type="text"],
        input[type="email"] {

            width: 100%;

            height: 42px;

            padding: 9px 12px;

            border: 1px solid #777777;

            border-radius: 4px;

            background: #ffffff;

            color: #111111;

            font-size: 14px;

            outline: none;

            margin-bottom: 18px;

            transition: 0.2s ease;
        }


        input[type="text"]:focus,
        input[type="email"]:focus {

            border: 2px solid #111111;

            padding: 8px 11px;

            background: #ffffff;
        }


        /* ==================== Hidden User ID ==================== */

        input[type="hidden"] {
            display: none;
        }


        /* ==================== Button Container ==================== */

        .button-container {

            display: flex;

            justify-content: center;

            align-items: center;

            gap: 12px;

            margin-top: 10px;

            padding-top: 25px;

            border-top: 2px solid #111111;
        }


        /* ==================== Common Button ==================== */

        .button {

            min-width: 130px;

            height: 42px;

            padding: 8px 18px;

            font-size: 14px;

            font-weight: 600;

            border-radius: 5px;

            cursor: pointer;

            transition: 0.2s ease;
        }


        /* ==================== Update Button ==================== */

        .update-button {

            background: #111111;

            color: #ffffff;

            border: 2px solid #111111;
        }


        .update-button:hover {

            background: #ffffff;

            color: #111111;
        }


        /* ==================== Reset Button ==================== */

        .reset-button {

            background: #ffffff;

            color: #111111;

            border: 2px solid #111111;
        }


        .reset-button:hover {

            background: #111111;

            color: #ffffff;
        }


        /* ================================================== */
        /* ==================== POPUP ======================= */
        /* ================================================== */


        /* ==================== Popup Overlay ==================== */

        .popup-overlay {

            position: fixed;

            top: 0;

            left: 0;

            width: 100%;

            height: 100%;

            background: rgba(0, 0, 0, 0.65);

            display: none;

            align-items: center;

            justify-content: center;

            z-index: 9999;

            padding: 20px;
        }


        /* Show popup */

        .popup-overlay.show {

            display: flex;
        }


        /* ==================== Popup Box ==================== */

        .popup-box {

            width: 100%;

            max-width: 420px;

            background: #ffffff;

            border: 2px solid #111111;

            border-radius: 8px;

            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.35);

            overflow: hidden;

            animation: popupOpen 0.2s ease-out;
        }


        /* ==================== Popup Animation ==================== */

        @keyframes popupOpen {

            from {

                opacity: 0;

                transform: scale(0.92);
            }

            to {

                opacity: 1;

                transform: scale(1);
            }
        }


        /* ==================== Popup Title ==================== */

        .popup-title {

            background: #111111;

            color: #ffffff;

            font-size: 19px;

            font-weight: 600;

            text-align: center;

            padding: 16px 20px;
        }


        /* ==================== Popup Message ==================== */

        .popup-message {

            color: #111111;

            font-size: 15px;

            line-height: 1.5;

            text-align: center;

            padding: 28px 25px 20px;
        }


        /* ==================== Popup Buttons ==================== */

        .popup-buttons {

            display: flex;

            justify-content: center;

            gap: 12px;

            padding: 5px 25px 25px;
        }


        .popup-buttons button {

            min-width: 105px;

            height: 40px;

            padding: 8px 18px;

            font-size: 14px;

            font-weight: 600;

            border-radius: 5px;

            cursor: pointer;

            transition: 0.2s ease;
        }


        /* ==================== Popup Cancel ==================== */

        .popup-cancel {

            background: #ffffff;

            color: #111111;

            border: 2px solid #111111;
        }


        .popup-cancel:hover {

            background: #111111;

            color: #ffffff;
        }


        /* ==================== Popup Confirm ==================== */

        .popup-confirm {

            background: #111111;

            color: #ffffff;

            border: 2px solid #111111;
        }


        .popup-confirm:hover {

            background: #ffffff;

            color: #111111;
        }


        /* ==================== Responsive ==================== */

        @media (max-width: 600px) {


            .navbar {

                height: 60px;

                padding: 0 20px;
            }


            .container {

                margin: 30px auto;

                padding: 0 15px;
            }


            .container > h1 {

                font-size: 26px;

                margin-bottom: 25px;
            }


            form {

                padding: 20px;
            }


            h2 {

                font-size: 17px;
            }


            .button-container {

                flex-direction: column;
            }


            .button {

                width: 100%;
            }


            .popup-box {

                max-width: 350px;
            }


            .popup-message {

                font-size: 14px;

                padding: 25px 20px 18px;
            }


            .popup-buttons button {

                min-width: 100px;
            }

        }


    </style>

</head>


<body>


<!-- ==================== Navbar ==================== -->

<nav class="navbar">

    <!-- Home -->
    <a href="index.jsp">Home</a>

</nav>


<!-- ==================== Main Container ==================== -->

<div class="container">


    <h1>Update User</h1>


    <form action="update"
          method="post"
          id="updateForm">


        <!-- Send the User ID back to UpdateUser servlet -->
        <input type="hidden"
               name="id"
               value="<%= user.getId() %>">


        <!-- ==================== User Details ==================== -->

        <h2>User Details</h2>


        <label>Name:</label>

        <input type="text"
               name="name"
               value="<%= user.getName() %>"
               required>


        <label>Phone:</label>

        <input type="text"
               name="phone"
               value="<%= user.getPhone() %>"
               required>


        <label>Email:</label>

        <input type="email"
               name="email"
               value="<%= user.getEmail() %>"
               required>


        <!-- ==================== Home Address ==================== -->

        <h2>Home Address</h2>


        <label>Street Address:</label>

        <input type="text"
               name="homeStreetAddress"
               value="<%= homeAddress.getStreetAddress() %>"
               required>


        <label>City:</label>

        <input type="text"
               name="homeCity"
               value="<%= homeAddress.getCity() %>"
               required>


        <label>State:</label>

        <input type="text"
               name="homeState"
               value="<%= homeAddress.getState() %>"
               required>


        <label>Zip Code:</label>

        <input type="text"
               name="homeZipCode"
               value="<%= homeAddress.getZipCode() %>"
               required>


        <!-- ==================== Office Address ==================== -->

        <h2>Office Address</h2>


        <label>Street Address:</label>

        <input type="text"
               name="officeStreetAddress"
               value="<%= officeAddress.getStreetAddress() %>"
               required>


        <label>City:</label>

        <input type="text"
               name="officeCity"
               value="<%= officeAddress.getCity() %>"
               required>


        <label>State:</label>

        <input type="text"
               name="officeState"
               value="<%= officeAddress.getState() %>"
               required>


        <label>Zip Code:</label>

        <input type="text"
               name="officeZipCode"
               value="<%= officeAddress.getZipCode() %>"
               required>


        <!-- ==================== Buttons ==================== -->

        <div class="button-container">


            <!-- Update User -->

            <input type="submit"
                   value="Update User"
                   class="button update-button">


            <!-- Reset Form -->

            <input type="reset"
                   value="Reset"
                   class="button reset-button">


        </div>


    </form>


    <!-- ==================== Update Confirmation Popup ==================== -->

    <div id="confirmPopup"
         class="popup-overlay">


        <div class="popup-box">


            <div class="popup-title">

                Confirm Update

            </div>


            <div class="popup-message">

                Are you sure you want to update this user's details?

            </div>


            <div class="popup-buttons">


                <!-- Cancel -->

                <button type="button"
                        class="popup-cancel"
                        id="cancelUpdate">

                    Cancel

                </button>


                <!-- Confirm -->

                <button type="button"
                        class="popup-confirm"
                        id="confirmUpdate">

                    Update

                </button>


            </div>


        </div>

    </div>


</div>


<!-- ==================== JavaScript ==================== -->

<script>


    // Get the update form.

    const updateForm =
        document.getElementById("updateForm");


    // Get the confirmation popup.

    const confirmPopup =
        document.getElementById("confirmPopup");


    // Get the Cancel button.

    const cancelUpdate =
        document.getElementById("cancelUpdate");


    // Get the Confirm Update button.

    const confirmUpdate =
        document.getElementById("confirmUpdate");


    // Open the confirmation popup
    // when Update User is clicked.

    updateForm.addEventListener("submit", function(event) {

        // Stop the form from submitting immediately.

        event.preventDefault();


        // Show the custom popup.

        confirmPopup.classList.add("show");

    });


    // Cancel the update.

    cancelUpdate.addEventListener("click", function() {

        confirmPopup.classList.remove("show");

    });


    // Confirm the update.

    confirmUpdate.addEventListener("click", function() {

        // Close the popup.

        confirmPopup.classList.remove("show");


        // Submit the form.

        updateForm.submit();

    });


    // Close popup when clicking outside the popup box.

    confirmPopup.addEventListener("click", function(event) {

        if (event.target === confirmPopup) {

            confirmPopup.classList.remove("show");

        }

    });


</script>


</body>

</html>