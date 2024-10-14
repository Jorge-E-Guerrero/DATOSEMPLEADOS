const db = require('../db/config_db')


exports.get_collaborators = async (req, res) => {
    try {
        //Se obtienen los parametros del body
        const { deviceName, date } = req.body


        const sql = "SELECT * from COLABORADOR_VIEW";
        const values = [];

        results = await db.execute_query(sql, values)
        console.log(results)

        data = {"results": results}
        res.send(data)

    } catch (error) {
        console.log(error);
        res.send({"status":"error", "description":error})
    }
}