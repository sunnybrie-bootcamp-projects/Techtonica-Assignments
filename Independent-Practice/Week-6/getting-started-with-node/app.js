const http = require('http');
const fs = require('fs');

const hostname = '127.0.0.1';
const port = 3000;

fs.readFile('index.html', (err, html) => {
    if (err) {
        throw err;
    };
    const server = http.createServer((req, res) => {
        res.statusCode = 200;
        res.setHeader = ("Content-type", "text/plain");
        res.end(html);
    });

    server.listen(port, hostname, () => {
        console.log("Server running on port " + port + "...");
    });

});

