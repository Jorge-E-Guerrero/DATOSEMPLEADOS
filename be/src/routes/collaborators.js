const express = require('express')
const router = express.Router()
const controller =  require('../controllers/collaborators_controller')

router.get('/', controller.get_collaborators)
//router.post('/', controller.create_or_uptdate_collaborators)
//router.put('/', controller.update_collaborators)
//router.delete('/', controller.delete_collaborators)

module.exports = router;