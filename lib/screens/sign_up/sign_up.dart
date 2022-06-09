import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:food_app_with_fb/logic/auth.dart';
import 'package:food_app_with_fb/screens/home/home_home.dart';
import 'package:food_app_with_fb/screens/widgets/custom_buttons/button.dart';
import 'package:food_app_with_fb/screens/widgets/custom_text_fields/my_text_field_password.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../home/home_screen.dart';
import '../widgets/custom_text_fields/my_text_field_normal.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;

  TextEditingController email = TextEditingController();

  TextEditingController userName = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController number = TextEditingController();

  bool showSpinner = false;

  var formSignup = GlobalKey<FormState>();

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
                          'Sign up to continue',
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
                          key: formSignup,
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
                                  validator: 'User Name must not be empty', textInputType: TextInputType.text,
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
                                  validator: 'Email Address must not be empty', textInputType: TextInputType.emailAddress,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                MyTextFieldPass(
                                  controller: password,
                                  iconData: Icons.lock,
                                  text: 'password',
                                  function: (value) {
                                    function:
                                    (value) {
                                      password.text = value;
                                    };
                                  },
                                  validator: 'Password must not be empty',
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                MyTextField(
                                  controller: number,
                                  iconData: Icons.phone,
                                  function: (value) {
                                    number.text = value;
                                  },
                                  validator: 'Phone number must not be empty',
                                  obscureText: false,
                                  hintText: 'phone number', textInputType: TextInputType.phone,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        CustmButton(
                          text: 'Sign Up',
                          // sync : للاحداث المتزامنه
                          function: () async {
                            if(formSignup.currentState!.validate()) {
                              try {
                              await _auth.createUserWithEmailAndPassword(
                                  email: email.text, password: password.text);
                        
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                              print('${email.text}');
                            } catch (e) {
                              print(e);
                              print('${email.text}');
                            }
                            }
                          },
                        ),
                        Column(
                          children: const  [
                            SizedBox(
                              height: 75,
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
}
