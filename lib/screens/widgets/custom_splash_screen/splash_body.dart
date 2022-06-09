import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app_with_fb/screens/choice/choice_for_two_choices.dart';
import 'package:food_app_with_fb/screens/login/login_screen.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({ Key? key }) : super(key: key);

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> with SingleTickerProviderStateMixin {

// values = 0 : 1
  AnimationController? animationController;
  // values = Variable values
  Animation<double>? fadingAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        microseconds: 600,
      ),
    );

    goToNextPage();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/macdonalds.svg',
            height: 200,
            width: 200,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'A whole Food Resturants\n at your fingertips',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ); 
  }
  void goToNextPage() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Choice(),
        ),
      );
    });
  }
}