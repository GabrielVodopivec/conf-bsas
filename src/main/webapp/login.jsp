<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%
	if(session.getAttribute("name") != null){
		response.sendRedirect(request.getContextPath());
	}
%>
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
            href="styles/login-signup-styles.css"
        >
        <title>login</title>
    </head>
    <body>
        <div class="container">
            <form action="login" id="loginForm" method="POST">
                <div class="formContent">
                    <figure class="login">
                        <a href="<%=request.getContextPath()%>/">
                            <img
                                src="icon/codoacodo.png"
                                alt="codoacodo"
                            >
                        </a>
                    </figure>
                    <div class="inputsContainer">

                        <div class="inputContainer">
                            <label for="email"></label>
                            <input
                                class="input"
                                id="email"
                                name="email"
                                type="text"
                                inputmode="email"
                                autocapitalize="off"
                                placeholder="email"
                                autocomplete="off"
                            >
                            <p
                                id="error-email"
                                class="errorMessage"
                            ></p>
                        </div>

                        <div class="inputContainer">
                            <label for="password"></label>
                            <input
                                class="input"
                                id="password"
                                name="password"
                                type="password"
                                placeholder="password"
                                autocomplete="off"
                            >
                            <button
                                type="button"
                                id="togglePasswordVisibility"
                                class="togglePasswordVisibility"
                            >
                                <img
                                    id="icon-password"
                                    class="icon-password"
                                    src="icon/eye_closed.png"
                                    alt="ojo"
                                >
                            </button>
                            <p
                                id="error-password"
                                class="errorMessage"
                            ></p>
                        </div>
                        <div class="submitContainer login">
                            <input
                                id="submit"
                                type="submit"
                                value="login"
                            >
                            <a href="signup">Registrarme</a>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="login-signup-scripts/login.js"></script>
        <input type="hidden" id="loginStatus" value="<%=session.getAttribute("loginStatus")%>">

        <script>
            let loginStatus = document.getElementById("loginStatus");
            if (loginStatus.value !== "initial") {
                let msg;
                if (loginStatus.value == "banned") {
                    msg = "Esta cuenta ha sido bloqueada";
                } else { msg = "Usuario o contraseña incorrectos" }
                    Swal.fire({
                        title: "No has podido iniciar sesión",
                        text: msg,
                        icon: 'error',
                        color: '#f7ede2',
                        backdrop: true,
                        background: '#333333',
                        showClass: {
                            popup: 'animate__animated animate__fadeInDown'
                        },
                        hideClass: {
                            popup: 'animate__animated animate__fadeOutUp'
                        }
                    })

            }
            window.addEventListener("popstate", () => {
                            currentPage = window.location.href;
                            if (currentPage === "http://localhost:8080/conf-bsas/login") {
                                window.location.href = "http://localhost:8080/conf-bsas/"
                            }
                        });

            window.onbeforeunload = function() {
              history.pushState("Preventor", "No podes volver al login si ya estas logeado", "/conf-bsas/");
              history.back();
            };
        </script>
    </body>
</html>