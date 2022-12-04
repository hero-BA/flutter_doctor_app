const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");

const PORT = 3000;
const DB =
  "mongodb+srv://hero:hero123@cluster0.jgvmnqs.mongodb.net/?retryWrites=true&w=majority";
const app = express();

// Middlewares
app.use(express.json());
app.use(authRouter);

mongoose
  .connect(DB)
  .then(() => console.log("Connection successful"))
  .catch((e) => console.log(e));

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Connected at port: ${PORT}`);
});
