const db = require('../db/config_db')


exports.get_collaborators = async (req, res) => {
    try {
        const sql = "SELECT * from COLABORADOR_VIEW";
        const values = [];

        results = await db.execute_query(sql, values)

        data = {"results": results}
        res.send(data)

    } catch (error) {
        console.log(error);
        res.send({"status":"error", "description":error})
    }
}