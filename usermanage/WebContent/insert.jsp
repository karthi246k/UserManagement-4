<%
    Boolean insertSuccess =
            (Boolean) request.getAttribute("insertSuccess");

    String insertError =
            (String) request.getAttribute("insertError");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Insert User</title>

    <link rel="stylesheet" href="css/insert.css">

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

            <a href="list">
                Users
            </a>

        </div>

    </nav>


    <!-- ==================== Page ==================== -->

    <div class="page-container">

        <h1>
            Insert User
        </h1>


        <form
            action="insert"
            method="post"
            class="user-form"
            id="userForm">


            <!-- ==================== User Details ==================== -->

            <div class="form-section">

                <div class="section-heading">
                    User Details
                </div>


                <div class="form-grid">


                    <div class="form-group">

                        <label for="name">
                            Name
                        </label>

                        <input
                            type="text"
                            id="name"
                            name="name"
                            value="Rahul Menon"
                            required>

                    </div>


                    <div class="form-group">

                        <label for="phone">
                            Phone
                        </label>

                        <input
                            type="text"
                            id="phone"
                            name="phone"
                            value="9876543214"
                            required>

                    </div>


                    <div class="form-group full-width">

                        <label for="email">
                            Email
                        </label>

                        <input
                            type="email"
                            id="email"
                            name="email"
                            value="rahul@gmail.com"
                            required>

                    </div>


                </div>

            </div>


            <!-- ==================== Home Address ==================== -->

            <div class="form-section">

                <div class="section-heading">
                    Home Address
                </div>


                <div class="form-grid">


                    <div class="form-group full-width">

                        <label for="homeStreetAddress">
                            Street Address
                        </label>

                        <input
                            type="text"
                            id="homeStreetAddress"
                            name="homeStreetAddress"
                            value="Kaloor"
                            required>

                    </div>


                    <div class="form-group">

                        <label for="homeCity">
                            City
                        </label>

                        <input
                            type="text"
                            id="homeCity"
                            name="homeCity"
                            value="Kochi"
                            required>

                    </div>


                    <div class="form-group">

                        <label for="homeState">
                            State
                        </label>

                        <input
                            type="text"
                            id="homeState"
                            name="homeState"
                            value="Kerala"
                            required>

                    </div>


                    <div class="form-group">

                        <label for="homeZipCode">
                            Zip Code
                        </label>

                        <input
                            type="text"
                            id="homeZipCode"
                            name="homeZipCode"
                            value="682017"
                            required>

                    </div>


                </div>

            </div>


            <!-- ==================== Office Address ==================== -->

            <div class="form-section">

                <div class="section-heading">
                    Office Address
                </div>


                <div class="form-grid">


                    <div class="form-group full-width">

                        <label for="officeStreetAddress">
                            Street Address
                        </label>

                        <input
                            type="text"
                            id="officeStreetAddress"
                            name="officeStreetAddress"
                            value="Infopark Road"
                            required>

                    </div>


                    <div class="form-group">

                        <label for="officeCity">
                            City
                        </label>

                        <input
                            type="text"
                            id="officeCity"
                            name="officeCity"
                            value="Kochi"
                            required>

                    </div>


                    <div class="form-group">

                        <label for="officeState">
                            State
                        </label>

                        <input
                            type="text"
                            id="officeState"
                            name="officeState"
                            value="Kerala"
                            required>

                    </div>


                    <div class="form-group">

                        <label for="officeZipCode">
                            Zip Code
                        </label>

                        <input
                            type="text"
                            id="officeZipCode"
                            name="officeZipCode"
                            value="682042"
                            required>

                    </div>


                </div>

            </div>


            <!-- ==================== Submit ==================== -->

            <div class="submit-area">

                <button
                    type="button"
                    class="insert-btn"
                    onclick="showConfirmPopup();">

                    Insert User

                </button>

            </div>


        </form>

    </div>


    <!-- ================================================= -->
    <!--              CONFIRMATION POPUP                   -->
    <!-- ================================================= -->

    <div
        class="popup-overlay"
        id="confirmPopup"
        style="display: none;">

        <div class="popup-box">

            <h2>
                Confirm User
            </h2>

            <p>
                Are you sure you want to add this user?
            </p>


            <div class="popup-buttons">

                <button
                    type="button"
                    class="popup-confirm-btn"
                    onclick="confirmInsert();">

                    Yes, Add User

                </button>


                <button
                    type="button"
                    class="popup-cancel-btn"
                    onclick="closeConfirmPopup();">

                    Cancel

                </button>

            </div>

        </div>

    </div>


    <!-- ================================================= -->
    <!--                  SUCCESS POPUP                    -->
    <!-- ================================================= -->

    <%
        if (Boolean.TRUE.equals(insertSuccess)) {
    %>

        <div class="popup-overlay">

            <div class="success-popup-box">

                <h2>
                    User Added Successfully
                </h2>

                <p>
                    The user and address details have been added successfully.
                </p>

                <button
                    type="button"
                    class="popup-ok-btn"
                    onclick="goToUsers();">

                    OK

                </button>

            </div>

        </div>

    <%
        }
    %>


    <!-- ================================================= -->
    <!--                    ERROR POPUP                    -->
    <!-- ================================================= -->

    <%
        if (insertError != null) {
    %>

        <div class="popup-overlay">

            <div class="error-popup-box">

                <h2>
                    Insert Failed
                </h2>

                <p>
                    <%= insertError %>
                </p>

                <button
                    type="button"
                    class="popup-ok-btn"
                    onclick="closeErrorPopup();">

                    OK

                </button>

            </div>

        </div>

    <%
        }
    %>


    <!-- ==================== JavaScript ==================== -->

    <script>


        // Show confirmation popup.
        function showConfirmPopup() {

            const form =
                document.getElementById("userForm");


            /*
             * Check required fields before
             * showing the confirmation popup.
             */
            if (!form.checkValidity()) {

                form.reportValidity();

                return;

            }


            document.getElementById("confirmPopup")
                    .style.display = "flex";
        }


        // Close confirmation popup.
        function closeConfirmPopup() {

            document.getElementById("confirmPopup")
                    .style.display = "none";
        }


        // Submit the form after confirmation.
        function confirmInsert() {

            document.getElementById("userForm").submit();

        }


        // Go to users list after successful insertion.
        function goToUsers() {

            window.location.href = "list";

        }


        // Close error popup.
        function closeErrorPopup() {

            window.location.href = "insert";

        }

    </script>


</body>

</html>