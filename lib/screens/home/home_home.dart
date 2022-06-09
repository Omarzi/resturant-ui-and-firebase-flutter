import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app_with_fb/screens/check/check_page_view/check1.dart';
import 'package:food_app_with_fb/screens/details/detail_body_view/deatails_screen1.dart';
import 'package:food_app_with_fb/screens/details/detail_body_view/details_screen2.dart';
import 'package:food_app_with_fb/screens/details/detail_body_view/details_screen3.dart';
import 'package:food_app_with_fb/screens/details/detail_body_view/details_screen4.dart';
import 'package:food_app_with_fb/screens/details/detail_body_view/details_screen5.dart';
import 'package:food_app_with_fb/screens/details/detail_body_view/details_screen6.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:food_app_with_fb/constant.dart';
import 'package:food_app_with_fb/popup/setting/setting.dart';
import 'package:food_app_with_fb/screens/chat/acttullychat.dart';
import 'package:food_app_with_fb/screens/chat/chat.dart';
import 'package:food_app_with_fb/screens/details/datail_page_view/details-screen1.dart';
import 'package:food_app_with_fb/screens/details/datail_page_view/details_screen2.dart';
import 'package:food_app_with_fb/screens/details/datail_page_view/details_screen3.dart';
import 'package:food_app_with_fb/screens/details/datail_page_view/details_screen4.dart';
import 'package:food_app_with_fb/screens/details/datail_page_view/details_screen5.dart';
import 'package:food_app_with_fb/screens/details/datail_page_view/details_screen6.dart';
import 'package:food_app_with_fb/screens/home/components/item_card.dart';
import 'package:food_app_with_fb/screens/login/login_screen.dart';
import 'package:food_app_with_fb/screens/profile/profile.dart';

class HomeHome extends StatefulWidget {
  @override
  State<HomeHome> createState() => _HomeHomeState();
}

class _HomeHomeState extends State<HomeHome> {
  final _auth = FirebaseAuth.instance;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
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
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Check1()));
                },
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
          // IconButton(
          //   icon: SvgPicture.asset("assets/icons/more.svg", color: ksecondaryColor,),
          //   onPressed: () {
          //     showSearch(
          //       context: context,
          //       delegate: MySearchDelegate(),
          //     );
          //   },
          // ),

          IconButton(
            onPressed: () {},
            color: ksecondaryColor,
            icon: PopupMenuButton(
                iconSize: 22,
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SettingScreen()));
                          },
                          child: Row(
                            children: const [
                              Icon(
                                Icons.settings_outlined,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Setting",
                              ),
                            ],
                          ),
                        ),
                        value: 1,
                      ),
                      PopupMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const LocationScreen(
                            //             x: 30.286928053985783,
                            //             y: 31.73986087194244,
                            //             name: 'Food App')));
                          },
                          child: Row(
                            children: const [
                              Icon(
                                Icons.location_on_outlined,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Location")
                            ],
                          ),
                        ),
                        value: 3,
                      ),
                    ]),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // // search bar
            // Container(
            //   margin: EdgeInsets.all(20),
            //   padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(50),
            //     border: Border.all(
            //       color: ksecondaryColor.withOpacity(0.32),
            //     ),
            //   ),
            //   child: GestureDetector(
            //     onTap: () {

            //     },
            //     child: TextField(
            //       onChanged: (value) {},
            //       decoration: InputDecoration(
            //         border: InputBorder.none,
            //         icon: SvgPicture.asset("assets/icons/search.svg"),
            //         hintText: "Search Here",
            //         hintStyle: const TextStyle(color: ksecondaryColor),
            //       ),
            //     ),
            //   ),
            // ),
            // CategoryList(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  ItemCard(
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
                  Container(
                    width: 170,
                    height: 195,
                    margin: const EdgeInsets.only(
                        left: 20, right: 15, top: 20, bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 20,
                          color: const Color(0xFFB0CCE1).withOpacity(0.32),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen2()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                  width: 160,
                                  margin: EdgeInsets.only(bottom: 15),
                                  padding: EdgeInsets.all(25),
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor.withOpacity(0.13),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Container(
                                    width: 100,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                            'assets/images/burger.png',
                                          ),
                                        )),
                                  )),
                              const Text('Burger'),
                              const SizedBox(height: 10),
                              const Text(
                                'Burgers only Food',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  ItemCard(
                    svgSrc: "assets/icons/chinese_noodles.svg",
                    title: "Chinese & Noodles",
                    shopName: "Wendy's",
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen3()));
                    },
                  ),
                  Container(
                    width: 170,
                    height: 195,
                    margin: const EdgeInsets.only(
                        left: 20, right: 15, top: 20, bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 20,
                          color: const Color(0xFFB0CCE1).withOpacity(0.32),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen4()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                  width: 160,
                                  margin: const EdgeInsets.only(bottom: 15),
                                  padding: const EdgeInsets.all(25),
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor.withOpacity(0.13),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Container(
                                    width: 100,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                          'assets/images/beyond-meat-mcdonalds.png',
                                        ))),
                                  )),
                              const Text('Burger & Botatos'),
                              const SizedBox(height: 10),
                              const Text(
                                'Burger & Potatoes Food',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 170,
                    height: 195,
                    margin: const EdgeInsets.only(
                        left: 20, right: 15, top: 20, bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 20,
                          color: const Color(0xFFB0CCE1).withOpacity(0.32),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen5()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 90,
                                margin: const EdgeInsets.only(bottom: 15),
                                padding: const EdgeInsets.all(25),
                                decoration: BoxDecoration(
                                  color: kPrimaryColor.withOpacity(0.13),
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset('assets/images/botatos.png'),
                              ),
                              const Text('Botatos'),
                              const SizedBox(height: 10),
                              const Text(
                                'Potatoes AB',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  ItemCard(
                    svgSrc: "assets/icons/macdonalds.svg",
                    title: "Chicken & Beer",
                    shopName: "MacDonald's",
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen6()));
                    },
                  ),
                  ItemCard(
                    svgSrc: "assets/icons/burger_beer.svg",
                    title: "Burger & Beer",
                    shopName: "MacDonald's",
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen()));
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Offers & Discounts",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: kTextColor),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    height: 166,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            "assets/images/beyond-meat-mcdonalds.png"),
                      ),
                    ),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFF961F).withOpacity(0.7),
                            kPrimaryColor.withOpacity(0.7),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: SvgPicture.asset(
                                  "assets/icons/macdonalds.svg"),
                            ),
                            Expanded(
                              child: RichText(
                                text: const TextSpan(
                                  style: TextStyle(color: Colors.white),
                                  children: [
                                    TextSpan(
                                      text: "Get Discount of \n",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    TextSpan(
                                      text: "30% \n",
                                      style: TextStyle(
                                        fontSize: 43,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "at MacDonald's on your first order & Instant cashback",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsBodyScreen1()));
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 150,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/burger.png',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 120,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: const [
                                      Text(
                                        'Mac :-',
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    'Nutritious Chicken meal in MAC',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'With chinese characteristics',
                                    maxLines: 1,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsBodyScreen2()));
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 150,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/beyond-meat-mcdonalds.png',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 120,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: const [
                                      Text(
                                        'Mac :-',
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    'Nutritious Burger meal in MAC',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'With chinese characteristics',
                                    maxLines: 1,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsBodyScreen3()));
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 150,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                            // image: const DecorationImage(
                            //   fit: BoxFit.cover,
                            // image: AssetImage(
                            //   'assets/images/burger.png',
                            // ),
                            // ),
                          ),
                          child: SvgPicture.asset(
                              'assets/icons/chinese_noodles.svg'),
                        ),
                        Expanded(
                          child: Container(
                            height: 120,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: const [
                                      Text(
                                        'Chines Food :-',
                                        maxLines: 1,
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 23.5,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    'Nutritious Chicken meal in MAC',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'With chinese characteristics',
                                    maxLines: 1,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsBodyScreen4()));
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 150,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/seafood.png',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 120,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: const [
                                      Text(
                                        'Fisher Man :-',
                                        maxLines: 1,
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 24.5,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    'Nutritious Fish meal in MAC',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'With Fish characteristics',
                                    maxLines: 1,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsBodyScreen5()));
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 150,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/macarons-color.png',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 120,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: const [
                                      Text(
                                        'Mac :-',
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    'Nutritious Desert meal in MAC',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'With desert characteristics',
                                    style: TextStyle(),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsBodyScreen6()));
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 150,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(
                                'assets/images/coffee-shop.png',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 120,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: const [
                                      Text(
                                        'Coffee :-',
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    'Nutritious Coffee meal in MAC',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'With desert characteristics',
                                    style: TextStyle(),
                                  )
                                ],
                              ),
                            ),
                          ),
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
    );
  }

  ListTile listTile({required IconData iconData, required String title}) {
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

class MySearchDelegate extends SearchDelegate {
  List<String> searchResults = [
    'Burger & Beer',
    'Burger',
    'Chinese & Noodles',
    'Burger & Potatoes',
    'Potatoes',
    'Chicken & Beer',
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          }
          query = ' ';
        },
        icon: const Icon(Icons.clear));
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];

          return ListTile(
            title: Text(suggestion),
            onTap: () {
              query = suggestion;
              showResults(context);
            },
          );
        });
  }
}
