let signupForm = document.getElementById(`signupForm`);
const formData = { name: ``, lastName: ``, email: ``, password: ``, password2: `` };
const formErrors = { name: ``, lastName: ``, email: ``, password: ``, password2: `` };

let wrongEmailFormat = (value) => {
    let emailRegExp = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return !emailRegExp.test(value);
}

let checkEmptyString = (value) => value === ``;

const checkStringLength = (value, min, max) => {
    let minLength = value.length >= min;
    let maxLength = value.length <= max;
    return {
        invalidLength: !(minLength && maxLength),
        minLength
    }
}

const hasOnlyNumbers = (value) => {
    const regExp = /[0-9]/;
    return regExp.test(value);
}

const setEmailErrors = (email, formErrors) => {
    if (checkEmptyString(email)) {
        formErrors.email = `Requerido`;
    } else if (wrongEmailFormat(email)) {
        formErrors.email = `Formato de email inválido`;
    } else formErrors.email = ``;
}

const setPasswordErrors = (password, formErrors) => {
    const MIN = 5, MAX = 15;
    let { invalidLength, minLength } = checkStringLength(password, MIN, MAX);
    if (checkEmptyString(password)) {
        formErrors.password = `Requerido`;
    } else if (invalidLength) {
        const errorMessage = minLength
            ? `Max. ${MAX} caracteres`
            : `Min. ${MIN} caracteres`;
        formErrors.password = errorMessage;
    } else formErrors.password = ``;
}

const setConfirmPasswordErrors = (password, password2, formErrors) => {
    if (checkEmptyString(password2)) {
        formErrors.password2 = `Requerido`;
    } else if (checkEmptyString(password)) {
        formErrors.password2 = `Primero va el password Pa...`;
    } else if (password !== password2) {
        formErrors.password2 = `Los passwords no coinciden`;
    } else formErrors.password2 = ``;
}

const setNameErrors = (input, value, formErrors) => {
    const MIN = 3, MAX = 15;
    let { invalidLength, minLength } = checkStringLength(value, MIN, MAX);
    if (checkEmptyString(value)) {
        formErrors[input] = `Requerido`;
    } else if (invalidLength) {
        formErrors[input] = minLength
            ? `Max. ${MAX} caracteres`
            : `Min. ${MIN} caracteres`;
    } else if (hasOnlyNumbers(value)) {
        formErrors[input] = `Debe contener letras`;
    } else formErrors[input] = ``;
}

const handleErrors = ({ name, lastName, email, password, password2 }, formErrors) => {
    setEmailErrors(email, formErrors);
    setPasswordErrors(password, formErrors);
    setConfirmPasswordErrors(password, password2, formErrors);
    setNameErrors(`name`, name, formErrors);
    setNameErrors(`lastName`, lastName, formErrors);
}

const checkErrors = (formData, formErrors, e) => {
    let hasErrors = false;
    const { type, target: { id, name }, relatedTarget } = e;
    if (type === `submit`) {
        for (let errorType in formErrors) {
            const errorMessage = formErrors[errorType],
                errorElement = document.getElementById(`error-${errorType}`);
            if (errorMessage !== ``) {
                hasErrors = true;
                errorElement.innerText = errorMessage;
            } else {
                errorElement.innerText = ``;
            }
        }
        return hasErrors;
    } else if (type === `blur`) {
        if (!relatedTarget?.id.startsWith(`toggle`)) {
            if (formData[name] !== ``) {
                document.getElementById(`error-${id}`)
                    .innerText = formErrors[name];
            }
        }
    } else {
        document.getElementById(`error-${id}`)
            .innerText = ``;
    }
}

const handleSubmit = (e) => {
    handleErrors(formData, formErrors);
    if (checkErrors(formData, formErrors, e)) e.preventDefault();
}

const handleState = (event) => {
    const { target: { name, value } } = event;
    formData[name] = value;
    handleErrors(formData, formErrors);
    checkErrors(formData, formErrors, event);
}

signupForm.oninput = handleState;
signupForm.onsubmit = handleSubmit;

let { elements } = signupForm;
for (let element of elements) {
    if (element.type !== `submit`) {
        element.onblur = handleState;
    }
}

const pass = {
    toggleID: `togglePasswordVisibility`,
    id: `password`,
    iconID: `icon-password`
}
const pass2 = {
    toggleID: `togglePasswordVisibility2`,
    id: `password2`,
    iconID: `icon-password2`
}

const handleVisibility = ({ toggleID, id, iconID }) => {
    let togglePasswordVisibility = document.getElementById(toggleID);
    togglePasswordVisibility.onclick = () => {
        let pass = document.getElementById(id);
        let icon = document.getElementById(iconID);
        if (pass.type === `password`) {
            icon.src = "./icon/eye_opened.png"
            pass.type = `text`;
        } else {
            icon.src = "./icon/eye_closed.png"
            pass.type = `password`;
        }
        pass.focus();
    }
}

handleVisibility(pass);
handleVisibility(pass2);