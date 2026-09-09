<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management System</title>

    <style>
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

        .navbar {
            height: 68px;
            background: #111111;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 7%;
        }

        .logo {
            color: #ffffff;
            font-size: 21px;
            font-weight: 600;
        }

        .home {
            color: #ffffff;
            text-decoration: none;
            font-size: 15px;
            padding: 8px 14px;
            border: 1px solid transparent;
            border-radius: 5px;
            transition: 0.25s;
        }

        .home:hover {
            background: #ffffff;
            color: #111111;
        }

        .main {
            min-height: calc(100vh - 68px);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px;
        }

        .box {
            width: 700px;
            padding: 55px 60px;
            background: #ffffff;
            border: 1px solid #111111;
            border-radius: 12px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.10);
            text-align: center;
        }

        .box h1 {
            font-size: 32px;
            font-weight: 600;
            margin-bottom: 12px;
        }

        .box p {
            color: #666666;
            font-size: 15px;
            margin-bottom: 35px;
        }

        .menu {
            display: flex;
            justify-content: center;
            gap: 15px;
        }

        .menu a {
            flex: 1;
            padding: 16px 12px;
            text-decoration: none;
            color: #111111;
            background: #ffffff;
            border: 1px solid #111111;
            border-radius: 7px;
            font-size: 15px;
            font-weight: 500;
            transition: 0.25s ease;
        }

        .menu a:hover {
            background: #111111;
            color: #ffffff;
            transform: translateY(-4px);
            box-shadow: 0 8px 18px rgba(0, 0, 0, 0.18);
        }

        @media (max-width: 750px) {
            .box {
                width: 100%;
                padding: 45px 30px;
            }

            .menu {
                flex-direction: column;
            }
        }
    </style>
</head>

<body>

    <nav class="navbar">
        <div class="logo">User Management System</div>
        <a class="home" href="./">Home</a>
    </nav>

    <main class="main">

        <div class="box">

            <h1>User Management System</h1>

            <p>Select an option to continue</p>

            <div class="menu">
                <a href="insert">Insert User</a>
                <a href="list">List All Users</a>
                <a href="find">Find A User</a>
            </div>

        </div>

    </main>

</body>
</html>