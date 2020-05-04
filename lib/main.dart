import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:makeup_app/consts.dart';
import 'package:makeup_app/provider/product_provider.dart';
import 'package:makeup_app/screen/home_screen.dart';
import 'package:makeup_app/screen/product_list_screen.dart';
import 'package:makeup_app/screen/product_screen.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: ksubColor));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: kMainColor),
        home: MyHomePage(),
        routes: {
          ProductListScreen.ROUTE_NAME: (context) => ProductListScreen(),
          ProductScreen.ROUTE_NAME: (context) => ProductScreen(),
        },
      ),
    );
  }
}
