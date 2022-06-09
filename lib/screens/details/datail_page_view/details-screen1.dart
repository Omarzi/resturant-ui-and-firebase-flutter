import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app_with_fb/constant.dart';
import 'package:food_app_with_fb/screens/check/check_page_view/check1.dart';
import 'package:readmore/readmore.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int count = 1;
  int prize = 12;
  int total = 0;
  int cart = 1;
  bool test = true;
  bool isReadMore = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.clear,
                  )),
              toolbarHeight: 70,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Container(),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.shopping_cart_outlined,),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Check1()));
                        },
                      ),
                      Text('$cart'),
                    ],
                  )
                ],
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(20),
                child: Container(
                  child: const Center(
                    child: Text(
                      'Burger & Beer',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(
                    top: 5,
                    bottom: 10,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              pinned: true,
              // backgroundColor: Colors.blue[800],
              backgroundColor: kPrimaryColor,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: SvgPicture.asset(
                  'assets/icons/burger_beer.svg',
                  width: double.maxFinite,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: textWidget(
                        'Hainanese chicken rice is a dish of poached chicken and seasoned rice, served with chilli sauce and usually with cucumber garnishes. It was created by immigrants from Hainan in southern China and adapted from the Hainanese dish Wenchang chicken. It is considered one of the national dishes of Singapore and is most commonly associated with Singaporean cuisine. The dish is also seen throughout Southeast Asia, particularly Indonesia and Malaysia where it is a culinary staple, Hainanese chicken rice is a dish of poached chicken and seasoned rice, served with chilli sauce and usually with cucumber garnishes. It was created by immigrants from Hainan in southern China and adapted from the Hainanese dish Wenchang chicken. It is considered one of the national dishes of Singapore and is most commonly associated with Singaporean cuisine. The dish is also seen throughout Southeast Asia, particularly Indonesia and Malaysia where it is a culinary staple, Hainanese chicken rice is a dish of poached chicken and seasoned rice, served with chilli sauce and usually with cucumber garnishes. It was created by immigrants from Hainan in southern China and adapted from the Hainanese dish Wenchang chicken. It is considered one of the national dishes of Singapore and is most commonly associated with Singaporean cuisine. The dish is also seen throughout Southeast Asia, particularly Indonesia and Malaysia where it is a culinary staple, Hainanese chicken rice is a dish of poached chicken and seasoned rice, served with chilli sauce and usually with cucumber garnishes. It was created by immigrants from Hainan in southern China and adapted from the Hainanese dish Wenchang chicken. It is considered one of the national dishes of Singapore and is most commonly associated with Singaporean cuisine. The dish is also seen throughout Southeast Asia, particularly Indonesia and Malaysia where it is a culinary staple, Hainanese chicken rice is a dish of poached chicken and seasoned rice, served with chilli sauce and usually with cucumber garnishes. It was created by immigrants from Hainan in southern China and adapted from the Hainanese dish Wenchang chicken. It is considered one of the national dishes of Singapore and is most commonly associated with Singaporean cuisine. The dish is also seen throughout Southeast Asia, particularly Indonesia and Malaysia where it is a culinary staple, Hainanese chicken rice is a dish of poached chicken and seasoned rice, served with chilli sauce and usually with cucumber garnishes. It was created by immigrants from Hainan in southern China and adapted from the Hainanese dish Wenchang chicken. It is considered one of the national dishes of Singapore and is most commonly associated with Singaporean cuisine. The dish is also seen throughout Southeast Asia, particularly Indonesia and Malaysia where it is a culinary staple., Hainanese chicken rice is a dish of poached chicken and seasoned rice, served with chilli sauce and usually with cucumber garnishes. It was created by immigrants from Hainan in southern China and adapted from the Hainanese dish Wenchang chicken. It is considered one of the national dishes of Singapore and is most commonly associated with Singaporean cuisine. The dish is also seen throughout Southeast Asia, particularly Indonesia and Malaysia where it is a culinary staple, Hainanese chicken rice is a dish of poached chicken and seasoned rice, served with chilli sauce and usually with cucumber garnishes. It was created by immigrants from Hainan in southern China and adapted from the Hainanese dish Wenchang chicken. It is considered one of the national dishes of Singapore and is most commonly associated with Singaporean cuisine. The dish is also seen throughout Southeast Asia, particularly Indonesia and Malaysia where it is a culinary staple'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(
              // 20*2.5 = 50
              left: 50,
              right: 50,
              top: 10,
              bottom: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // GestureDetector(
                //   onTap: () {},
                //   child: Text(
                //     '\$$prize',
                //     style: const TextStyle(
                //       color: Color(0xFF332d2b),
                //       fontSize: 26,
                //     ),
                //   ),
                // ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      total = count++;
                      cart++;
                      // prize = prize * total;
                    });
                  },
                  child: const Icon(Icons.add_circle),
                  style: ElevatedButton.styleFrom(
                    elevation: 4,
                    primary: Colors.amberAccent,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(13),
                  ),
                ),
                Text(
                  '$count',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF89dad0),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (count <= 0 && cart < 0) {
                      count = 0;
                      cart = 0;
                      // prize = 12;
                    } else if (count > 1) {
                      setState(() {
                        count--;
                        cart--;
                        // prize = prize - 12;
                      });
                    }
                  },
                  child: const Icon(Icons.remove_circle),
                  style: ElevatedButton.styleFrom(
                    elevation: 4,
                    primary: Colors.amberAccent,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(13),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 120,
            padding: const EdgeInsets.only(
              top: 30,
              bottom: 30,
              left: 20,
              right: 20,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFFf7f6f4),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20 * 2),
                topRight: Radius.circular(20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                    color: Colors.white,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        test = false;
                      });
                    },
                    child: test
                        ? const Icon(Icons.favorite_outline,
                        color: Color(0xFF89dad0))
                        : const Icon(Icons.favorite, color: Color(0xFF89dad0)),
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
                    color: const Color(0xFF89dad0),
                  ),
                  child: const Text(
                    '\$10 | Add to cart',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ReadMoreText textWidget(String text) {
    final styleButton = TextStyle(
      fontSize: 14,
      color: Color(0xFF89dad0),
      fontWeight: FontWeight.bold,
    );

    return ReadMoreText(
      text,
      trimLines: 3,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Read More',
      trimExpandedText: 'Read Less',
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black54,
      ),
      lessStyle: styleButton,
      moreStyle: styleButton,
    );
  }

  ElevatedButton buttonMore() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 16,
        ),
      ),
      onPressed: () {
        setState(() {
          isReadMore = !isReadMore;
        });
      },
      child: Text(
        isReadMore ? 'Read Less' : 'Read More',
        style: TextStyle(color: Colors.blue[200], fontSize: 14),
      ),
    );
  }
}