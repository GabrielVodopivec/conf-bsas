<%@ page contentType="text/html" pageEncoding="UTF-8" import="java.util.*"%>
<%
Map<String, String> userInfo = (Map<String, String>) session.getAttribute("userInfo");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="index.css">
        <link rel="stylesheet" href="styles/login-signup-styles.css">
        <title>SignUp</title>
    </head>
    <body>
        <div class="container">
            <form id="signupForm" method="POST">
                <div class="formContent">
                    <figure class="signup">
                        <a href="<%=request.getContextPath()%>">
                            <img
                                src="icon/codoacodo.png"
                                alt="codoacodo"
                            >
                        </a>
                    </figure>
                    <div class="inputsContainer">

                        <div class="inputContainer">
                            <label for="name"></label>
                            <input
                                class="input"
                                id="name"
                                name="name"
                                type="text"
                                placeholder="nombre"
                                autocomplete="off"
                                value="<%=Objects.nonNull(userInfo) ? userInfo.get("name") : ""%>"
                            >
                            <p
                                id="error-name"
                                class="errorMessage"
                            ></p>
                        </div>
                        <div class="inputContainer">
                            <label for="lastName"></label>
                            <input
                                class="input"
                                id="lastName"
                                name="lastName"
                                type="text"
                                autocomplete="off"
                                placeholder="apellido"
                                value="<%=Objects.nonNull(userInfo) ? userInfo.get("lastName") : ""%>"
                            >
                            <p
                                id="error-lastName"
                                class="errorMessage"
                            ></p>
                        </div>
                        <div class="inputContainer">
                            <label for="email"></label>
                            <input
                                class="input"
                                id="email"
                                name="email"
                                inputmode="email"
                                autocapitalize="off"
                                type="text"
                                autocomplete="off"
                                placeholder="mail@example.com"
                                value="<%=Objects.nonNull(userInfo) ? userInfo.get("email") : ""%>"
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
                                autocomplete="new-password"
                                value="<%=Objects.nonNull(userInfo) ? userInfo.get("password") : ""%>"
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
                        <div class="inputContainer">
                            <label for="password2"></label>
                            <input
                                class="input"
                                id="password2"
                                name="password2"
                                type="password"
                                placeholder="confirmar password"
                                autocomplete="new-password"
                            >
                            <button
                                type="button"
                                id="togglePasswordVisibility2"
                                class="togglePasswordVisibility"
                            >
                                <img
                                    id="icon-password2"
                                    class="icon-password"
                                    src="icon/eye_closed.png"
                                    alt="ojo"
                                >
                            </button>
                            <p
                                id="error-password2"
                                class="errorMessage"
                            ></p>
                        </div>
                        <div class="submitContainer">
                            <input
                                type="submit"
                                value="Sign Up"
                            >
                            <a href="login">Ya estoy registrado</a>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="login-signup-scripts/signup.js"></script>
        <input type="hidden" id="signupStatus" value="<%=session.getAttribute("signupStatus")%>">
        <script>
            let { value } = document.getElementById("signupStatus");
            if (value === "success") {
                Swal.fire({
                    title: 'Registro exitoso!',
                    icon: 'success',
                    backdrop: false,
                    showConfirmButton: false,
                    focusConfirm: false,
                    background: '#333333',
                    color: '#f7ede2',
                    html:
                        '<a style="margin-right: 30px; padding: 0px 15px; color: #ffb703;" href="login">login</a> ' +
                        '<a style="padding: 0px 15px; color: #ffb703;" href="/conf-bsas/">inicio</a> '
                })
            } else if (value !== "initial") {
                    Swal.fire({
                        title: "No pudimos registrarte...",
                        text: value,
                        icon: 'error',
                        color: '#f7ede2',
                        backdrop: true,
                        background: '#333333'
                    })
                    for (let element of elements) {
                        const { type, name, value } = element;
                        if (type !== `submit` && type !== `button`) {
                            formData[name] = value;
                        }
                    }
                    document.getElementById(`error-email`)
                            .innerText = `Ingresar email diferente`;
            }
        </script>
    </body>
</html>