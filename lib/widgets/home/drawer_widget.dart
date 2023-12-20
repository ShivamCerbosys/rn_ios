import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ration_now/provider/lang_provider.dart';

import 'package:ration_now/screens/aboutus_screen.dart';
import 'package:ration_now/screens/login_screen.dart';
import 'package:ration_now/screens/myaddress_screen.dart';
import 'package:ration_now/screens/myorder_screen.dart';
import 'package:ration_now/screens/settings_screen.dart';
import 'package:ration_now/utils/utils.dart';
import 'package:ration_now/widgets/home/listtile_widget.dart'; // Import custom ListTile widget.

class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(langChangeProvider);
    return Drawer(
      // The Drawer widget provides a slide-in menu.
      child: ListView(
        // ListView to hold all the items in the drawer.
        children: <Widget>[
          Padding(
            // Padding for the top section of the drawer.
            padding: const EdgeInsets.all(16.0),
            child: Row(
              // Row to layout images horizontally.
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/rashannow.png', // First image/logo.
                  height: 40,
                  width: 40,
                ),
                Image.asset(
                  'assets/images/rashanow2.png', // Second image/logo.
                  height: 40,
                  width: 150,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10, // Spacing between top images and next item.
          ),
          const ListTile(
            visualDensity: VisualDensity(vertical: -4),
            leading: Text(
              'Kristen Stewert', // User name display.
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
          const ListTile(
            // ListTile for displaying user contact number.
            visualDensity: VisualDensity(vertical: -4),
            leading: Text(
              '888-444-6009', // User contact display.
              style: TextStyle(fontSize: 16),
            ),
          ),
          // Custom ListTile widgets for various drawer options.
          ListTileWidget(
            onTap: () {
              Navigator.of(context).pop();
            },
            icon: Icons.home,
            title: AppLocalizations.of(context)!.homeText,
          ),
          ListTileWidget(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const MyOrdersScreen(),
                ),
              );
            },
            icon: Icons.shopping_cart,
            title: AppLocalizations.of(context)!.orderText,
          ),
          ListTileWidget(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const MyAddressScreen(),
                ),
              );
            },
            icon: Icons.location_on,
            title: AppLocalizations.of(context)!.addressText,
          ),
          ListTileWidget(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const SettingScreen(),
                ),
              );
            },
            icon: Icons.settings,
            title: AppLocalizations.of(context)!.settingText,
          ),
          ListTileWidget(
            icon: Icons.share,
            title: AppLocalizations.of(context)!.shareText,
          ),
          ListTileWidget(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const AboutUsScreen(),
                ),
              );
            },
            icon: Icons.info,
            title: AppLocalizations.of(context)!.aboutText,
          ),
          ListTileWidget(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const LoginScreen(),
                ),
              );
            },
            icon: Icons.power_settings_new_outlined,
            title: AppLocalizations.of(context)!.logoutText,
          ),
          const Divider(
            // Divider to visually separate content sections.
            height: 3,
            color: AppColors.neutralBlack,
          ),
          ListTile(
            // ListTile for the 'Language' label.
            visualDensity: const VisualDensity(vertical: -4),
            title: Text(
              AppLocalizations.of(context)!.languageText, // Language display.
              style:
                  const TextStyle(color: AppColors.neutralGrey, fontSize: 18),
            ),
          ),
          ListTileWidget(
            icon: Icons.g_translate,
            title: currentLocale == const Locale("en")
                ? AppLabels.hindiText
                : "English",
            onTap: () {
              ref.read(langChangeProvider.notifier).changeLang();
            },
          ), // ListTile for language selection.
        ],
      ),
    );
  }
}
