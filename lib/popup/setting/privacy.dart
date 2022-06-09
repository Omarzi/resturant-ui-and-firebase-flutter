/**/
import 'package:flutter/material.dart';
import 'package:food_app_with_fb/constant.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.clear,
          color: ksecondaryColor,
          size: 25,
        ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Privacy Policy',
          style: TextStyle(fontSize: 18, color: kTextColor),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color: Colors.grey[200],
              ),
              Container(
                height: 548,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: ListView(
                  children: const  [
                    Text(
                      "If you’re not a lawyer, creating a privacy policy to protect your company and customers can be a serious headache. Our free privacy policy generator, which has been updated to include the requirements of the General Data Protection Regulation (GDPR), can help make sure your business complies with the law and encourages customer trust. Fill in the fields below and we'll email you a personalized website privacy policy for your business, which will include suggestions and sections for you to customize depending on how you have configured your storefront. If you’re not a lawyer, creating a privacy policy to protect your company and customers can be a serious headache. Our free privacy policy generator, which has been updated to include the requirements of the General Data Protection Regulation (GDPR), can help make sure your business complies with the law and encourages customer trust. Fill in the fields below and we'll email you a personalized website privacy policy for your business, which will include suggestions and sections for you to customize depending on how you have configured your storefront. If you’re not a lawyer, creating a privacy policy to protect your company and customers can be a serious headache. Our free privacy policy generator, which has been updated to include the requirements of the General Data Protection Regulation (GDPR), can help make sure your business complies with the law and encourages customer trust. Fill in the fields below and we'll email you a personalized website privacy policy for your business, which will include suggestions and sections for you to customize depending on how you have configured your storefront. If you’re not a lawyer, creating a privacy policy to protect your company and customers can be a serious headache. Our free privacy policy generator, which has been updated to include the requirements of the General Data Protection Regulation (GDPR), can help make sure your business complies with the law and encourages customer trust. Fill in the fields below and we'll email you a personalized website privacy policy for your business, which will include suggestions and sections for you to customize depending on how you have configured your storefront. If you’re not a lawyer, creating a privacy policy to protect your company and customers can be a serious headache. Our free privacy policy generator, which has been updated to include the requirements of the General Data Protection Regulation (GDPR), can help make sure your business complies with the law and encourages customer trust. Fill in the fields below and we'll email you a personalized website privacy policy for your business, which will include suggestions and sections for you to customize depending on how you have configured your storefront."
                    ),
                  ]
                )
              )
        ])
      ])
    );
  }
}
