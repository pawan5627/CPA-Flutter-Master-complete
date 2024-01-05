const jwt = require("jsonwebtoken");
require("dotenv").config();
module.exports = {
  checkToken: (req, res, next) => {
    let token = req.get("authorization");
    if (token) {
      // Remove Bearer from string
      token = token.slice(7);
      console.log(process.env.JWT_KEY);
      jwt.verify(token,process.env.JWT_KEY, (err, decoded) => {
        if (err) {
          return res.json({
            success: 0,
            message: "Token Expired"
          });
        } else {
          console.log("decoded" , decoded);
          req.decoded = decoded;
          next();
        }
      });
    } else {
      return res.json({
        success: 0,
        message: "Access Denied! Unauthorized User"
      });
    }
  }
};
