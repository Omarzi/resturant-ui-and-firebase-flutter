import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app_with_fb/constant.dart';
import 'package:food_app_with_fb/screens/chat/acttullychat.dart';
import 'package:food_app_with_fb/screens/chat/chat.dart';
import 'package:food_app_with_fb/screens/details/datail_page_view/details_screen3.dart';
import 'package:food_app_with_fb/screens/details/datail_page_view/details_screen5.dart';
import 'package:food_app_with_fb/screens/details/datail_page_view/details_screen6.dart';
import 'package:food_app_with_fb/screens/home/components/item_card.dart';
import 'package:food_app_with_fb/screens/login/login_screen.dart';
import 'package:food_app_with_fb/screens/profile/profile.dart';
import 'package:url_launcher/url_launcher.dart';

import '../details/datail_page_view/details-screen1.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    bool test = true;

    return Scaffold(
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
                text: "Resturant ",
                style: TextStyle(color: ksecondaryColor),
              ),
              TextSpan(
                text: "Food",
                style: TextStyle(color: kPrimaryColor),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset("assets/icons/notification.svg"),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            child: Card(
              elevation: 8,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: ItemCard(
                      svgSrc: "assets/icons/burger_beer.svg",
                      title: "Burger & Beer",
                      shopName: "MacDonald's",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen()),
                        );
                      },
                    ),
                  ),
                  Container(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                    left: 20,
                    right: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    color: Colors.grey[100],
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.favorite,color: Color(0xFF89dad0))
                        // : const Icon(Icons.favorite_outline, color: Color(0xFF89dad0)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            child: Card(
              elevation: 8,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: ItemCard(
                      svgSrc: "assets/icons/chinese_noodles.svg",
                      title: "Chines & Noodles",
                      shopName: "Chines Food",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen3()),
                        );
                      },
                    ),
                  ),
                  Container(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                    left: 20,
                    right: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    color: Colors.grey[100],
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.favorite,color: Color(0xFF89dad0))
                        // : const Icon(Icons.favorite_outline, color: Color(0xFF89dad0)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            child: Card(
              elevation: 8,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: ItemCard(
                      svgSrc: "assets/icons/macdonalds.svg",
                      title: "Chicken & Beer",
                      shopName: "MacDonald's",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen6()),
                        );
                      },
                    ),
                  ),
                  Container(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                    left: 20,
                    right: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    color: Colors.grey[100],
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.favorite,color: Color(0xFF89dad0))
                        // : const Icon(Icons.favorite_outline, color: Color(0xFF89dad0)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
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
