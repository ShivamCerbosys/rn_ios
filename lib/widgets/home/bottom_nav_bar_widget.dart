import 'package:flutter/material.dart';
import 'package:ration_now/screens/stores_screen.dart';
import 'package:ration_now/screens/wishlist_screen.dart';
import 'package:ration_now/utils/utils.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key, required this.sentFrom});
  final String sentFrom;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 4,
      color: AppColors.neutralWhite,
      shadowColor: AppColors.neutralGrey,
      shape: const CircularNotchedRectangle(), // Shape of the notch
      notchMargin: 26,
      height: 80,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Navigate to StoresScreen or pop based on the sentFrom value
          GestureDetector(
            onTap: () {
              if (sentFrom == "home") {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const StoresScreen(),
                ));
              } else if (sentFrom == "wishlist") {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const StoresScreen(),
                ));
              } else {
                Navigator.of(context).pop();
              }
            },
            child: Image.asset(
              'assets/images/stores.png',
              fit: BoxFit.fill,
              height: 35,
            ),
          ),
          // IconButton for navigating to WishListScreen or pop based on the sentFrom value
          Container(
            margin: const EdgeInsets.only(left: 70),
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const RadialGradient(
                  center: Alignment.centerLeft,
                  radius: 1.0,
                  colors: <Color>[
                    Colors.pink,
                    Color.fromARGB(255, 251, 19, 19)
                  ],
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
              child: IconButton(
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 48,
                ),
                onPressed: () {
                  if (sentFrom == "home") {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const WishListScreen(),
                    ));
                  } else if (sentFrom == "store") {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const WishListScreen(),
                    ));
                  } else {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
