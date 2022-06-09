import 'package:flutter/material.dart';
import '../../../constant.dart';
import 'item_card.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          ItemCard(
              svgSrc: "assets/icons/burger_beer.svg",
              title: "Burger & Beer",
              shopName: "MacDonald's",
              press: () {},
              ),
          Container(
            width: 170,
            height: 195,
            margin:
                const EdgeInsets.only(left: 20, right: 15, top: 20, bottom: 20),
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
                onTap: () {},
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
            press: () {},
          ),
          Container(
            width: 170,
            height: 195,
            margin:
                const EdgeInsets.only(left: 20, right: 15, top: 20, bottom: 20),
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
                onTap: () {},
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
                      const Text('Burger & Potatoes'),
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
            margin:
                const EdgeInsets.only(left: 20, right: 15, top: 20, bottom: 20),
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
                onTap: () {},
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
                      const Text('Potatoes'),
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
            press: () {},
          ),
          ItemCard(
            svgSrc: "assets/icons/burger_beer.svg",
            title: "Burger & Beer",
            shopName: "MacDonald's",
            press: () {},
          ),
        ],
      ),
    );
  }
}
