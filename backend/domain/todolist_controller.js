
// setup moment.js
const moment = require('moment')
const todolist = require("./todolist_model");
// end initial setup

// show todolist
const index = (req, res, next) => {
  todolist
    .find()
    .then((response) => {
      res.json(response);
    })
    .catch((err) => {
      res.json({
        status: "an error occured!",
        message: err,
      });
    });
};

// store todolist
const store = (req, res, next) => {
  let todo = new todolist({
    name: req.body.name,
    status: false,
    createdAt: moment().format("LLLL"),
    updatedAt: moment().format("LLLL"),
  });

  todo
    .save()
    .then((rst) => {
      res.status(200).json({
        status: "Success",
        messages: "Success saved todolist",
        data: rst,
      });
    })
    .catch((err) => {
      res.json({
        status: "Error",
        message: "an error occured!",
        message: err,
      });
    });
};

// update todolist
const update = (req, res, next) => {
  let todo = {
    status: true,
    updatedAt: moment().format("LLLL"),
  };


  todolist
    .findByIdAndUpdate(req.body.id, todo)
    .then((rst) => {
      res.status(200).json({
        status: "Success",
        messages: "Success updated todolist",
        data: rst,
      });
    })
    .catch((err) => {
      res.json({
        status: "an error occured!",
        message: err,
      });
    });
};


// delete a book
const destroy = (req, res, next) => {


  todolist
    .findByIdAndRemove(req.body.id)
    .then((rst) => {
      res.status(200).json({
        status: "Success",
        messages: "Success deleted todolist",
        data: rst,
      });
    })
    .catch((err) => {
      res.json({
        status: "an error occured!",
        message: err,
      });
    });
};

module.exports = {
  index,
  store,
  update,
  destroy,
};
