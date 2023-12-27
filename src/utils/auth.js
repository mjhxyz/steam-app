
function getAdminUser() {
    return JSON.parse(localStorage.getItem('admin-user'));
}

function setAdminUser(user) {
    localStorage.setItem('admin-user', JSON.stringify(user));
}

function removeAdminUser() {
    localStorage.removeItem('admin-user');
}

export { getAdminUser, setAdminUser, removeAdminUser}