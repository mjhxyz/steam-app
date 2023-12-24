var http = require('http');

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
    '/': (req, res) => {
        res.statusCode = 200;
        res.end(JSON.stringify({ text: 'hello world' }));
    }

    /*************************** 管理 */
}

var onRequest = async function (req, res) {
    res.writeHead(200, { 'Content-Type': 'application/json' });

    const urls = req.url.split('?');
    const requestAddress = urls[0];

    //定义json对象
    var myObj = {
        name: "yyh",
        job: "android",
        age: 18
    };
    if (dispatcher[requestAddress] instanceof Function) {
        try {
            const result = await dispatcher[requestAddress](req, res)
            return res.end(JSON.stringify(result));
        } catch (e) {
            console.error(e);
        }
    }
    res.end(JSON.stringify(myObj));
}

var server = http.createServer(onRequest);

server.listen(3000, '127.0.0.1');
console.log('server started on localhost port 3000');
