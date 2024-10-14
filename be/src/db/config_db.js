const mysql = require('mysql2');

require('dotenv').config({ path: '.env' });

var db_connection;

exports.connect_to_db = async () => {
    try {

        // Create a MySQL connection
        const connection = mysql.createConnection(
            {
                host: process.env.DB_HOST || 'localhost',
                user: process.env.DB_USER || 'root',
                password: process.env.DB_PASS || 'root',
                database: process.env.DB_NAME || 'dev'
            });

        // Connect to the MySQL database
        connection.connect((err) => {
            if (err) {
                console.error('Error connecting to the database');
                return;
            }

            console.log('Connected to the database');
            db_connection = connection;

        });

    } catch (error) {
        console.log(error);
    }
}

const get_connection = () => {
    if (db_connection == null) this.connect_to_db();
    return db_connection
}

exports.execute_query = (sql, values = []) => {
    try {
        
        const connection = get_connection()
        
        if (connection == null) {
            console.error('No valid connection to db');
            return null;
        }

        return new Promise((resolve, reject)=>{
            connection.query(sql, values, async (err, results) => {
                if(err) return reject(null);
                return resolve(results);
            });
        });        
    }
    catch (error) {
        console.log(error)
        return null
    }
}

