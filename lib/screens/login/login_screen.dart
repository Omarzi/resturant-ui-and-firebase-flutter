import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:food_app_with_fb/screens/chat/chat.dart';
import 'package:food_app_with_fb/screens/home/home_home.dart';
import 'package:food_app_with_fb/screens/home/home_screen.dart';
import 'package:food_app_with_fb/screens/login/google_signin_provider.dart';
import 'package:food_app_with_fb/screens/widgets/custom_buttons/button.dart';
import 'package:food_app_with_fb/screens/widgets/custom_text_fields/my_text_field_normal.dart';
import 'package:food_app_with_fb/screens/widgets/custom_text_fields/my_text_field_password.dart';
import 'package:food_app_with_fb/screens/widgets/forget_password/reaet_password.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../sign_up/sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  late String emailonChange;

  late String userNameonChange;

  late String passwordonChange;

  bool showSpinner = false;

  var formy1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: ListView(
          children: [
            Container(
              // height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/background.png'),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 80,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Sign in to continue',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        Text(
                          'Vegi',
                          style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              shadows: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Color(0xFFFF961F).withOpacity(0.7),
                                  // color: Colors.green.shade900,
                                  offset: const Offset(3, 3),
                                ),
                              ]),
                        ),
                        Form(
                          key: formy1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 55),
                            child: Column(
                              children: [
                                MyTextField(
                                  controller: userName,
                                  hintText: 'User Name',
                                  iconData: Icons.person_outline,
                                  obscureText: false,
                                  function: (value) {
                                    userName.text = value;
                                  },
                                  validator: 'User Name must not be empty',
                                  textInputType: TextInputType.text,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                MyTextField(
                                  controller: email,
                                  hintText: 'email',
                                  iconData: Icons.email_outlined,
                                  obscureText: false,
                                  function: (value) {
                                    email.text = value;
                                  },
                                  validator: 'Email Address must not be empty',
                                  textInputType: TextInputType.emailAddress,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                MyTextFieldPass(
                                  controller: password,
                                  iconData: Icons.lock,
                                  text: 'password',
                                  function: (value) {
                                    password.text = value;
                                  },
                                  validator: 'Password must not be empty',
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      child: const Text(
                                        'forget password',
                                        style: TextStyle(
                                          color: Color(0xFFFF961F),
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ResetPassword(),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        CustmButton(
                            text: 'Log In',
                            function: () async {
                              if (formy1.currentState!.validate()) {
                                // setState(() {
                                //   showSpinner = true;
                                // });
                                try {
                                  final user =
                                      await _auth.signInWithEmailAndPassword(
                                          email: email.text,
                                          password: password.text);
                                  if (user != null) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen(),
                                      ),
                                    );
                                  }
                                } catch (e) {
                                  print(
                                      '**************************************');
                                }
                              } else {
                                setState(() {
                                  showSpinner = false;
                                });
                              }
                            }),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SignInButton(
                                  Buttons.Google,
                                  text: "Sign in with Google",
                                  onPressed: () {
                                    final provider =
                                        Provider.of<GoogleSignInProvider>(
                                            context,
                                            listen: false);
                                    provider.googleLogin();
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SignInButton(
                                  Buttons.Apple,
                                  text: "Sign in with Apple",
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Column(
                        //   children: const [
                        //     Text(
                        //       'By signing in you are agreeing to our',
                        //       style: TextStyle(
                        //         color: Colors.black,
                        //       ),
                        //     ),
                        //     Text(
                        //       'Terms and Privacy Policy',
                        //       style: TextStyle(
                        //         color: Colors.black,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              },
                              child: Text(
                                'Register Now',
                                style: TextStyle(
                                    color: const Color(0xFFFF961F)
                                        .withOpacity(0.7),
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void createSnackBar(String message) {
  //   final snackBar =
  //       SnackBar(content: Text(message), backgroundColor: Colors.red, );

  //   // Find the Scaffold in the Widget tree and use it to show a SnackBar!
  //   Scaffold.of(context).showSnackBar(snackBar);
  // }
}
