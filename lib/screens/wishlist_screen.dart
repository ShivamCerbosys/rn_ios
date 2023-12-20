import 'package:flutter/material.dart';
import 'package:ration_now/screens/cart_screen.dart';
import 'package:ration_now/widgets/home/bottom_nav_bar_widget.dart';

// Custom drawer widget import.
import 'package:ration_now/widgets/home/drawer_widget.dart';
import 'package:ration_now/widgets/home/floatingab_widget.dart';
import 'package:ration_now/widgets/wishlist/wishlist_appbar.dart';
import 'package:ration_now/widgets/wishlist/wishlist_body.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key}); // Constructor with optional key.

  @override
  State<WishListScreen> createState() =>
      _WishListScreenState(); // State creation.
}

class _WishListScreenState extends State<WishListScreen> {
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
      appBar: const WishListAppBar(),
      drawer: const DrawerWidget(),
      bottomNavigationBar: const BottomNavBarWidget(
        sentFrom: "wishlist",
      ),
      extendBody: true,
      floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.of(context).push(_createRoute());
          },
          child: const FloatingAButton()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: const WishListBody(),
      resizeToAvoidBottomInset: false,
    );
  }
}
