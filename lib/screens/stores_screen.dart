import 'package:flutter/material.dart';
import 'package:ration_now/screens/cart_screen.dart';
import 'package:ration_now/widgets/home/appbar_widget.dart';
import 'package:ration_now/widgets/home/bottom_nav_bar_widget.dart';
import 'package:ration_now/widgets/home/drawer_widget.dart';
import 'package:ration_now/widgets/home/floatingab_widget.dart';
import 'package:ration_now/widgets/store/store_body.dart';

class StoresScreen extends StatefulWidget {
  const StoresScreen({super.key});

  @override
  State<StoresScreen> createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
  // Function to create a custom page route for navigation to CartScreen
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const CartScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Define animation parameters for the transition
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        // Create a tween animation for the slide transition
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        // Apply the slide transition to the child widget
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar widget for the screen
      appBar: const AppBarWidget(),
      // Drawer widget for the screen
      drawer: const DrawerWidget(),
      // Bottom Navigation Bar widget for the screen
      bottomNavigationBar: const BottomNavBarWidget(
        sentFrom: "store",
      ),
      // Allow the body to be extended below the bottom navigation bar
      extendBody: true,
      // Floating Action Button widget for navigating to CartScreen
      floatingActionButton: GestureDetector(
        onTap: () {
          // Navigate to CartScreen using the custom page route
          Navigator.of(context).push(_createRoute());
        },
        child: const FloatingAButton(),
      ),
      // Position of the floating action button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // Body of the screen
      body: const StoreBodyWidget(),
      // Avoid resizing the screen when the keyboard is shown
      resizeToAvoidBottomInset: false,
    );
  }
}
