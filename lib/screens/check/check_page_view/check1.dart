import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app_with_fb/constant.dart';

class Check1 extends StatefulWidget {
  const Check1({Key? key}) : super(key: key);

  @override
  State<Check1> createState() => _Check1State();
}

class _Check1State extends State<Check1> {
  @override
  Widget build(BuildContext context) {
    int count = 1;
  int total = 0;
  int cart = 1;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFFFC61F),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: RichText(
          text: const TextSpan(
            style: TextStyle(fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: "My ",
                style: TextStyle(color: ksecondaryColor, fontSize: 18),
              ),
              TextSpan(
                text: " Cart",
                style: TextStyle(color: kPrimaryColor, fontSize: 18),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: kTextColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body:Stack(
        children: [
          ListView.builder(
              itemCount: 1,
              padding: const EdgeInsets.symmetric(vertical: 14),
              itemBuilder: (context, index) => Container(
                height: 100,
                width: 100,
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage('assets/images/beyond-meat-mcdonalds.png', ),
                        )
                        ),
                      ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Burger & Beer',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Expanded(child: Text('Description')),
                        Text('\$10', style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                    const Spacer(),
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
                    padding: const EdgeInsets.all(8),
                  ),
                ),
                Text(
                  '$count',
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
                    padding: EdgeInsets.all(8),
                  ),
                ),
                  ],
                ),
              ),
            ),
          _buildBottom(),
        ],
      ),


      // Stack(
      //   children: [
      //    // Container(),
      //     SingleChildScrollView(
      //       child: ListView.builder(
      //         shrinkWrap: true,
      //         // itemCount: 5,
      //         padding: EdgeInsets.all(16),
      //         itemBuilder: (context, index) => Container(
      //           height: 100,
      //           width: 100,
      //           margin: EdgeInsets.all(4.0),
      //           child: Row(
      //             children: [
      //               Container(
      //                 width: 100,
      //                 color: Colors.blue[800],
      //               ),
      //               const SizedBox(
      //                 width: 16,
      //               ),
      //               Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: const [
      //                   Text(
      //                     'Title',
      //                     style: TextStyle(fontWeight: FontWeight.bold),
      //                   ),
      //                   Expanded(child: Text('Description')),
      //                   Text('\$10', style: TextStyle(fontWeight: FontWeight.bold),),
      //                 ],
      //               ),
      //               Spacer(),
      //               ElevatedButton(
      //                 onPressed: () {},
      //                 child: const Icon(Icons.add_circle),
      //                 style: ElevatedButton.styleFrom(
      //                   elevation: 4,
      //                   primary: Colors.amberAccent,
      //                   shape: const CircleBorder(),
      //                   padding: const EdgeInsets.all(10),
      //                 ),
      //               ),
      //               const Text('3'),
      //               ElevatedButton(
      //                 onPressed: () {},
      //                 child: const Icon(Icons.remove_circle),
      //                 style: ElevatedButton.styleFrom(
      //                   elevation: 4,
      //                   primary: Colors.amberAccent,
      //                   shape: CircleBorder(),
      //                   padding: EdgeInsets.all(10),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //     _buildBottom(),
      //   ],
      // ),
    );
  }

  Positioned _buildBottom() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, bottom: 8.0, top: 4.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Subtotal',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      '\$10',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    Text(
                      'Subtotal does not include shipping',
                      style: TextStyle(color: Colors.grey, fontSize: 12.0),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      primary: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: const BorderSide(
                            color: Colors.black38,
                          )),
                    ),
                    onPressed: () {},
                    child: const Text('Check out'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 16,
                      ),
                      primary: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: const BorderSide(
                            color: Colors.black38,
                          )),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Check out with ',
                          style: TextStyle(color: kTextColor),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Container(
                          width: 60,
                          height: 20,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    'https://fatora.io/wp-content/uploads/2020/12/%D8%A8%D9%8A%D8%A8%D8%A7%D9%84-paypal-3.png'),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Text('Continue shopping',
                style: TextStyle(color: kTextColor)),
          ],
        ),
      ),
    );
  }
}