const express = require('express');
const cors = require('cors');

const db = require('./src/db/config_db')

require('dotenv').config({ path: '.env' });

const app = express();
const PORT = process.env.APP_PORT || 3000;

app.use(cors());
app.use(express.json());

//Init the connection to the DB
db.connect_to_db();

//Se apunta hacia el directorio de rutas
app.use('/api', require('./index'));

app.listen(PORT, (error) => {
    if (!error) console.log("Server is Successfully Running, and App is listening on port " + PORT)
    else console.log("Error occurred, server can't start", error);
});