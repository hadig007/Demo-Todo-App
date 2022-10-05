
// initial setup
const express = require('express');
const router = express.Router();
const todolist = require('./todolist_controller');
// end intial setup

// end intial setup

// all store routes
router.get('/',todolist.index);
router.post('/store',todolist.store);
router.put('/update', todolist.update);
router.post('/destroy', todolist.destroy);
// end all store routes


module.exports = router;