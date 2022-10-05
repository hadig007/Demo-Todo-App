const mongoose = require("mongoose");
const schema = mongoose.Schema;

const todolist_schema = new schema({
   name:{
    type:String,
    required:true
   },
   status:{
    type: Boolean,
    require: true
   },
   createdAt: {
    type: String,
    require: true
   },
   updatedAt: {
    type: String,
    require: true
   }
},);


const todolist = mongoose.model('todolist', todolist_schema);
module.exports = todolist;