
function getAdminUser() {
    return JSON.parse(localStorage.getItem('admin-user'));
}

function setAdminUser(user) {
    localStorage.setItem('admin-user', JSON.stringify(user));
}

export { getAdminUser, setAdminUser }