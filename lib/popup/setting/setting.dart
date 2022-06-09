import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app_with_fb/constant.dart';
import 'package:food_app_with_fb/popup/setting/privacy.dart';
import 'package:food_app_with_fb/screens/login/login_screen.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool valNotify1 = true;
  bool valNotify2 = false;
  bool valNotify3 = false;

  onChangeFunction1(bool newValue1) {
    setState(() {
      valNotify1 = newValue1;
    });
  }

  onChangeFunction2(bool newValue2) {
    setState(() {
      valNotify2 = newValue2;
    });
  }

  onChangeFunction3(bool newValue3) {
    setState(() {
      valNotify3 = newValue3;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back,
          color: ksecondaryColor,
          size: 25,
        ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Settings Page',
          style: TextStyle(fontSize: 18, color: kTextColor),
        ),
      ),
//       body: Container(
//         padding: const EdgeInsets.all(10),
//         child: ListView(
//           children: [
//             const SizedBox(
//               height: 40,
//             ),
//             Row(
//               children: const [
//                 Icon(Icons.person, color: Colors.blue),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   'Account',
//                   style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             const Divider(
//               height: 20,
//               thickness: 1,
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             buildAccountOption(context, 'Change Password'),
//             const SizedBox(
//               height: 15,
//             ),
//             buildAccountOption(context, 'Social'),
//             const SizedBox(
//               height: 15,
//             ),
//             buildAccountOption(context, 'Language'),
//             const SizedBox(
//               height: 15,
//             ),
//             buildAccountOption(context, 'Privacy and Security'),
//             const SizedBox(
//               height: 40,
//             ),
//             Row(
//               children: const [
//                 Icon(
//                   Icons.volume_up_outlined,
//                   color: Colors.blue,
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   'Notifications',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
//                 )
//               ],
//             ),
//             const Divider(
//               height: 20,
//               thickness: 1,
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             buildNotificationOption(
//                 'Theme Dark', valNotify1, onChangeFunction1),
//             buildNotificationOption(
//                 'Account Active', valNotify2, onChangeFunction2),
//             buildNotificationOption(
//                 'Opportunity', valNotify3, onChangeFunction3),
//             const SizedBox(
//               height: 50,
//             ),
//             Center(
//               child: OutlinedButton(
//                 style: OutlinedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(horizontal: 40),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20))),
//                 onPressed: () {},
//                 child: const Text(
//                   'SIGN OUT',
//                   style: TextStyle(
//                       fontSize: 16, letterSpacing: 2.2, color: Colors.black),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildNotificationOption(
//       String title, bool value, Function onChangeMethod) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.grey[600]),
//           ),
//           Transform.scale(
//             scale: 0.7,
//             child: CupertinoSwitch(
//               activeColor: Colors.blue,
//               trackColor: Colors.grey,
//               value: value,
//               onChanged: (bool newValue) {
//                 onChangeMethod(newValue);
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget buildAccountOption(BuildContext context, String title) {
//     return GestureDetector(
//       onTap: () {
//         showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: Text(title),
//                 content: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [Text('Option 1'), Text('Option 2')],
//                 ),
//                 actions: [
//                   TextButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: Text('Close'))
//                 ],
//               );
//             });
//       },
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.grey[600]),
//           ),
//           const Icon(
//             Icons.arrow_forward_ios,
//             color: Colors.grey,
//           )
//         ],
//       ),
//     );
//   }
// }
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 240,
                          height: 80,
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Welcome Guest',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: kTextColor),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(width: 130, child: const Text('if You can change the photo pressed here')),
                                ],
                              ),
                              CircleAvatar(
                                radius: 17,
                                backgroundColor: Colors.grey[300],
                                child: const CircleAvatar(
                                  radius: 15,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    listtile(
                        icon: Icons.location_on,
                        title: 'My Delivery Address',
                        onpressed: () {}),
                    listtile(
                        icon: Icons.person_outline, title: 'Refer a Friends',
                        onpressed: () {}),
                    listtile(
                        icon: Icons.policy_outlined,
                        title: 'Privacy Policy',
                        onpressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyScreen())
                          );
                        }),
                    listtile(
                      icon: Icons.exit_to_app_outlined,
                      title: 'Log Out',
                      onpressed: () {
                        _auth.signOut;
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignIn(),
                            ),
                            (route) => false);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
          // CircleAvatar(
          //   radius: 50,
          //   backgroundColor: Colors.amber,
          //   child: CircleAvatar(
          //     radius: 45,
          //     backgroundColor: Colors.grey[200],
          //   ),
          // )
          const Padding(
            padding: EdgeInsets.only(top: 40, left: 30),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 55,
              child: CircleAvatar(radius: 50, child: Text('My Acoount')),
            ),
          ),
        ],
      ),
    );
  }

  Widget listtile(
      {required IconData icon,
      required String title,
      required void Function() onpressed}) {
    return Column(
      children: [
        const Divider(
          height: 1,
        ),
        ListTile(
          leading: InkWell(child: Icon(icon), onTap: onpressed),
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }

  Widget listTile({required IconData iconData, required String title}) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 32,
        color: Colors.grey[700],
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black45,
        ),
      ),
    );
  }
}
