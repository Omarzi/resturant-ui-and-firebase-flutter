import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_app_with_fb/constant.dart';
import 'package:food_app_with_fb/popup/setting/setting.dart';
import 'package:food_app_with_fb/screens/posts/add_note.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                text: "Todos ",
                style: TextStyle(color: ksecondaryColor),
              ),
              // TextSpan(
              //   text: "Reviw or Post",
              //   style: TextStyle(color: kPrimaryColor),
              // ),
            ],
          ),
        ),
        actions: <Widget>[
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Rating for our Resturant $rating',
              style: TextStyle(fontSize: 30, color: kTextColor),
            ),
            const SizedBox(
              height: 32,
            ),
            buildRating(),
            const SizedBox(
              height: 32,
            ),
            TextButton(
                onPressed: () => showRating(),
                child: Text(
                  'ShowDialog',
                  style: TextStyle(fontSize: 32, color: Colors.blue[800]),
                ))
          ],
        ),
      ),
    );
  }

  Widget buildRating() {
    return RatingBar.builder(
      initialRating: rating,
      minRating: 1,
      itemSize: 35,
      itemPadding: EdgeInsets.symmetric(horizontal: 4),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      updateOnDrag: true,
      onRatingUpdate: (rating) {
        setState(() {
          this.rating = rating;
        });
      },
    );
  }

  void showRating() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Rate The Resturant App', style: TextStyle(color: kTextColor),),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Please leave a star rating.',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 32,
            ),
            buildRating(),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'OK',
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
