import 'package:e_commerce/Widgets/loader.dart';
import 'package:e_commerce/screens/add_product_screen.dart';
import 'package:e_commerce/screens/product_list.dart';
import 'package:e_commerce/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return WelcomeScreen();
          } else
            return LoaderWidget(
              color: Colors.white,
            );
        },
      ),
      routes: {
        "/products": (context) => ProductScreen(),
        "/add": (context) => AddProductScreen(),
        // "/login": (context) => ProductScreen(),
        // "/register": (context) => ProductScreen(),
      },
    );
  }
}
