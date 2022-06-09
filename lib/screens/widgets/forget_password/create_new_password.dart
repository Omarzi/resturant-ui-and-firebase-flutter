import 'package:flutter/material.dart';
import 'package:food_app_with_fb/screens/login/login_screen.dart';
import 'package:food_app_with_fb/screens/widgets/custom_buttons/button.dart';
import 'package:food_app_with_fb/screens/widgets/custom_text_fields/my_text_field_password.dart';

class CreateNewPassword extends StatelessWidget {
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  late String emailonChange;

  // late String userNameonChange;

  late String passwordonChange;

  late String confirmpasswordonChange;

  // late String phonNumberonChanged;

  CreateNewPassword({Key? key}) : super(key: key);

  var form123 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Form(
        key: form123,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.west)),
                const Text(
                  'Back',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        'Create new password',
                        style: TextStyle(
                            fontSize: 34,
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
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: 200,
              padding: const EdgeInsets.fromLTRB(15, 10, 50, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        'Your new password must be different from previous',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2.5,
                  ),
                  const Text(
                    ' used passwords.',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Text(
                      'Password',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextFieldPass(
                    controller: password,
                    iconData: Icons.lock,
                    text: 'password',
                    function: (value) {
                      function:
                      (value) {
                        passwordonChange = value;
                      };
                    },
                    validator: 'Password must not be empty',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Text(
                      'Must be at least 8 characters.',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Text(
                      'Confirm Password',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextFieldPass(
                    controller: confirmpassword,
                    iconData: Icons.lock,
                    text: 'confirm password',
                    function: (value) {
                      confirmpasswordonChange = value;
                    },
                    validator: 'Password must not be empty',
                    // sIcon: Icons.remove_red_eye,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Text(
                      'Both passwords must match.',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Center(
                    child: CustmButton(
                        function: () {
                          if (form123.currentState!.validate())  {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignIn(),
                              ),
                              (route) => false);
                          } else {
                        print("yyyyyyyyyyy");
                      }
                          
                        },
                        text: 'Reset password'),
                  )
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 0),
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.push(context,
                  //           MaterialPageRoute(builder: (context) => SignIn()));
                  //     },
                  //     child: Container(
                  //       width: 300,
                  //       height: 50,
                  //       color: Colors.orange[500],
                  //       padding: const EdgeInsets.all(10),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: const [
                  //           Text(
                  //             'Reset Password',
                  //             style: TextStyle(
                  //               color: Colors.white,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     style: ButtonStyle(
                  //       shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(15.0),
                  //       )),
                  //       backgroundColor: MaterialStateProperty.all(
                  //         Colors.orange[500],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
