<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0"
        >
        <link
            rel="stylesheet"
            href="index.css"
        >
        <link
            rel="stylesheet"
            href="styles/header-styles.css"
        >
        <link
            rel="stylesheet"
            href="styles/admin-panel-styles.css"
        >
        <title>backoffice</title>
    </head>
    <body>
        <header>
            <div class="logo-container">
                <img
                    class="logo"
                    src="./icon/codoacodo.png"
                    alt="logo"
                >
                <span>
                    <h3>Conf Bs As</h3>
                </span>

            </div>
            <nav id="nav">
                <ul id="ul">
                    <li class="comprar-tickets">
                        <a
                            class="login"
                            href="logout"
                        > logout </a>
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
            <h1>Panel de administración</h1>
            <div class="panel">
                <a
                    class="menuItem"
                    href="<%=request.getContextPath()%>/backoffice/users"
                >
                    Gestionar Usuarios
                </a>
                <a
                    class="menuItem"
                    href="#"
                >
                    Editar contenido de la página
                </a>
                <a
                    class="menuItem"
                    href="<%=request.getContextPath()%>"
                >
                    Ir a la Página
                </a>
            </div>
        </main>
        <script src="./scripts/header-scripts.js"> </script>
    </body>
</html>