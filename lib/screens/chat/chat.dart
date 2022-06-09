// import 'dart:io';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_speed_dial/flutter_speed_dial.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:food_app_with_fb/constant.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:food_app_with_fb/screens/chat/acttullychat.dart';
// import 'package:food_app_with_fb/screens/login/login_screen.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:url_launcher/url_launcher.dart';

// import '../profile/profile.dart';

// final _firestore = FirebaseFirestore.instance;
// late User signedInUser; // This will give us the email

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({Key? key}) : super(key: key);

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final messageTextControler = TextEditingController();
//   final _auth = FirebaseAuth.instance;
//   String? messageText; // This will give us the message

//   final isDialOpen = ValueNotifier(false);

//   @override
//   Widget build(BuildContext context) {
//     final _auth = FirebaseAuth.instance;

//     return WillPopScope(
//       onWillPop: () async {
//         if (isDialOpen.value) {
//           isDialOpen.value = false;
//           return false;
//         } else {
//           return true;
//         }
//       },
//       child: Scaffold(
//         backgroundColor: Colors.grey[200],
//         drawer: Drawer(
//           child: Container(
//             color: Colors.grey[200],
//             child: ListView(
//               children: [
//                 DrawerHeader(
//                   child: Row(
//                     children: [
//                       CircleAvatar(
//                         backgroundColor: Colors.white,
//                         radius: 43,
//                         child: CircleAvatar(
//                           radius: 40,
//                           child: SvgPicture.asset(
//                             'assets/icons/macdonalds.svg',
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 20,
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Row(
//                             children: const [
//                               Text(
//                                 'Welcome ',
//                                 style: TextStyle(color: kTextColor),
//                               ),
//                               Text(
//                                 'Guest',
//                                 style: TextStyle(color: kPrimaryColor),
//                               )
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Container(
//                             height: 30,
//                             child: OutlineButton(
//                               onPressed: () {
//                                 _auth.signOut();
//                                 Navigator.pushAndRemoveUntil(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => SignIn(),
//                                     ),
//                                     (route) => false);
//                               },
//                               child: const Text(
//                                 'Logout',
//                                 style: TextStyle(color: kTextColor),
//                               ),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15),
//                                 side: const BorderSide(
//                                   width: 2,
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child:
//                         listTile(iconData: Icons.home_outlined, title: 'Home')),
//                 GestureDetector(
//                   onTap: () {},
//                   child: listTile(
//                       iconData: Icons.shopping_cart_outlined,
//                       title: 'Review Cart'),
//                 ),
//                 GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ProfileScreen(),
//                         ),
//                       );
//                     },
//                     child: listTile(
//                         iconData: Icons.person_outline, title: 'My Profile')),
//                 GestureDetector(
//                   onTap: () {},
//                   child: listTile(
//                       iconData: Icons.notifications_outlined,
//                       title: 'Notification'),
//                 ),
//                 GestureDetector(
//                     onTap: () {},
//                     child: listTile(
//                         iconData: Icons.star_outline,
//                         title: 'Rating & Review')),
//                 GestureDetector(
//                     onTap: () {},
//                     child: listTile(
//                         iconData: Icons.favorite_outline, title: 'Wishlist')),
//                 GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ChatScreen(),
//                         ),
//                       );
//                     },
//                     child: listTile(
//                         iconData: Icons.chat_bubble_outline,
//                         title: 'Chatting')),
//                 GestureDetector(
//                     onTap: () {},
//                     child: listTile(
//                         iconData: Icons.format_quote_outlined, title: 'FAQs')),
//                 Container(
//                   height: 350,
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Contact Support',
//                         style: TextStyle(
//                           fontSize: 18,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               String num = '';
//                               launch('tel://' + '19011');
//                             },
//                             child: Row(
//                               children: const [
//                                 Text(
//                                   'Call us',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Icon(
//                                   Icons.add_ic_call_outlined,
//                                   color: Colors.black45,
//                                   size: 25,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           children: const [
//                             Text(
//                               'Mail us: ',
//                               style: TextStyle(
//                                 fontSize: 16,
//                               ),
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Text(
//                               'mm5094697@gmail.com',
//                               style: TextStyle(
//                                 fontSize: 14,
//                               ),
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Icon(
//                               Icons.email_outlined,
//                               color: Colors.black45,
//                               size: 25,
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           leading: Builder(
//             builder: (BuildContext context) {
//               return IconButton(
//                 icon: const Icon(
//                   Icons.list,
//                   color: Color(0xFFFFC61F),
//                 ),
//                 onPressed: () {
//                   Scaffold.of(context).openDrawer();
//                 },
//                 tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
//               );
//             },
//           ),
//           title: RichText(
//             text: const TextSpan(
//               style: TextStyle(fontWeight: FontWeight.bold),
//               children: [
//                 TextSpan(
//                   text: "Chat",
//                   style: TextStyle(color: ksecondaryColor, fontSize: 18),
//                 ),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             IconButton(
//               icon: const Icon(
//                 Icons.chat_outlined,
//                 color: kTextColor,
//               ),
//               onPressed: () {},
//             ),
//           ],
//         ),
//         body: Stack(
//           children: [
//             Column(
//               children: [
//                 Container(
//                   height: 100,
//                   color: Colors.grey[200],
//                 ),
//                 Container(
//                   height: 548,
//                   width: double.infinity,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                   decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(30),
//                         topRight: Radius.circular(30),
//                       )),
//                   child: ListView(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Container(
//                             width: 250,
//                             height: 80,
//                             padding: const EdgeInsets.only(left: 20),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     const Text(
//                                       "Let's Chatting",
//                                       style: TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.bold,
//                                           color: kTextColor),
//                                     ),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     Container(
//                                         width: 165,
//                                         child: const Text(
//                                             'If you need any details, tack to us here.')),
//                                   ],
//                                 ),
//                                 CircleAvatar(
//                                   radius: 15,
//                                   backgroundColor: Colors.grey[300],
//                                   child: CircleAvatar(
//                                     radius: 12,
//                                     child: Icon(
//                                       Icons.edit,
//                                       color: Colors.grey[300],
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Divider(
//                         height: 20,
//                         thickness: 1.2,
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 40, left: 30),
//               child: CircleAvatar(
//                 backgroundColor: Colors.white,
//                 radius: 50,
//                 child: CircleAvatar(
//                   radius: 45,
//                   child: SvgPicture.asset(
//                     'assets/icons/macdonalds.svg',
//                     color: ksecondaryColor,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         // floatingActionButton: FloatingActionButton(
//         //   elevation: 0.0,
//         //   child: const Icon(Icons.add),
//         //   backgroundColor: Colors.blue[100],
//         //   onPressed: () {
//         //     Navigator.push(context, MaterialPageRoute(builder: (context) => ActtullyChat()),);
//         //   },
//         //   ),
//         floatingActionButton: SpeedDial(
//           backgroundColor: Colors.blue[100],
//           overlayColor: Colors.blue[100],
//           overlayOpacity: 0.4,
//           animatedIcon: AnimatedIcons.add_event,
//           spacing: 12,
//           spaceBetweenChildren: 12,
//           closeManually: true,
//           openCloseDial: isDialOpen,
//           children: [
//             SpeedDialChild(
//               child: const Icon(
//                 Icons.chat,
//               ),
//               label: 'Chat',
//               onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ActtullyChat()),
//               ),
//             ),
//             SpeedDialChild(
//                 child: const Icon(Icons.camera_alt),
//                 label: 'Copy',
//                 onTap: () {}),
//             SpeedDialChild(
//               child: const Icon(
//                 Icons.facebook_outlined,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget listTile({required IconData iconData, required String title}) {
//     return ListTile(
//       leading: Icon(
//         iconData,
//         size: 32,
//         color: Colors.grey[700],
//       ),
//       title: Text(
//         title,
//         style: const TextStyle(
//           color: Colors.black45,
//         ),
//       ),
//     );
//   }
// }
