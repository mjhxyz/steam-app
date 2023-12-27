var http = require('http');
var mysql = require('mysql');
const md5 = require('js-md5');


/**************************** mysql 操作 */

const conn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '000000',
    database: 'steam_store'
});

conn.connect();

function mysqlQuery(sql, params) {
    return new Promise((resolve, reject) => {
        conn.query(sql, params, (err, result) => {
            if (err) {
                reject(err);
            }
            resolve(result);
        })
    })
}

function mysqlInsert(sql, params) {
    return new Promise((resolve, reject) => {
        conn.query(sql, params, (err, result) => {
            if (err) {
                reject(err);
            }
            resolve(result);
        })
    }
    )
}


/************************************** */

function error(code, msg) {
    return {
        code: 1000,
        msg
    }
}

function ok(data) {
    return {
        code: 2000,
        data
    }
}

function getPostData(req) {
    return new Promise((resolve, reject) => {
        try {
            let postData = '';
            req.on('data', chunk => {
                postData += chunk.toString();
            });
            req.on('end', () => {
                resolve(postData);
            })
        } catch (error) {
            reject(error);
        }
    })
}

async function getJson(req) {
    return JSON.parse(await getPostData(req));
}

const dispatcher = {
    /*************************** 前端 */
    '/user/login': async (req, res) => {
        res.statusCode = 200;
        let userForm = await getJson(req);
        console.log(userForm);
        return userForm;
    },
    '/user/register': async (req, res) => {
        // 用户注册
        res.statusCode = 200;
        let userForm = await getJson(req);
        let { login_name, login_pwd } = userForm;
        // 判断用户名是否存在
        let sql = 'select * from steam_user where login_name = ?';
        let result = await mysqlQuery(sql, [login_name]);
        if (result.length > 0) {
            return error(1000, '用户名已存在');
        }
        login_pwd = md5(login_pwd + login_name);
        // 注册
        sql = 'insert into steam_user (login_name, login_pwd) values (?, ?)';
        result = await mysqlInsert(sql, [login_name, login_pwd]);
        return ok(result);
    },
    '/': (req, res) => {
        res.statusCode = 200;
        res.end(JSON.stringify({ text: 'hello world' }));
    },

    /*************************** 后端管理 */
    // 删除用户
    '/admin/delete_user': async (req, res) => {
        res.statusCode = 200;
        let userForm = await getJson(req);
        console.log(userForm)
        let { id } = userForm;
        let sql = 'delete from steam_user where id = ? and is_admin=0';
        let result = await mysqlQuery(sql, [id]);
        return ok(result);
    },
    // 获取所有用户信息
    '/admin/user_list': async (req, res) => {
        res.statusCode = 200;
        let sql = 'select * from steam_user where is_admin=0';
        let result = await mysqlQuery(sql);
        return ok(result);
    },
    // 登录
    '/admin/login': async (req, res) => {
        res.statusCode = 200;
        let userForm = await getJson(req);
        let { login_name, login_pwd } = userForm;
        // 判断用户名是否存在
        let sql = 'select * from steam_user where login_name = ? and is_admin = 1';
        let result = await mysqlQuery(sql, [login_name]);
        if (result.length === 0) {
            return error(1000, '用户名不存在');
        }
        // 判断密码是否正确
        login_pwd = md5(login_pwd + login_name);
        console.log(login_pwd);
        let user = result[0];
        if (user.login_pwd !== login_pwd) {
            return error(1000, '密码错误');
        }
        // 登录成功
        return ok(user);
    }

    // 注册
}

var onRequest = async function (req, res) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader("Access-Control-Allow-Methods", "PUT,GET,POST,DELETE,OPTIONS");
    res.setHeader("Access-Control-Allow-Headers", "Content-Type,M-Token");
    if (req.method === 'OPTIONS') {
        console.log(req.method)
        // 发送 204 响应 (无内容) 对预检请求进行响应
        res.writeHead(204, { 'Content-Type': 'text/plain' });
        return res.end();
    }
    res.writeHead(200, { 'Content-Type': 'application/json' });


    const urls = req.url.split('?');
    const requestAddress = urls[0];

    //定义json对象
    var myObj = {
        msg: "服务器出错了，请联系管理员",
        code: 1000,
    };
    if (dispatcher[requestAddress] instanceof Function) {
        try {
            const result = await dispatcher[requestAddress](req, res)
            return res.end(JSON.stringify(result));
        } catch (e) {
            console.error(e);
        }
    } else {
        let r = {
            msg: "请求方法不存在",
            code: 1001,
        };
        res.end(JSON.stringify(r));
        return;
    }
    res.end(JSON.stringify(myObj));
}

var server = http.createServer(onRequest);


server.listen(3000, '127.0.0.1');
console.log('server started on localhost port 3000');
