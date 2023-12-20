import 'package:flutter/material.dart';

class StackCarouselItem extends StatelessWidget {
  final String backgroundImage;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  const StackCarouselItem({
    Key? key,
    required this.backgroundImage,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(
                    0.5), // Adjust the opacity for the desired darkness
                BlendMode.srcOver,
              ),
              child: Image.asset(
                backgroundImage,
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.darken,
                // opacity: A,
              ),
            ),
          ),
          // Text Widgets and Transparent Button with Border
          Positioned.fill(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text Widgets
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 42,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  // Transparent Button with Border
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: onPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: const BorderSide(
                            color: Colors.yellowAccent, width: 2),
                        elevation: 0.0,
                      ),
                      child: const Text(
                        'ADD PROMO',
                        style: TextStyle(color: Colors.yellowAccent),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
