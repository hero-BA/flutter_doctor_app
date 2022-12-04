const express = require("express");
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");
const User = require("../models/user");

const authRouter = express.Router();

// Sign Up Route
authRouter.post("/api/signup", async (req, res) => {
  try {
    // Get data from client side
    const { name, email, password } = req.body;

    const existingUser = await User.findOne({ email });

    if (existingUser)
      return res
        .status(400)
        .json({ msg: "User with same email already exists!" });

    // Secure password
    const hashedPassword = await bcryptjs.hash(password, 8);

    let user = new User({
      name,
      email,
      password: hashedPassword,
    });
    // Save data in DB
    user = await user.save();
    // Send data to client side
    res.json(user);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Sign In Route
authRouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;

    const user = await User.findOne({ email });
    // Check if user with same email already exist
    if (!user) {
      return res
        .status(400)
        .json({ msg: "User with this email does not exist!" });
    }

    const isPasswordMatch = await bcryptjs.compare(password, user.password);

    if (!isPasswordMatch) {
      res.status(400).json({ msg: "Incorrect password" });
    }

    const token = jwt.sign({ id: user._id }, "passwordKey");
    res.json({ token, ...user._doc });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = authRouter;
