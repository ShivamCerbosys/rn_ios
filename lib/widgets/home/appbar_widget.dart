import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ration_now/provider/loca_provider.dart';
import 'package:ration_now/screens/notification_screen.dart';
import 'package:ration_now/utils/utils.dart';

class AppBarWidget extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  ConsumerState<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetState extends ConsumerState<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      backgroundColor: AppColors.neutralWhite,
      shadowColor: AppColors.neutralGrey,

      // AppBar configuration.
      leading: Builder(
        // Builder used to provide context for Scaffold.of.
        builder: (BuildContext context) {
          return IconButton(
            // Menu icon button to open the drawer.
            icon: const Icon(
              Icons.menu,
              color: AppColors.primaryRed,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
            // Opens the drawer.
          );
        },
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/rashanow2.png', // Logo or image asset.
            height: 25, // Image height.
          ),
          Text(
            ref
                .watch(locationStateProvider)
                .address, // Additional text, possibly an address.
            style: const TextStyle(
                fontSize: 14, color: AppColors.neutralGrey), // Text styling.
          )
        ],
      ),
      actions: [
        // Action buttons on the AppBar.
        IconButton(
          onPressed: () async {
            await ref.read(locationStateProvider.notifier).getCurrentLocation();
            // setState(() {
            //   _location = ref.watch(locationStateProvider).address;
            // });
          }, // Placeholder callback for location button.
          icon: const Icon(
            size: 28,
            Icons.my_location_outlined,
            color: AppColors.primaryGreen,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) {
                  return NotificationScreen();
                },
              ),
            );
          }, // Placeholder callback for notifications button.
          icon: const Icon(
            size: 28,
            Icons.notifications,
            color: AppColors.primaryGreen,
          ),
        ),
        IconButton(
          onPressed: () {}, // Placeholder callback for search button.
          icon: const Icon(
            size: 28,
            Icons.search,
            color: AppColors.primaryGreen,
          ),
        ),
      ],
    );
  }
}
