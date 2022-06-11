import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app_with_fb/constant.dart';
import 'package:food_app_with_fb/screens/chat/acttullychat.dart';
import 'package:food_app_with_fb/screens/chat/chat.dart';
import 'package:food_app_with_fb/screens/favourite/favourite.dart';
import 'package:food_app_with_fb/screens/home/components/discount_card.dart';
import 'package:food_app_with_fb/screens/home/components/item_card.dart';
import 'package:food_app_with_fb/screens/home/components/item_list.dart';
import 'package:food_app_with_fb/screens/home/components/search_box.dart';
import 'package:food_app_with_fb/screens/home/home_home.dart';
import 'package:food_app_with_fb/screens/login/login_screen.dart';
import 'package:food_app_with_fb/screens/posts/posts.dart';
import 'package:food_app_with_fb/screens/profile/profile.dart';
import 'package:food_app_with_fb/screens/sign_up/sign_up.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  int currentIndex = 0;

  List list = [
    HomeHome(),
    FavoriteScreen(),
    Posts(),
    ChatScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        animationDuration: Duration(milliseconds: 500),
        curve: Curves.easeInOutCirc,
        selectedIndex: currentIndex,
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            activeColor: kPrimaryColor,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.favorite_border_outlined),
            title: const Text('Favourite'),
            activeColor: kPrimaryColor,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.radar_outlined,),
            title: Text('Post'),
            activeColor: kPrimaryColor,
            inactiveColor: Colors.black
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            title: Text('Chat'),
            activeColor: kPrimaryColor,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person_outline),
            title: Text('Profile'),
            activeColor: kPrimaryColor,
            inactiveColor: Colors.black,
          ),
        ],
      ),
      body: list[currentIndex],
    );
//     return Scaffold(
//       drawer: Drawer(
//         child: Container(
//           color: Colors.grey[300],
//           child: ListView(
//             children: [
//               DrawerHeader(
//                 child: Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: Colors.white,
//                       radius: 43,
//                       child: CircleAvatar(
//                         radius: 40,
//                         child: SvgPicture.asset(
//                           'assets/icons/macdonalds.svg',
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Row(
//                           children: const [
//                             Text(
//                               'Welcome ',
//                               style: TextStyle(color: kTextColor),
//                             ),
//                             Text(
//                               'Guest',
//                               style: TextStyle(color: kPrimaryColor),
//                             )
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Container(
//                           height: 30,
//                           child: OutlineButton(
//                             onPressed: () {
//                               _auth.signOut();
//                               Navigator.pushAndRemoveUntil(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => SignIn(),
//                                   ),
//                                   (route) => false);
//                             },
//                             child: const Text(
//                               'Logout',
//                               style: TextStyle(color: kTextColor),
//                             ),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15),
//                               side: const BorderSide(
//                                 width: 2,
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child:
//                       listTile(iconData: Icons.home_outlined, title: 'Home')),
//               GestureDetector(
//                 onTap: () {},
//                 child: listTile(
//                     iconData: Icons.shopping_cart_outlined,
//                     title: 'Review Cart'),
//               ),
//               GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ProfileScreen(),
//                       ),
//                     );
//                   },
//                   child: listTile(
//                       iconData: Icons.person_outline, title: 'My Profile')),
//               GestureDetector(
//                 onTap: () {},
//                 child: listTile(
//                     iconData: Icons.notifications_outlined,
//                     title: 'Notification'),
//               ),
//               GestureDetector(
//                   onTap: () {},
//                   child: listTile(
//                       iconData: Icons.star_outline, title: 'Rating & Review')),
//               GestureDetector(
//                   onTap: () {},
//                   child: listTile(
//                       iconData: Icons.favorite_outline, title: 'Wishlist')),
//               GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ChatScreen(),
//                       ),
//                     );
//                   },
//                   child: listTile(
//                       iconData: Icons.chat_bubble_outline, title: 'Chatting')),
//               GestureDetector(
//                   onTap: () {},
//                   child: listTile(
//                       iconData: Icons.format_quote_outlined, title: 'FAQs')),
//               Container(
//                 height: 350,
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Contact Support',
//                       style: TextStyle(
//                         fontSize: 18,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             String num = '';
//                             launch('tel://' + '19011');
//                           },
//                           child: Row(
//                             children: const [
//                               Text(
//                                 'Call us',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Icon(
//                                 Icons.add_ic_call_outlined,
//                                 color: Colors.black45,
//                                 size: 25,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: const [
//                           Text(
//                             'Mail us: ',
//                             style: TextStyle(
//                               fontSize: 16,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Text(
//                             'mm5094697@gmail.com',
//                             style: TextStyle(
//                               fontSize: 14,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Icon(
//                             Icons.email_outlined,
//                             color: Colors.black45,
//                             size: 25,
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: Builder(
//           builder: (BuildContext context) {
//             return IconButton(
//               icon: const Icon(
//                 Icons.list,
//                 color: Color(0xFFFFC61F),
//               ),
//               onPressed: () {
//                 Scaffold.of(context).openDrawer();
//               },
//               tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
//             );
//           },
//         ),
//         title: RichText(
//           text: const TextSpan(
//             style: TextStyle(fontWeight: FontWeight.bold),
//             children: [
//               TextSpan(
//                 text: "Punk",
//                 style: TextStyle(color: ksecondaryColor),
//               ),
//               TextSpan(
//                 text: "Food",
//                 style: TextStyle(color: kPrimaryColor),
//               ),
//             ],
//           ),
//         ),
//         actions: <Widget>[
//           IconButton(
//             icon: SvgPicture.asset("assets/icons/notification.svg"),
//             onPressed: () {},
//           ),
//         ],
//       ),

//       bottomNavigationBar: BottomNavyBar(
//         selectedIndex: currentIndex,
//         onItemSelected: (index) {
//           setState(() {
//             currentIndex = index;
//           });
//         },
//         items: <BottomNavyBarItem>[
//           BottomNavyBarItem(
//             icon: Icon(Icons.home),
//             title: Text('Home'),
//             activeColor: kPrimaryColor,
//             inactiveColor: Colors.black,
//           ),
//           BottomNavyBarItem(
//             icon: Icon(Icons.favorite_border_outlined),
//             title: Text('Favourite'),
//             activeColor: kPrimaryColor,
//             inactiveColor: Colors.black,
//           ),
//           BottomNavyBarItem(
//             icon: Icon(Icons.chat_bubble_outline),
//             title: Text('Chat'),
//             activeColor: kPrimaryColor,
//             inactiveColor: Colors.black,
//           ),
//           BottomNavyBarItem(
//             icon: Icon(Icons.person_outline),
//             title: Text('Profile'),
//             activeColor: kPrimaryColor,
//             inactiveColor: Colors.black,
//           ),
//         ],
//       ),
//       // bottomNavigationBar: CurvedNavigationBar(
//       //   index: currentIndex,
//       //   animationCurve: Curves.easeInOut,
//       //   backgroundColor: kPrimaryColor,
//       //   onTap: (index) {
//       //     setState(() {
//       //       currentIndex = index;
//       //     });
//       //   },
//       //   items: [
//       //     SvgPicture.asset('assets/icons/home.svg'),
//       //     SvgPicture.asset('assets/icons/Following.svg'),
//       //     const Icon(Icons.chat_bubble_outline_outlined),
//       //     SvgPicture.asset('assets/icons/person.svg'),
//       //   ],
//       // onTap: (index) {
//       //   setState(() {
//       //     currentIndex = index;
//       //   });
//       // items: const [
//       //   BottomNavigationBarItem(
//       //     icon: Icon(Icons.home_outlined),
//       //     label: 'Home',
//       //   ),
//       //   BottomNavigationBarItem(
//       //     icon: Icon(Icons.favorite_outline),
//       //     label: 'Favourite',
//       //   ),
//       //   BottomNavigationBarItem(
//       //     icon: Icon(Icons.chat_bubble_outline_outlined),
//       //     label: 'Chat',
//       //   ),
//       //   BottomNavigationBarItem(
//       //     icon: Icon(Icons.person_outline),
//       //     label: 'Profile',
//       // ),
//       // );
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             // search bar
//             Container(
//               margin: EdgeInsets.all(20),
//               padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(50),
//                 border: Border.all(
//                   color: ksecondaryColor.withOpacity(0.32),
//                 ),
//               ),
//               child: TextField(
//                 onChanged: (value) {},
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   icon: SvgPicture.asset("assets/icons/search.svg"),
//                   hintText: "Search Here",
//                   hintStyle: const TextStyle(color: ksecondaryColor),
//                 ),
//               ),
//             ),
//             // CategoryList(),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: <Widget>[
//                   ItemCard(
//                     svgSrc: "assets/icons/burger_beer.svg",
//                     title: "Burger & Beer",
//                     shopName: "MacDonald's",
//                     press: () {},
//                   ),
//                   Container(
//                     width: 170,
//                     height: 195,
//                     margin: const EdgeInsets.only(
//                         left: 20, right: 15, top: 20, bottom: 20),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         BoxShadow(
//                           offset: const Offset(0, 4),
//                           blurRadius: 20,
//                           color: const Color(0xFFB0CCE1).withOpacity(0.32),
//                         ),
//                       ],
//                     ),
//                     child: Material(
//                       color: Colors.transparent,
//                       child: InkWell(
//                         onTap: () {},
//                         child: Padding(
//                           padding: const EdgeInsets.all(20.0),
//                           child: Column(
//                             children: <Widget>[
//                               Container(
//                                   width: 160,
//                                   margin: EdgeInsets.only(bottom: 15),
//                                   padding: EdgeInsets.all(25),
//                                   decoration: BoxDecoration(
//                                     color: kPrimaryColor.withOpacity(0.13),
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: Container(
//                                     width: 100,
//                                     height: 50,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(30),
//                                         image: const DecorationImage(
//                                           image: AssetImage(
//                                             'assets/images/burger.png',
//                                           ),
//                                         )),
//                                   )),
//                               const Text('Burger'),
//                               const SizedBox(height: 10),
//                               const Text(
//                                 'Burgers only Food',
//                                 style: TextStyle(fontSize: 12),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   ItemCard(
//                     svgSrc: "assets/icons/chinese_noodles.svg",
//                     title: "Chinese & Noodles",
//                     shopName: "Wendy's",
//                     press: () {},
//                   ),
//                   Container(
//                     width: 170,
//                     height: 195,
//                     margin: const EdgeInsets.only(
//                         left: 20, right: 15, top: 20, bottom: 20),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         BoxShadow(
//                           offset: const Offset(0, 4),
//                           blurRadius: 20,
//                           color: const Color(0xFFB0CCE1).withOpacity(0.32),
//                         ),
//                       ],
//                     ),
//                     child: Material(
//                       color: Colors.transparent,
//                       child: InkWell(
//                         onTap: () {},
//                         child: Padding(
//                           padding: const EdgeInsets.all(20.0),
//                           child: Column(
//                             children: <Widget>[
//                               Container(
//                                   width: 160,
//                                   margin: const EdgeInsets.only(bottom: 15),
//                                   padding: const EdgeInsets.all(25),
//                                   decoration: BoxDecoration(
//                                     color: kPrimaryColor.withOpacity(0.13),
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: Container(
//                                     width: 100,
//                                     height: 50,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(30),
//                                         image: const DecorationImage(
//                                             image: AssetImage(
//                                           'assets/images/beyond-meat-mcdonalds.png',
//                                         ))),
//                                   )),
//                               const Text('Burger & Potatoes'),
//                               const SizedBox(height: 10),
//                               const Text(
//                                 'Burger & Potatoes Food',
//                                 style: TextStyle(fontSize: 12),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: 170,
//                     height: 195,
//                     margin: const EdgeInsets.only(
//                         left: 20, right: 15, top: 20, bottom: 20),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         BoxShadow(
//                           offset: const Offset(0, 4),
//                           blurRadius: 20,
//                           color: const Color(0xFFB0CCE1).withOpacity(0.32),
//                         ),
//                       ],
//                     ),
//                     child: Material(
//                       color: Colors.transparent,
//                       child: InkWell(
//                         onTap: () {},
//                         child: Padding(
//                           padding: const EdgeInsets.all(20.0),
//                           child: Column(
//                             children: <Widget>[
//                               Container(
//                                 width: 90,
//                                 margin: const EdgeInsets.only(bottom: 15),
//                                 padding: const EdgeInsets.all(25),
//                                 decoration: BoxDecoration(
//                                   color: kPrimaryColor.withOpacity(0.13),
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: Image.asset('assets/images/botatos.png'),
//                               ),
//                               const Text('Potatoes'),
//                               const SizedBox(height: 10),
//                               const Text(
//                                 'Potatoes AB',
//                                 style: TextStyle(fontSize: 12),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   ItemCard(
//                     svgSrc: "assets/icons/macdonalds.svg",
//                     title: "Chicken & Beer",
//                     shopName: "MacDonald's",
//                     press: () {},
//                   ),
//                   ItemCard(
//                     svgSrc: "assets/icons/burger_beer.svg",
//                     title: "Burger & Beer",
//                     shopName: "MacDonald's",
//                     press: () {},
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "Offers & Discounts",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold, color: kTextColor),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.symmetric(vertical: 20),
//                     width: double.infinity,
//                     height: 166,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       image: const DecorationImage(
//                         fit: BoxFit.fill,
//                         image: AssetImage(
//                             "assets/images/beyond-meat-mcdonalds.png"),
//                       ),
//                     ),
//                     child: DecoratedBox(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         gradient: LinearGradient(
//                           colors: [
//                             Color(0xFFFF961F).withOpacity(0.7),
//                             kPrimaryColor.withOpacity(0.7),
//                           ],
//                         ),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(20.0),
//                         child: Row(
//                           children: <Widget>[
//                             Expanded(
//                               child: SvgPicture.asset(
//                                   "assets/icons/macdonalds.svg"),
//                             ),
//                             Expanded(
//                               child: RichText(
//                                 text: const TextSpan(
//                                   style: TextStyle(color: Colors.white),
//                                   children: [
//                                     TextSpan(
//                                       text: "Get Discount of \n",
//                                       style: TextStyle(fontSize: 16),
//                                     ),
//                                     TextSpan(
//                                       text: "30% \n",
//                                       style: TextStyle(
//                                         fontSize: 43,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     TextSpan(
//                                       text:
//                                           "at MacDonald's on your first order & Instant cashback",
//                                       style: TextStyle(fontSize: 10),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         width: 150,
//                         height: 120,
//                         decoration: BoxDecoration(
//                           color: Colors.grey[200],
//                           borderRadius: BorderRadius.circular(20),
//                           image: const DecorationImage(
//                             fit: BoxFit.cover,
//                             image: AssetImage(
//                               'assets/images/burger.png',
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           height: 120,
//                           decoration: const BoxDeco
// ration(
//                             borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(20),
//                               bottomRight: Radius.circular(20),
//                             ),
//                             color: Colors.white,
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.only(
//                               left: 10,
//                               right: 10,
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: const [
//                                     Text(
//                                       'Mac :-',
//                                       style: TextStyle(
//                                           fontSize: 30, color: Colors.black54),
//                                     ),
//                                   ],
//                                 ),
//                                 const Text(
//                                   'Nutritious Chicken meal in MAC',
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 const Text(
//                                   'With chinese characteristics',
//                                   maxLines: 1,
//                                   style: TextStyle(
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 18,
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         width: 150,
//                         height: 120,
//                         decoration: BoxDecoration(
//                           color: Colors.grey[200],
//                           borderRadius: BorderRadius.circular(20),
//                           image: const DecorationImage(
//                             fit: BoxFit.cover,
//                             image: AssetImage(
//                               'assets/images/beyond-meat-mcdonalds.png',
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           height: 120,
//                           decoration: const BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(20),
//                               bottomRight: Radius.circular(20),
//                             ),
//                             color: Colors.white,
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.only(
//                               left: 10,
//                               right: 10,
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: const [
//                                     Text(
//                                       'Mac :-',
//                                       style: TextStyle(
//                                           fontSize: 30, color: Colors.black54),
//                                     ),
//                                   ],
//                                 ),
//                                 const Text(
//                                   'Nutritious Burger meal in MAC',
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 const Text(
//                                   'With chinese characteristics',
//                                   maxLines: 1,
//                                   style: TextStyle(
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 18,
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         width: 150,
//                         height: 120,
//                         decoration: BoxDecoration(
//                           color: Colors.grey[200],
//                           borderRadius: BorderRadius.circular(20),
//                           // image: const DecorationImage(
//                           //   fit: BoxFit.cover,
//                           // image: AssetImage(
//                           //   'assets/images/burger.png',
//                           // ),
//                           // ),
//                         ),
//                         child: SvgPicture.asset(
//                             'assets/icons/chinese_noodles.svg'),
//                       ),
//                       Expanded(
//                         child: Container(
//                           height: 120,
//                           decoration: const BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(20),
//                               bottomRight: Radius.circular(20),
//                             ),
//                             color: Colors.white,
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.only(
//                               left: 10,
//                               right: 10,
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: const [
//                                     Text(
//                                       'Chines Food :-',
//                                       maxLines: 1,
//                                       style: TextStyle(
//                                           overflow: TextOverflow.ellipsis,
//                                           fontSize: 23.5,
//                                           color: Colors.black54),
//                                     ),
//                                   ],
//                                 ),
//                                 const Text(
//                                   'Nutritious Chicken meal in MAC',
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 const Text(
//                                   'With chinese characteristics',
//                                   maxLines: 1,
//                                   style: TextStyle(
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 18,
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         width: 150,
//                         height: 120,
//                         decoration: BoxDecoration(
//                           color: Colors.grey[200],
//                           borderRadius: BorderRadius.circular(20),
//                           image: const DecorationImage(
//                             fit: BoxFit.cover,
//                             image: AssetImage(
//                               'assets/images/seafood.png',
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           height: 120,
//                           decoration: const BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(20),
//                               bottomRight: Radius.circular(20),
//                             ),
//                             color: Colors.white,
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.only(
//                               left: 10,
//                               right: 10,
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: const [
//                                     Text(
//                                       'Fisher Man :-',
//                                       maxLines: 1,
//                                       style: TextStyle(
//                                           overflow: TextOverflow.ellipsis,
//                                           fontSize: 24.5,
//                                           color: Colors.black54),
//                                     ),
//                                   ],
//                                 ),
//                                 const Text(
//                                   'Nutritious Fish meal in MAC',
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 const Text(
//                                   'With Fish characteristics',
//                                   maxLines: 1,
//                                   style: TextStyle(
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 18,
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         width: 150,
//                         height: 120,
//                         decoration: BoxDecoration(
//                           color: Colors.grey[200],
//                           borderRadius: BorderRadius.circular(20),
//                           image: const DecorationImage(
//                             fit: BoxFit.cover,
//                             image: AssetImage(
//                               'assets/images/macarons-color.png',
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           height: 120,
//                           decoration: const BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(20),
//                               bottomRight: Radius.circular(20),
//                             ),
//                             color: Colors.white,
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.only(
//                               left: 10,
//                               right: 10,
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: const [
//                                     Text(
//                                       'Mac :-',
//                                       style: TextStyle(
//                                           fontSize: 30, color: Colors.black54),
//                                     ),
//                                   ],
//                                 ),
//                                 const Text(
//                                   'Nutritious Desert meal in MAC',
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 const Text(
//                                   'With desert characteristics',
//                                   style: TextStyle(),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 18,
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         width: 150,
//                         height: 120,
//                         decoration: BoxDecoration(
//                           color: Colors.grey[200],
//                           borderRadius: BorderRadius.circular(20),
//                           image: const DecorationImage(
//                             fit: BoxFit.contain,
//                             image: AssetImage(
//                               'assets/images/coffee-shop.png',
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           height: 120,
//                           decoration: const BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(20),
//                               bottomRight: Radius.circular(20),
//                             ),
//                             color: Colors.white,
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.only(
//                               left: 10,
//                               right: 10,
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: const [
//                                     Text(
//                                       'Coffee :-',
//                                       style: TextStyle(
//                                           fontSize: 30, color: Colors.black54),
//                                     ),
//                                   ],
//                                 ),
//                                 const Text(
//                                   'Nutritious Coffee meal in MAC',
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 const Text(
//                                   'With desert characteristics',
//                                   style: TextStyle(),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
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
  }
}
