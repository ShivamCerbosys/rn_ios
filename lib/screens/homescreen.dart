import 'package:flutter/material.dart';
import 'package:ration_now/screens/cart_screen.dart';
// import 'package:ration_now/screens/notification_screen.dart';

import 'package:ration_now/widgets/home/appbar_widget.dart';
import 'package:ration_now/widgets/home/bottom_nav_bar_widget.dart';

// Custom drawer widget import.
import 'package:ration_now/widgets/home/drawer_widget.dart';

import 'package:ration_now/widgets/home/floatingab_widget.dart';
import 'package:ration_now/widgets/home/home_body_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key}); // Constructor with optional key.

  @override
  State<HomeScreen> createState() => _HomeScreenState(); // State creation.
}

class _HomeScreenState extends State<HomeScreen> {
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const CartScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Main build method for the HomeScreen.
    return Scaffold(
      // backgroundColor: Colors.amber,
      appBar: const AppBarWidget(),
      drawer: const DrawerWidget(),
      bottomNavigationBar: const BottomNavBarWidget(
        sentFrom: "home",
      ),
      extendBody: true,
      floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.of(context).push(_createRoute());
          },
          child: const FloatingAButton()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: const HomeBody(),
      resizeToAvoidBottomInset: false,
    );
  }
}
