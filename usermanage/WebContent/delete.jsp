<!--
    Delete confirmation popup.

    The selected user ID and name
    are received from list.jsp
    through JavaScript.
-->


<!-- ================================================= -->
<!--              DELETE CONFIRMATION                  -->
<!-- ================================================= -->

<div
    class="delete-popup-overlay"
    id="deletePopup"
    style="display: none;">


    <div class="delete-popup-box">


        <!-- ==================== Title ==================== -->

        <h2>

            Confirm Delete

        </h2>


        <!-- ==================== Selected User ==================== -->

        <div class="delete-user-details">

            <p>

                User ID:

                <strong id="deleteDisplayUserId"></strong>

            </p>


            <p>

                Name:

                <strong id="deleteDisplayUserName"></strong>

            </p>

        </div>


        <!-- ==================== Message ==================== -->

        <p>

            Are you sure you want to delete this user?

        </p>


        <!-- ==================== Buttons ==================== -->

        <div class="delete-popup-buttons">


            <!-- ==================== Yes, Delete ==================== -->

            <form
                action="delete"
                method="post">


                <!--
                    Hidden input.

                    JavaScript puts the selected
                    user's ID into this input.
                -->

                <input
                    type="hidden"
                    name="id"
                    id="deleteUserId">


                <button
                    type="submit"
                    class="delete-confirm-btn">

                    Yes, Delete

                </button>


            </form>


            <!-- ==================== Cancel ==================== -->

            <button
                type="button"
                class="delete-cancel-btn"
                onclick="closeDeletePopup();">

                Cancel

            </button>


        </div>


    </div>


</div>


<!-- ================================================= -->
<!--                 DELETE JAVASCRIPT                 -->
<!-- ================================================= -->

<script>


    /*
     * Show the delete confirmation popup.
     *
     * userId = selected user's ID.
     *
     * userName = selected user's name.
     */
    function showDeletePopup(userId, userName) {


        // Put the selected user ID
        // into the hidden form input.

        document.getElementById("deleteUserId")
                .value = userId;


        // Display the selected user's ID.

        document.getElementById("deleteDisplayUserId")
                .textContent = userId;


        // Display the selected user's name.

        document.getElementById("deleteDisplayUserName")
                .textContent = userName;


        // Show the confirmation popup.

        document.getElementById("deletePopup")
                .style.display = "flex";


    }


    /*
     * Close the delete confirmation popup.
     */
    function closeDeletePopup() {


        document.getElementById("deletePopup")
                .style.display = "none";


    }


</script>