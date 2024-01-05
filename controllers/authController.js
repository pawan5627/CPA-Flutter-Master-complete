const httpStatus = require('http-status');
const catchAsync = require('../utils/catchAsync');
const { authService, userService, tokenService, emailService } = require('../services');
const config = require('../db/config');

const register = catchAsync(async (req, res) => {
  
  const user = await userService.createUser(req.body);
  const verifyEmailToken = await tokenService.generateVerifyEmailToken(user);
  await emailService.sendVerificationEmail(user, verifyEmailToken);
  res.status(httpStatus.CREATED).send({ user, verifyEmailToken, message: 'Register successfully' });
});

const login = catchAsync(async (req, res) => {
  const { email, password, username } = req.body;
  if (email) {
    const user = await authService.loginUserWithEmailAndPassword(email, password);
    const tokens = await tokenService.generateAuthTokens(user);
    res.send({ user, tokens, message: 'Login successfully', isSuccess: true });
  } else {
    const user = await authService.loginMemberWithUsernameAndPassword(username, password);
    const tokens = await tokenService.generateAuthTokensForMember(user);
    res.send({ user, tokens, message: 'Login successfully', isSuccess: true });
  }
});
module.exports = {
  register,
  login,
};
