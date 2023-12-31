<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%
if (session.getAttribute("name") == null) {
    String path = request.getContextPath();
    response.sendRedirect(path + "/");
}
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta
            http-equiv="X-UA-Compatible"
            content="IE=edge"
        >
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0"
        >
        <link
            rel="shortcut icon"
            href="https://aulasvirtuales.bue.edu.ar/theme/image.php/academiaba38/theme/1681591056/favicon"
            type="image/x-icon"
        >
        <link
            rel="stylesheet"
            href="index.css"
        >
        <link
            rel="stylesheet"
            href="styles/tickets/tickets-styles.css"
        >
        <link
            rel="stylesheet"
            href="styles/tickets/cards-section.css"
        >
        <link
            rel="stylesheet"
            href="styles/tickets/info-tickets-section.css"
        >
        <link
            rel="stylesheet"
            href="styles/tickets/form-section.css"
        >
        <link
            rel="stylesheet"
            href="styles/header-styles.css"
        >
        <link
            rel="stylesheet"
            href="styles/footer-styles.css"
        >
        <title>Conf Bs As - Tickets</title>
    </head>
    <body>
        <header>
            <div class="logo-container">
                <a href="<%=request.getContextPath()%>/">
                    <img
                        class="logo"
                        src="icon/codoacodo.png"
                        alt="logo"
                    >
                </a>
                <span>
                    <h3>Conf Bs As</h3>
                </span>
            </div>
            <nav id="nav">
                <ul id="ul">
                    <li>
                        <a href="<%=request.getContextPath()%>/"> La conferencia </a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/#losOradores"> Los oradores </a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/#elLugarYLaFecha"> El lugar y la fecha </a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/#convierteteEnOrador"> Conviértete en orador </a>
                    </li>
                    <%if (session.getAttribute("name") != null) {%>
                        <li>
                            <a
                                class="login"
                                href="logout"
                            > logout </a>
                        </li>
                    <%}%>
                </ul>
            </nav>
            <button id="boton-menu">
                <div></div>
                <div></div>
                <div></div>
            </button>
        </header>
        <div class="fondo">
            <div class="box"></div>
        </div>
        <main>
            <section id="cards-container">
                <article
                    class="promoCard"
                    id="estudiante"
                >
                    <h1>Estudiante</h1>
                    <p>Tiene un descuento</p>
                    <h2>80%</h2>
                    <p>* presentar documentación</p>
                </article>
                <article
                    class="promoCard"
                    id="trainee"
                >
                    <h1>Trainee</h1>
                    <p>Tiene un descuento</p>
                    <h2>50%</h2>
                    <p>* presentar documentación</p>
                </article>
                <article
                    class="promoCard"
                    id="junior"
                >
                    <h1>Junior</h1>
                    <p>Tiene un descuento</p>
                    <h2>15%</h2>
                    <p>* presentar documentación</p>
                </article>
            </section>
            <section id="info-tickets">
                <h5>VENTA</h5>
                <h1>VALOR DEL TICKET $200</h1>
            </section>
            <section id="form-section">
                <form id="form">
                    <div class="nombre-apellido">
                        <div class="input-container">
                            <input
                                type="text"
                                name="nombre"
                                id="nombre"
                                placeholder="Nombre"
                            >
                            <div
                                class="errorMessage"
                                id="errorName"
                            >Mínimo 5 letras</div>
                        </div>
                        <div class="input-container">
                            <input
                                type="text"
                                name="apellido"
                                id="apellido"
                                placeholder="Apellido"
                            >
                            <div
                                class="errorMessage"
                                id="errorLastName"
                            >Mínimo 5 letras</div>
                        </div>
                    </div>
                    <div class="input-container">
                        <input
                            type="text"
                            name="email"
                            id="email"
                            placeholder="Correo"
                        >
                        <div
                            class="errorMessage"
                            id="errorEmail"
                        >Formato inválido</div>
                    </div>
                    <div class="cantidad-categoria">
                        <div class="cantidad">
                            <label for="cantidad">Cantidad</label>
                            <div class="input-container">
                                <input
                                    type="number"
                                    inputmode="numeric"
                                    name="cantidad"
                                    id="cantidad"
                                >
                                <div
                                    class="errorMessage"
                                    id="errorQuantity"
                                >Mín. 1 ticket</div>
                            </div>
                        </div>
                        <div class="categoria">
                            <label>Categoría</label>
                            <div class="input-container">
                                <select
                                    name="categoria"
                                    id="categoria"
                                >
                                    <option
                                        value="seleccionar"
                                        disabled
                                        selected
                                        hidden
                                    >Seleccionar</option>
                                    <option value="estudiante">Estudiante</option>
                                    <option value="trainee">Trainee</option>
                                    <option value="junior">Junior</option>
                                </select>
                                <div
                                    class="errorMessage"
                                    id="errorSelect"
                                >Seleccionar una categoría</div>
                            </div>
                        </div>
                    </div>
                    <input
                        type="text"
                        name="total-a-pagar"
                        id="total-a-pagar"
                        value="Total a pagar: "
                        disabled
                    >
                    <div class="input-container">
                        <div class="borrar-resumen">
                            <input
                                type="reset"
                                id="borrar"
                                value="Borrar"
                            >
                            <input
                                type="submit"
                                id="resumen"
                                value="Resumen"
                            >
                            <div
                                class="errorMessage"
                                id="errorSubmit"
                            >Hay campos vacios o con errores</div>
                        </div>
                    </div>
                </form>
            </section>
        </main>
        <footer>
            <span>Preguntas frecuentes</span>
            <span>Contáctenos</span>
            <span>Prensa</span>
            <span>Conferencias</span>
            <span>Términos y condiciones</span>
            <span>Privacidad</span>
            <span>Estudiantes</span>
        </footer>

        <script
            type="module"
            src="scripts/comprar-tickets.js"
        ></script>
        <script src="scripts/header-scripts.js"></script>
        <script src="scripts/los-oradores-scripts.js"></script>
    </body>
</html>