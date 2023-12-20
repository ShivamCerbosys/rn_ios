import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ration_now/provider/lang_provider.dart';
import 'package:ration_now/screens/homescreen.dart';
import 'package:ration_now/screens/login_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

// MyApp is a ConsumerWidget, which means it can read providers.
class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  // Creating an instance of MyAppNavigatorObserver for navigation tracking.
  final isUserLoggedIn = true;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Read the current locale using watch from the Riverpod provider.
    final currentLocale = ref.watch(langChangeProvider);

    return MaterialApp(
      // Configure localization delegates for internationalization.
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      // Specify the supported locales for the app.
      supportedLocales: const [
        Locale("en"),
        Locale("hi"),
      ],

      // Set the current locale based on Riverpod provider.
      locale: currentLocale,
      debugShowCheckedModeBanner: false,
      title: 'Rashan Now',
      // Define the app theme.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Set the initial screen to LoginScreen.
      home: isUserLoggedIn ? const HomeScreen() : const LoginScreen(),
    );
  }
}
