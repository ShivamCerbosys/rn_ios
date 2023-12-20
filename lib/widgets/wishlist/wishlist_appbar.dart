import 'package:flutter/material.dart';
import 'package:ration_now/screens/notification_screen.dart';
import 'package:ration_now/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ration_now/provider/loca_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WishListAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const WishListAppBar({super.key});

  @override
  ConsumerState<WishListAppBar> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetState extends ConsumerState<WishListAppBar> {
  // var _location = "your address";

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
          Text(
            AppLocalizations.of(context)!.wishListText,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.w900, color: Colors.black),
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
