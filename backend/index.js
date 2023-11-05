const app = require('./app');
const db = require('./configuration/db');
const port  = 3000;
const UserModel = require('./models/student_model');

app.get('/', (req, res) =>{
    res.send("Hello world!");
});

app.listen(port, ()=>{
    console.log(`Server listening on port http://localhost:${port}`);
})