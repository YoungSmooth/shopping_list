import 'package:flutter/material.dart';

import 'shopping_cart/shoppingListHome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      // A widget which will be started on application startup
      debugShowCheckedModeBanner: false,
      home: const ShoppingListHome(),
    );
  }
}
