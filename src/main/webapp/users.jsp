<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/index.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/styles/header-styles.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/styles/users-styles.css">
        <title>users</title>
    </head>
    <body>
        <header>
            <div class="logo-container">
                <img class="logo" src="<%=request.getContextPath()%>/icon/codoacodo.png" alt="logo">
                <span>
                    <h3>Conf Bs As</h3>
                </span>
            </div>
            <nav id="nav">
                <ul id="ul">
                    <li>
                        <a
                            href="<%=request.getContextPath()%>/backoffice"
                        > Panel de administración </a>
                    </li>
                    <li class="comprar-tickets">
                        <a class="login" href="<%=request.getContextPath()%>/logout"> logout </a>
                    </li>
                </ul>
            </nav>
            <button id="boton-menu">
                <div></div>
                <div></div>
                <div></div>
            </button>
        </header>
        <main>
            <div class="tableContainer">
                <table id="usersTable" class="usersTable">
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Email</th>
                        <th>Rol</th>
                        <th>Estado</th>
                        <th></th>
                    </tr>
                </table>
            </div>
        </main>
        <footer></footer>
        <script src="<%=request.getContextPath()%>/scripts/header-scripts.js"> </script>
        <script type="module" src="<%=request.getContextPath()%>/scripts/users-scripts.js"></script>
    </body>
</html>