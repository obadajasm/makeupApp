import 'package:flutter/material.dart';
import 'package:makeup_app/widgets/cat_widget.dart';

import '../consts.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: deviceWidth,
          height: deviceHeight,
          color: kMainColor,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15.0, top: 30, bottom: 15),
                    child: Text(
                      "TAKE A JOURNEY\n WITH YOUR \n  BEAUTY",
                      style: kTextStyleBig,
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                CatWidget(
                  deviceHeight: deviceHeight,
                  deviceWidth: deviceWidth,
                  text: "Browse by your need",
                ),
                SizedBox(
                  height: deviceHeight * 0.03,
                ),
                CatWidget(
                  text: 'Find  your favorite brand',
                  deviceHeight: deviceHeight,
                  deviceWidth: deviceWidth,
                  isImage: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
