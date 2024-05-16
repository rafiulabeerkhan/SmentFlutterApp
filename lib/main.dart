import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sment/CRUD/addProduct.dart';
import 'package:sment/demobar.dart';

import 'package:sment/firebase_options.dart';
import 'package:sment/gradientContainer.dart';
import 'package:sment/homePage.dart';
import 'package:sment/loginPage.dart';
import 'package:sment/signupPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.brown),
      darkTheme: ThemeData(primarySwatch: Colors.lightGreen),
      debugShowCheckedModeBanner: false,
      routes: {
        "/login": (context) => const loginpage(),
        "/register": (context) => registerpage(),
        "/home": (context) => const HomeScreen(
              title: 'Home Screen',
            ),
        "/products": (context) => const MyHomePage(),
        // "/sidebar": (context) => CollapsingAppbarWithTabsPage(),
        "/hello": (context) => CollapsingAppbarWithTabsPage()
      },
      home: const SafeArea(
        child: Scaffold(
          body: loginpage(),
        ),
      ),
    );
  }
}
