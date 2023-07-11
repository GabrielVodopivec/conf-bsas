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
            href="styles/error-page-styles.css"
        >
        <title>Not Found</title>
    </head>
    <body>
            <figure>
                <img
                    src="icon/codoacodo.png"
                    alt="codoacodo"
                >
            </figure>
            <div class="error-message">
                <h2>Oops! parece que la pagina que buscas no existe...</h2>
            </div>
            <a href="<%=request.getContextPath()%>">Volver al inicio</a>
        </body>
</html>