
function getAdminUser() {
    return JSON.parse(localStorage.getItem('admin-user'));
}

function setAdminUser(user) {
    localStorage.setItem('admin-user', JSON.stringify(user));
}

function removeAdminUser() {
    localStorage.removeItem('admin-user');
}

function getUser() {
    return JSON.parse(localStorage.getItem('user'));
}

function setUser(user) {
    localStorage.setItem('user', JSON.stringify(user));
}

function removeUser() {
    localStorage.removeItem('user');
}

export { getAdminUser, setAdminUser, removeAdminUser, getUser, setUser, removeUser };