// // import 'package:cpa_application/UI/screens/login.dart';
// // import 'package:firebase_auth/firebase_auth.dart';

// // import 'package:flutter/material.dart';

// // class ResetPassword extends StatefulWidget {
// //   const ResetPassword({Key? key}) : super(key: key);

// //   @override
// //   _ResetPasswordState createState() => _ResetPasswordState();
// // }

// // class _ResetPasswordState extends State<ResetPassword> {
// //   TextEditingController _emailTextController = TextEditingController();
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       extendBodyBehindAppBar: true,
// //       appBar: AppBar(
// //         backgroundColor: Colors.transparent,
// //         elevation: 0,
// //         title: const Text(
// //           "Reset Password",
// //           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// //         ),
// //       ),
// //       body: Container(
// //           width: MediaQuery.of(context).size.width,
// //           height: MediaQuery.of(context).size.height,
// //           child: SingleChildScrollView(
// //               child: Padding(
// //             padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
// //             child: Column(
// //               children: <Widget>[
// //                 const SizedBox(
// //                   height: 20,
// //                 ),
// //                 reusableTextField("Enter Email Id", Icons.person_outline, false,
// //                     _emailTextController),
// //                 const SizedBox(
// //                   height: 20,
// //                 ),
// //                 firebaseUIButton(context, "Reset Password", () {
// //                   FirebaseAuth.instance
// //                       .sendPasswordResetEmail(email: _emailTextController.text)
// //                       .then((value) => Navigator.of(context).pop());
// //                 })
// //               ],
// //             ),
// //           ))),
// //     );
// //   }
// // }
// import 'package:cpa_application/UI/screens/homescreen/homescreen.dart';
// import 'package:cpa_application/UI/screens/signup.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:flutter/material.dart';

// import 'login.dart';

// class SignInScreen extends StatefulWidget {
//   const SignInScreen({Key? key}) : super(key: key);

//   @override
//   _SignInScreenState createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   TextEditingController _passwordTextController = TextEditingController();
//   TextEditingController _emailTextController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.fromLTRB(
//                 20, MediaQuery.of(context).size.height * 0.2, 20, 0),
//             child: Column(
//               children: <Widget>[
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 reusableTextField("Enter UserName", Icons.person_outline, false,
//                     _emailTextController),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 reusableTextField("Enter Password", Icons.lock_outline, true,
//                     _passwordTextController),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 forgetPassword(context),
//                 firebaseUIButton(context, "Sign In", () {
//                   FirebaseAuth.instance
//                       .signInWithEmailAndPassword(
//                           email: _emailTextController.text,
//                           password: _passwordTextController.text)
//                       .then((value) {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => HomeScreen()));
//                   }).onError((error, stackTrace) {
//                     print("Error ${error.toString()}");
//                   });
//                 }),
//                 signUpOption()
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Row signUpOption() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const Text("Don't have account?",
//             style: TextStyle(color: Colors.white70)),
//         GestureDetector(
//           onTap: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => SignUpScreen()));
//           },
//           child: const Text(
//             " Sign Up",
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//         )
//       ],
//     );
//   }

//   Widget forgetPassword(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: 35,
//       alignment: Alignment.bottomRight,
//       child: TextButton(
//         child: const Text(
//           "Forgot Password?",
//           style: TextStyle(color: Colors.white70),
//           textAlign: TextAlign.right,
//         ),
//         onPressed: () {},
//         // onPressed: () => Navigator.push(
//         //     context, MaterialPageRoute(builder: (context) => ResetPassword())),
//       ),
//     );
//   }
// }
