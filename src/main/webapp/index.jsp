<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%
String role = (String) session.getAttribute("role");
%>
<!DOCTYPE html>
<html lang="es">
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
            href="styles/header-styles.css"
        >
        <link
            rel="stylesheet"
            href="styles/main-styles.css"
        >
        <link
            rel="stylesheet"
            href="styles/footer-styles.css"
        >
        <link
            rel="stylesheet"
            href="styles/laConferencia-styles.css"
        >
        <link
            rel="stylesheet"
            href="styles/losOradores-styles.css"
        >
        <link
            rel="stylesheet"
            href="styles/el-lugar-y-la-fecha.css"
        >
        <link
            rel="stylesheet"
            href="styles/conviertete-en-orador.css"
        >
        <title>Conf Bs As</title>
    </head>
    <body>
        <header>
            <div class="logo-container">
                <img
                    class="logo"
                    src="icon/codoacodo.png"
                    alt="logo"
                >
                <span>
                    <h3>Conf Bs As</h3>
                </span>
                <%if (role != null && role.equals("admin")) {%>
                    <a href="backoffice">
                        <figure class="gearContainer">
                            <img
                                class="gear"
                                src="./icon/gear.webp"
                                alt="gear"
                            >
                        </figure>
                    </a>
                <%}%>
            </div>
            <nav id="nav">
                <ul id="ul">
                    <li>
                        <a
                            href="#laConferencia"
                        > La conferencia </a>
                    </li>
                    <li>
                        <a
                            href="#losOradores"
                        > Los oradores </a>
                    </li>
                    <li>
                        <a
                            href="#elLugarYLaFecha"
                        > El lugar y la fecha </a>
                    </li>
                    <%if (session.getAttribute("name") != null) {%>
                        <li>
                            <a
                                href="#convierteteEnOrador"
                            > Conviértete en orador </a>
                        </li>
                        <li class="comprar-tickets">
                            <a
                                class="comprar-tickets"
                                href="comprar-tickets"
                            > Comprar tickets </a>
                        </li>
                        <li>
                            <a
                                class="login"
                                href="logout"
                            > logout </a>
                        </li>
                    <%} else {%>
                        <li>
                            <a
                                class="login"
                                href="login"
                            > login </a>
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
        <main>

            <section
                id="laConferencia"
                class="laConferencia"
            >
                <div class="bg bg3"></div>
                <div class="bg bg2"></div>
                <div class="bg bg1"></div>
                <%if (session.getAttribute("name") != null) {%>
                    <div class="userWelcome">
                        <p>Hola <%=(String) session.getAttribute("name")%>!</p>
                    </div>
                <%}%>
                <div class="contenedor-descripcion-conferencia">
                    <h1>Conf Bs As</h1>
                    <p>
                        Buenos Aires llega por primera vez a Argentina. Un evento para compartir con nuestra comunidad
                        el conocimiento y experiencia de los expertos que estan creando el futuro de Internet. Ven a
                        conocer a los miembros del evento, a otros estudiantes de Codo a Codo y a los oradores de primer
                        nivel que tenemos para tí. Te esperamos!
                    </p>
                    <div class="contenedor-botones">
                        <%if (session.getAttribute("name") != null) {%>
                            <a href="#convierteteEnOrador">
                                <button class="boton-quiero-ser-orador"> Quiero ser orador </button>
                            </a>
                            <a href="comprar-tickets">
                                <button class="boton-comprar-tickets"> Comprar tickets </button>
                            </a>
                        <%}%>
                    </div>
                </div>
            </section>
            <section
                id="losOradores"
                class="losOradores"
            >
                <div class="encabezado">
                    <p>CONOCÉ A LOS</p>
                    <h1>ORADORES</h1>
                </div>
                <div
                    id="cards-container"
                    class="cards-container"
                >
                    <article class="card-orador">
                        <img
                            src="images/los-oradores/Steve-300x300.jpg"
                            alt="Steve Jobs"
                            draggable="false"
                        >
                        <div class="info-container">
                            <div class="tag-container">
                                <span class="tag javascript"> Javascript </span>
                                <span class="tag react"> React </span>
                            </div>
                            <h2>Steve Jobs</h2>
                            <div class="description">
                                <p>
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Perferendis quod voluptatum
                                    libero sint expedita rem sunt eius non accusantium quaerat, iste ab cumque atque.
                                    Exercitationem doloribus atque iure fugiat nesciunt.
                                </p>
                            </div>
                        </div>
                    </article>
                    <article class="card-orador">
                        <img
                            src="images/los-oradores/bill.jpg"
                            alt="Bill Gates"
                            draggable="false"
                        >
                        <div class="info-container">
                            <div class="tag-container">
                                <span class="tag javascript"> Javascript </span>
                                <span class="tag react"> React </span>
                            </div>
                            <h2>Bill Gates</h2>
                            <div class="description">
                                <p>
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Perferendis quod voluptatum
                                    libero sint expedita rem sunt eius non accusantium quaerat, iste ab cumque atque.
                                    Exercitationem doloribus atque iure fugiat nesciunt.
                                </p>
                            </div>
                        </div>
                    </article>
                    <article
                        id="ada"
                        class="card-orador"
                    >
                        <img
                            src="images/los-oradores/ada-300x300.jpg"
                            alt="Ada Lovelace"
                            draggable="false"
                        >
                        <div class="info-container">
                            <div class="tag-container">
                                <span class="tag negocios"> Negocios </span>
                                <span class="tag startups"> Startups </span>
                            </div>
                            <h2>Ada Lovelace</h2>
                            <div class="description">
                                <p>
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Perferendis quod voluptatum
                                    libero sint expedita rem sunt eius non accusantium quaerat, iste ab cumque atque.
                                    Exercitationem doloribus atque iure fugiat nesciunt.
                                </p>
                            </div>
                        </div>
                    </article>
                </div>
            </section>
            <section id="elLugarYLaFecha">
                <aside class="elLugarYLaFecha">
                    <div class="contenedor-imagen">
                    </div>
                    <div class="contenedor-descripcion">
                        <h1>Bs As - Octubre</h1>
                        <p>
                            Buenos Aires es la provincia y localidad mas grande del estado de Argentina, en los Estados
                            Unidos. Honolulu es la mas sureña de entre las principales ciudades estadounidenses. Aunque
                            el
                            nombre de Honolulu se refiere al área urbana en la costa sureste de la isla de Oahu, la
                            ciudad y
                            el condado de Honolulu han formado una ciudad-condado consolidada que cubre toda la ciudad
                            (aproximadamente 600km<sup>2</sup> de superficie).
                        </p>
                        <button>Conocé más</button>
                    </div>
                </aside>
            </section>
            <%if (session.getAttribute("name") != null) {%>
            <section
                id="convierteteEnOrador"
                class="convierteteEnOrador"
            >
                <div class="encabezado-formulario">
                    <h5>CONVIÉRTETE EN UNA/UN</h5>
                    <h1>ORADORA/ORADOR</h1>
                    <p>Anótate como oradora/orador para dar una charla ignite. Cuéntanos de que quieres hablar!</p>
                </div>
                <form
                    id="formulario-conviertete-en-orador"
                    class="formulario"
                >
                    <div class="contenedorInputText">
                        <input
                            name="nombre"
                            type="text"
                            placeholder="Nombre"
                        >
                        <input
                            name="apellido"
                            type="text"
                            placeholder="Apellido"
                        >
                    </div>
                    <textarea
                        name="tema"
                        id=""
                        rows="4"
                        placeholder="Sobre que quieres hablar?"
                    ></textarea>
                    <p>Recuerda incluir un título para tu charla</p>
                    <input
                        type="submit"
                        value="Enviar"
                    >
                </form>
            </section>
            <%}%>
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

        <script src="scripts/header-scripts.js"> </script>
        <script src="scripts/conviertete-en-orador.js"> </script>
        <script src="scripts/los-oradores-scripts.js"></script>
        <input type="hidden" id="name" value="<%=session.getAttribute("name")%>">
        <script>
            let nameasd = document.getElementById("name");
            window.addEventListener("popstate", () => {
                currentPage = window.location.href;
                if (currentPage === "http://localhost:8080/conf-bsas/login") {
                    window.location.href = "http://localhost:8080/conf-bsas/"
                }
            });
        </script>
    </body>
</html>