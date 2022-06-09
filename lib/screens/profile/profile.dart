import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app_with_fb/constant.dart';
import 'package:food_app_with_fb/screens/chat/acttullychat.dart';
import 'package:food_app_with_fb/screens/login/login_screen.dart';
import 'package:food_app_with_fb/screens/profile/get_location.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

// final _firestore = FirebaseFirestore.instance;
// late User signInedUser; // this will give me the email

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _auth = FirebaseAuth.instance;
  String? x;

  // File? file;

  // void pickercamera() async {
  //   final myfile = await ImagePicker().getImage(source: ImageSource.camera);
  //   setState(() {
  //     file = File(myfile.path);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    final bool isOpenCamera = false;
    print('file path. = $x');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      drawer: Drawer(
        child: Container(
          color: Colors.grey[200],
          child: ListView(
            children: [
              DrawerHeader(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 43,
                      child: CircleAvatar(
                        radius: 40,
                        child: SvgPicture.asset(
                          'assets/icons/macdonalds.svg',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: const [
                            Text(
                              'Welcome ',
                              style: TextStyle(color: kTextColor),
                            ),
                            Text(
                              'Guest',
                              style: TextStyle(color: kPrimaryColor),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 30,
                          child: OutlineButton(
                            onPressed: () {
                              _auth.signOut();
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignIn(),
                                  ),
                                  (route) => false);
                            },
                            child: const Text(
                              'Logout',
                              style: TextStyle(color: kTextColor),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(
                                width: 2,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child:
                      listTile(iconData: Icons.home_outlined, title: 'Home')),
              GestureDetector(
                onTap: () {},
                child: listTile(
                    iconData: Icons.shopping_cart_outlined,
                    title: 'Review Cart'),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ),
                    );
                  },
                  child: listTile(
                      iconData: Icons.person_outline, title: 'My Profile')),
              GestureDetector(
                onTap: () {},
                child: listTile(
                    iconData: Icons.notifications_outlined,
                    title: 'Notification'),
              ),
              GestureDetector(
                  onTap: () {},
                  child: listTile(
                      iconData: Icons.star_outline, title: 'Rating & Review')),
              GestureDetector(
                  onTap: () {},
                  child: listTile(
                      iconData: Icons.favorite_outline, title: 'Wishlist')),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(),
                      ),
                    );
                  },
                  child: listTile(
                      iconData: Icons.chat_bubble_outline, title: 'Chatting')),
              GestureDetector(
                  onTap: () {},
                  child: listTile(
                      iconData: Icons.format_quote_outlined, title: 'FAQs')),
              Container(
                height: 350,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Contact Support',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            String num = '';
                            launch('tel://' + '19011');
                          },
                          child: Row(
                            children: const [
                              Text(
                                'Call us',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.add_ic_call_outlined,
                                color: Colors.black45,
                                size: 25,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: const [
                          Text(
                            'Mail us: ',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'mm5094697@gmail.com',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.email_outlined,
                            color: Colors.black45,
                            size: 25,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.list,
                color: Color(0xFFFFC61F),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: RichText(
          text: const TextSpan(
            style: TextStyle(fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: "My",
                style: TextStyle(color: ksecondaryColor, fontSize: 18),
              ),
              TextSpan(
                text: " Profile",
                style: TextStyle(color: kPrimaryColor, fontSize: 18),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.account_box_outlined,
              color: kTextColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 92,
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
                          width: 250,
                          height: 80,
                          padding: const EdgeInsets.only(left: 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Welcom Guest',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: kTextColor),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      width: 179,
                                      child: const Text(
                                          'if You can change the photo pressed here')),
                                ],
                              ),
                              GestureDetector(
                                onTap: () async {
                                  ImagePicker y = ImagePicker();
                                  final z = await y.getImage(
                                      source: ImageSource.camera);
                                  setState(
                                    () {
                                      if (z != null) {
                                        x = z.path;
                                      }
                                    },
                                  );
                                },
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Colors.grey[300],
                                  child: const CircleAvatar(
                                    radius: 15,
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    listtile(
                        iconButton: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.shop_outlined),
                        ),
                        title: 'My Orders'),
                    GestureDetector(
                        child: listtile(
                            iconButton: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const GetLocation(
                                              x: 30.272065055909493,
                                              y: 31.415167558642207,
                                              name: 'pppp',
                                            )));
                              },
                              icon: Icon(Icons.location_on),
                            ),
                            title: 'My Delivery Address')),
                    listtile(
                        iconButton: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.person_outline),
                        ),
                        title: 'Refer a Friends'),
                    listtile(
                        iconButton: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.file_copy_outlined),
                        ),
                        title: 'Terms & Conditions'),
                    listtile(
                        iconButton: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.policy_outlined,
                            )),
                        title: 'Privacy Policy'),
                    listtile(
                        iconButton: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add_chart_outlined),
                        ),
                        title: 'About'),
                    GestureDetector(
                      onTap: () {
                        _auth.signOut();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignIn(),
                            ),
                            (route) => false);
                      },
                      child: listtile(
                          iconButton: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.exit_to_app_outlined,
                              )),
                          title: 'Log Out'),
                    )
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
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 50,
              child: CircleAvatar(
                radius: 45,
                //   child: x == null
                //       ? SvgPicture.asset('assets/icons/macdonalds.svg')
                //      : null,
                backgroundImage: AssetImage('assetName'),
                foregroundImage: FileImage(File(x ?? "")),
              ),
              //(x==null)?Text("No Image"):Image.file(x),
            ),
          ),
        ],
      ),
    );
  }

  Widget listtile({required IconButton iconButton, required String title}) {
    return Column(
      children: [
        const Divider(
          height: 1,
        ),
        ListTile(
          leading: iconButton,
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
