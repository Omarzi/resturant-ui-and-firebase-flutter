import 'package:flutter/material.dart';
import 'package:food_app_with_fb/screens/widgets/custom_buttons/button.dart';
import 'package:food_app_with_fb/screens/widgets/custom_text_fields/my_text_field_normal.dart';
import 'package:food_app_with_fb/screens/widgets/forget_password/create_new_password.dart';

class ResetPassword extends StatefulWidget {

  ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController email = TextEditingController();

  late String emailonChange;
  var form1234 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Form(
        key: form1234,
        child: ListView(
          physics: BouncingScrollPhysics(),
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
                const SizedBox(
                  width: 210,
                ),
                const Expanded(
                  child: Icon(
                    Icons.info_outline,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    'Reset password',
                    style: TextStyle(fontSize: 40, color: Colors.white, shadows: [
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
            Container(
              width: 200,
              padding: const EdgeInsets.fromLTRB(15, 10, 50, 20),
              child: Row(
                children: const [
                  Text(
                    "Enter the email associated with your account.",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                    softWrap: true,
                    maxLines: 50,
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: const Text(
                'Email address',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: MyTextField(
                controller: email,
                hintText: 'email',
                iconData: Icons.email_outlined,
                obscureText: false,
                function: (value) {
                  emailonChange = value;
                }, validator: 'Email Address must not be empty', textInputType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            //   child: Container(
            //     padding: const EdgeInsets.fromLTRB(10, 0, 1, 0),
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(15),
            //     ),
            //     child: const TextField(
            //       keyboardType: TextInputType.emailAddress,
            //       decoration: InputDecoration(
            //         labelText: 'Email Address',
            //         labelStyle: TextStyle(
            //           color: Colors.black,
            //         ),
            //         prefixIcon: Icon(
            //           Icons.email,
            //           color: Colors.black,
            //         ),
            //         border: InputBorder.none,
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 75),
              // width: 200,
              // height: 50,
              child: CustmButton(
                text: 'Send Instructions',
                function: () {
                  if (form1234.currentState!.validate()) {
                        print("xxxxxxxxxxxx");
                         Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateNewPassword(),
                    ),
                  );
                      } else {
                        print("yyyyyyyyyyy");
                      }
                },
              ),
            )
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15),
            //   child: ElevatedButton(
      
            //     child: Container(
            //       width: 300,
            //       height: 50,
            //       color: Colors.orange[500],
            //       padding: const EdgeInsets.all(10),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: const [
            //           Text(
            //             'Send Instructions',
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
    );
  }
}
