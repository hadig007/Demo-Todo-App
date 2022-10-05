const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");

// list routes
const todolist = require('./domain/todolist_routes')
// end list routes

// initial setting
const app = express();
const URL = 3030;
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
// end initial setting

// start db connection
mongoose.connect("mongodb://localhost:27017/todolist", {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

const db = mongoose.connection;
db.on("error", (err) => {
  console.log({ err });
});
db.on("open", () => {
  console.log("database connection established");
});
// end db connection

// start server
app.listen(URL, (err, success) => {
  if (err) {
    console.log(err);
  } else {
    console.log(`server start on : http://localhost:${URL}`);
  }
});
// end start server

// add routes
app.use('/api/todolist', todolist)
// end add routes