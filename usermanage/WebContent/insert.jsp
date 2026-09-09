
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert User</title>
</head>

<body>

    <h1>Insert User</h1>

    <form action="insert" method="post">

        <!-- ==================== User Details ==================== -->
        <h2>User Details</h2>

        <label>Name:</label>
        <input type="text" name="name" value="Rahul Menon" required>
        <br><br>

        <label>Phone:</label>
        <input type="text" name="phone" value="9876543214" required>
        <br><br>

        <label>Email:</label>
        <input type="email" name="email" value="rahul@gmail.com" required>
        <br><br>


        <!-- ==================== Home Address ==================== -->
        <h2>Home Address</h2>

        <label>Street Address:</label>
        <input type="text" name="homeStreetAddress" value="Kaloor" required>
        <br><br>

        <label>City:</label>
        <input type="text" name="homeCity" value="Kochi" required>
        <br><br>

        <label>State:</label>
        <input type="text" name="homeState" value="Kerala" required>
        <br><br>

        <label>Zip Code:</label>
        <input type="text" name="homeZipCode" value="682017" required>
        <br><br>


        <!-- ==================== Office Address ==================== -->
        <h2>Office Address</h2>

        <label>Street Address:</label>
        <input type="text" name="officeStreetAddress" value="Infopark Road" required>
        <br><br>

        <label>City:</label>
        <input type="text" name="officeCity" value="Kochi" required>
        <br><br>

        <label>State:</label>
        <input type="text" name="officeState" value="Kerala" required>
        <br><br>

        <label>Zip Code:</label>
        <input type="text" name="officeZipCode" value="682042" required>
        <br><br>


        <!-- ==================== Submit ==================== -->
        <input type="submit" value="Insert User">

    </form>

</body>
</html>

