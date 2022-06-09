import 'package:flutter/material.dart';

class CustmButton extends StatelessWidget {
  Function()? function;
  
  final String text;
  CustmButton({Key? key, required this.function, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: RaisedButton(
        color: Color(0xFFFF961F).withOpacity(0.7),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: function,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}