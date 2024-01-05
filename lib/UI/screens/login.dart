import 'package:cpa/export.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
 
import '../../data/dummy.dart';
import '../../services/auth_services.dart';
import '../../services/shared_services.dart';
import '../../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  final String? uid;
  const LoginScreen({super.key, this.uid});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // TextEditingController email = TextEditingController();
  // TextEditingController password = TextEditingController();
  // bool isLoading = false;
  // String loginNotification = '';

  // void showNotification(String message) {
  //   setState(() {
  //     loginNotification = message;
  //   });
  // }

  bool isLoading = false;
  bool isPasswordVisible = false; // Track password visibility
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final SharedPrefencesServices shared = SharedPrefencesServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          // Positioned(
          //   bottom: 0,
          //   child: Image.asset(
          //     'assets/Framebg.png',
          //     width: MediaQuery.of(context).size.width, // Make it full-width
          //     height: MediaQuery.of(context).size.height *
          //         0.45, // Adjust the height as needed
          //     fit: BoxFit.cover,
          //   ),
          // ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ModalProgressHUD(
                inAsyncCall: isLoading,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(CPAAssets.CpaLogo),
                    SizedBoxes.verticalExtraGargangua,
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Login to your \nAccount',
                        textAlign: TextAlign.left,
                        style: CPATextTheme().heading1.copyWith(
                            color: CPAColorTheme().primarygolden,
                            fontSize: 49,
                            fontWeight: FontWeight.w600,
                            height: 0),
                      ),
                    ),
                    SizedBoxes.verticalExtraGargangua,
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: CPAColorTheme().primaryblue,
                        ), // Email icon
                        labelText: 'Email', // Label text
                        hintText: 'john.doe@gmail.com', // Hint text
                        filled: true, // Enable filling
                        fillColor: Colors.grey[200], // Grey background color
                        labelStyle: TextStyle(
                          color: CPAColorTheme()
                              .primaryblue, // Set the label text color
                        ),
                        border: OutlineInputBorder(
                          // Rectangle border
                          borderSide: BorderSide.none, // Remove the border
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    SizedBoxes.verticalMedium,
                    TextField(
                      controller: passwordController,
                      obscureText: !isPasswordVisible,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: CPAColorTheme().primaryblue,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: CPAColorTheme().primaryblue,
                        ), // Email icon
                        labelText: 'Password', // Label text
                        hintText: 'Password', // Hint text
                        filled: true, // Enable filling
                        fillColor: Colors.grey[200], // Grey background color
                        labelStyle: TextStyle(
                          color: CPAColorTheme()
                              .primaryblue, // Set the label text color
                        ),
                        border: OutlineInputBorder(
                          // Rectangle border
                          borderSide: BorderSide.none, // Remove the border
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    SizedBoxes.verticalMicro,
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: CPATextTheme()
                              .body
                              .copyWith(color: CPAColorTheme().primaryblue),
                        ),
                      ),
                    ),
                    SizedBoxes.verticalLarge,
                    CustomButton(
                        buttonText: 'Sign in',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileSetup(uid: ""),
                            ),
                          );
                        }),
                    // ElevatedButton(
                    //   onPressed: isLoading
                    //       ? null
                    //       : () async {
                    //           setState(() {
                    //             isLoading = true;
                    //           });
                    //           final enteredEmail = emailController.text;
                    //           final enteredPassword = passwordController.text;
                    //           final loginResult = await APIService.userLogin(
                    //               enteredEmail, enteredPassword, (result) {});
                    //           setState(() {
                    //             isLoading = false;
                    //           });
                    //           if (loginResult == 'success') {
                    //             // Navigate to the next screen or perform other actions on successful login
                    //           }
                    //         },
                    //   child: isLoading
                    //       ? CircularProgressIndicator()
                    //       : Text('Sign in'),
                    // ),
                    SizedBoxes.verticalLarge,
                    OrDivider(),
                    SizedBoxes.verticalMedium,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors
                                  .grey, // Change the outline color as needed
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Image.asset(
                            CPAAssets
                                .FacebookLogo, // Replace with the path to your Google logo image
                          ),
                        ),
                        // FacebookLogin(),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors
                                  .grey, // Change the outline color as needed
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          width: 50,
                          height: 50,
                          child: InkWell(
                            onTap: () async {
                              setState(() {
                                isLoading = true;
                              });
                              await AuthServices.signInWithGoogle()
                                  .then((value) {
                                Utils.showSnackbar(context, "Success Login");
                                uid = value.user!.uid;
                                shared.loginPrefences(
                                    uid: value.user!.uid, isLogin: true);
                                setState(() {
                                  isLoading = false;
                                });

                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          HomeScreen(uid: uid),
                                    ),
                                    (route) => false);
                                print(value.user!.uid);
                              }).onError((error, stackTrace) {
                                setState(() {
                                  isLoading = false;
                                });
                                Utils.showSnackbar(context, "Error Occured");
                                print("Error!");
                                print(error);
                              });
                            },
                            child: Image.asset(
                              CPAAssets
                                  .GoogleLogo, // Replace with the path to your Google logo image
                              height: 60.0,
                              width: 40.0,
                            ),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors
                                  .grey, // Change the outline color as needed
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Image.asset(
                            CPAAssets
                                .AppleLogo, // Replace with the path to your Google logo image
                            height: 60.0,
                            width: 40.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBoxes.verticalExtraGargangua,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Dont have an account? ',
                          style: CPATextTheme()
                              .small
                              .copyWith(color: CPAColorTheme().neutral400),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileSetup(
                                  uid: "",
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Sign up',
                            style: CPATextTheme().subtext.copyWith(
                                color: CPAColorTheme().primaryblue,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                height: 0),
                          ),
                        )
                      ],
                    ),
                    // if (loginNotification.isNotEmpty)
                    //   Padding(
                    //     padding: const EdgeInsets.all(16.0),
                    //     child: Text(
                    //       loginNotification,
                    //       style: TextStyle(
                    //         color: Colors.red, // You can choose a different color
                    //       ),
                    //     ),
                    //   ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
