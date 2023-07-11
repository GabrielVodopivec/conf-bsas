let loginForm = document.getElementById("loginForm");

const formData = { email: "", password: "" };
const formErrors = { email: "", password: "" };

let wrongEmailFormat = (value) => {
    let emailRegExp = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return !emailRegExp.test(value)
}

let checkEmptyString = (value) => value === "";

const checkStringLength = (value, min, max) => {
    let minLength = value.length >= min;
    let maxLength = value.length <= max;
    return {
        invalidLength: !(minLength && maxLength),
        minLength
    }
}

const handleErrors = ({ email, password }, formErrors) => {

    const MIN = 5, MAX = 9;
    let { invalidLength, minLength } = checkStringLength(password, MIN, MAX)

    if (checkEmptyString(email)) {
        formErrors.email = "Requerido";
    } else if (wrongEmailFormat(email)) {
        formErrors.email = "Formato de email inválido";
    } else formErrors.email = "";

    if (checkEmptyString(password)) {
        formErrors.password = "Requerido";
    } else if (invalidLength) {
        const errorMessage = minLength
            ? `Max. ${MAX} caracteres`
            : `Min. ${MIN} caracteres`;
        formErrors.password = errorMessage;
    } else formErrors.password = "";
}

const checkErrors = (formData, formErrors, e) => {
    let hasErrors = false;
    const { type, target: { id, name }, relatedTarget } = e;
    if (type === "submit") {
        for (let errorType in formErrors) {
            const errorMessage = formErrors[errorType];
            if (errorMessage) {
                hasErrors = true;
                document.getElementById(`error-${errorType}`)
                    .innerText = errorMessage;
            }
        }
        return hasErrors;
    } else if (type === "blur") {
        if (id !== "password" || !relatedTarget?.id.startsWith("toggle")) {
            if (formData[name] !== "") {
                document.getElementById(`error-${id}`)
                    .innerText = formErrors[name];
            }
        }
    } else {
        document.getElementById(`error-${id}`)
            .innerText = "";
    }
}

const handleSubmit = (event) => {
    handleErrors(formData, formErrors);
    if (checkErrors(formData, formErrors, event))
        event.preventDefault();
}


const handleState = (event) => {
    const { target: { name, value } } = event;
    formData[name] = value;
    handleErrors(formData, formErrors);
    checkErrors(formData, formErrors, event);
}

loginForm.oninput = handleState;
loginForm.onsubmit = handleSubmit;

let { elements } = loginForm;
for (let element of elements) {
    if (element.type !== "submit") {
        element.onblur = handleState;
    }
}

const pass = {
    toggleId: "togglePasswordVisibility",
    id: "password",
    iconId: "icon-password"
}

const handleVisibility = ({ toggleId, id, iconId }) => {
    let togglePasswordVisibility = document.getElementById(toggleId);
    togglePasswordVisibility.onclick = () => {
        let pass = document.getElementById(id);
        let icon = document.getElementById(iconId);
        if (pass.type === "password") {
            icon.src = "./icon/eye_opened.png"
            pass.type = "text";
        } else {
            icon.src = "./icon/eye_closed.png"
            pass.type = "password";
        }
        pass.focus();
    }
}

handleVisibility(pass);