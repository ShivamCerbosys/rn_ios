import 'package:flutter/material.dart';

// Class for defining custom colors used in the app
class AppColors {
  // Primary colors
  static const Color primaryGreen = Color.fromARGB(255, 48, 134, 52);
  static const Color primaryRed = Color.fromARGB(255, 198, 40, 40);

  // Neutral Colors
  static const Color neutralWhite = Color.fromARGB(255, 255, 255, 255);
  static const Color neutralGrey = Color.fromARGB(255, 102, 100, 100);
  static const Color neutralBlack400 = Color.fromARGB(96, 24, 23, 23);
  static const Color neutralBlack = Color.fromARGB(255, 0, 0, 0);
}

// Class for defining constant labels used in the app
class AppLabels {
  // Primary labels
  static const welcomeText = 'Welcome';
  static const phoneText = 'Phone';
  static const otpText = 'OTP';
  static const footerText =
      'By continuing, you agree to accept our Privacy Policy & Terms of Service';
  static const notificationText = 'Notifications';

  //TEXTFEILD TEXTS
  static const searchBarText = 'Search for products, brands';
  static const enterPhoneText = 'Enter Mobile No.';
  static const enterOTPText = 'Enter OTP';
  //SnackBart Text

  static const otpSnackbar = 'Please enter a valid OTP.';
  static const mobileSnackbar =
      'Please enter a valid phone number with at least 10 digits.';

  // Button labels
  static const continueButtonText = 'CONTINUE';
  static const editButtonText = 'Edit';

  // Drawer Labels
  static const logoutText = 'Logout';
  static const homeText = 'Home';
  static const orderText = 'My Orders';
  static const addressText = 'My Address';
  static const languageText = 'Language';
  static const aboutText = 'About Us';
  static const shareText = 'Share the App';
  static const settingText = 'Settings';

  // Change Language label
  static const hindiText = 'हिंदी';
}

// Note: Consider using an enum for language options if there are multiple languages.
