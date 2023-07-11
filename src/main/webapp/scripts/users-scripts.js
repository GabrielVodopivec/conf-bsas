let usersTable = document.getElementById("usersTable");
usersTable.style.display = "none";
const parseJson = (response) => response.json();
const error = (err) => { console.log(err) };
const print = (data) => { console.log(data); }
const getData = (url) => {
    fetch(url)
        .then(parseJson)
        .then(print)
        .catch(() => { console.log("Putamadre"); });
}


const url = "http://localhost:8080/conf-bsas/backoffice/users/json";
// getData(url)

try {
    const res = await fetch(url);
    const data = await res.json();
    for (let element in data) {
        const user = data[element];
        const row = document.createElement("tr");
        let description = ["id", "name", "email", "role", "status"];
        for (let desc in description) {
            const td = document.createElement("td");
            td.innerText = user[description[desc]];
            row.append(td);

        }
        const a = document.createElement("a");
        a.setAttribute(
            "href",
            `http://localhost:8080/conf-bsas/backoffice/users/modify?id=${user.id}&status=${user.status}`
        )
        a.innerText = user.status === "active" ? "bloquear" : "activar";
        a.classList.add("link-modicar-status")
        const td = document.createElement("td");
        td.append(a);
        row.append(td);
        usersTable.append(row)


    }

    usersTable.style.display = "block";

} catch (e) {
    console.log("Otra vez todo pal culo");
}