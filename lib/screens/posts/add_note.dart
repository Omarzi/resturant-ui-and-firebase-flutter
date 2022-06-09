import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:food_app_with_fb/constant.dart';
import 'package:food_app_with_fb/popup/setting/setting.dart';
import 'package:food_app_with_fb/screens/posts/posts.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  TextEditingController second = TextEditingController();

  TextEditingController third = TextEditingController();

  final fb = FirebaseDatabase.instance;
  @override
  Widget build(BuildContext context) {
    var rng = Random();
    var k = rng.nextInt(10000);

    final ref = fb.ref().child('todos/$k');

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
                text: "Add ",
                style: TextStyle(color: ksecondaryColor),
              ),
              TextSpan(
                text: "Reviw or Post",
                style: TextStyle(color: kPrimaryColor),
              ),
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
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextFormField(
                controller: second,
                decoration: const InputDecoration(
                  hintText: 'title',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextFormField(
                controller: third,
                decoration: const InputDecoration(
                  hintText: 'sub  title',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              color: Colors.indigo[900],
              onPressed: () {
                ref.set({
                  'title': second.text,
                  'subtitle': third.text,
                });
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Posts()));
              },
              child: const Text(
                'save',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
