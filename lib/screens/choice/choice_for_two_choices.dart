import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app_with_fb/screens/login/login_screen.dart';
import 'package:food_app_with_fb/screens/sign_up/sign_up.dart';

class Choice extends StatelessWidget {
  const Choice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                height: MediaQuery.of(context).size.height - 40,
                padding: const EdgeInsets.symmetric(vertical: 120),
                width: double.infinity,
                child: Column(
                  children: [
                    SvgPicture.asset('assets/icons/macdonalds.svg', color: Colors.grey[600],),
                    const SizedBox(
                height: 30,
              ),
                    Text(
                      'Welcome',
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                              blurRadius: 5,
                              color: const Color(0xFFFF961F).withOpacity(0.7),
                              // color: Colors.green.shade900,
                              offset: const Offset(3, 3),
                            ),
                          ]),
                    ),
                    Text(
                      'Choose from these buttons',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    mtFirstButton(
                      color: Color(0xFFFF961F).withOpacity(0.7),
                      text: 'Log In',
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn(),),);
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    mtFirstButton(
                                            color: Colors.grey[600]!,

                      // color: Color(0xFFFF961F).withOpacity(0.7),
                      text: 'Sign Up',
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),),);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class mtFirstButton extends StatelessWidget {
  const mtFirstButton({
    Key? key, required this.color, required this.text, required this.onPressed,
  }) : super(key: key);

  final Color color;
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 5,
        color: color,
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200,
          height: 42,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white
            ),
          )
          ),
        ),
    );
  }
}
