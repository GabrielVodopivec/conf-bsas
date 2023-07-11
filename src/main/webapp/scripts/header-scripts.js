const botonMenu = document.getElementById("boton-menu");
const firstDiv = botonMenu.firstElementChild;
const nav = document.getElementById("nav");
const link = document.getElementsByTagName("a");

const moveNavbarDelay = () => {
    setTimeout(() => {
        moveNavbar();
    }, 0)
}

const moveNavbar = () => {

    if (nav.classList.contains("active")) {
        nav.classList.remove("active")
        firstDiv.classList.remove("sup");
        firstDiv.nextElementSibling.classList.remove("mid");
        botonMenu.lastElementChild.classList.remove("inf");
    } else {
        nav.classList.add("active");
        firstDiv.classList.add("sup");
        firstDiv.nextElementSibling.classList.add("mid");
        botonMenu.lastElementChild.classList.add("inf");
    }
}

botonMenu.onclick = moveNavbar;
nav.onclick = moveNavbarDelay;