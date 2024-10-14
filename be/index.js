const express = require('express')
const router = express.Router()

//Create the routers for all services
router.use('/collaborators', require('./src/routes/collaborators'))

module.exports = router;