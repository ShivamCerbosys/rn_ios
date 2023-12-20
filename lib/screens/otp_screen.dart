// Importing necessary Flutter material components.
import 'dart:async';
import 'package:flutter/material.dart';
// Importing the HomeScreen to navigate after successful OTP verification.
import 'package:ration_now/screens/homescreen.dart';

import 'package:ration_now/utils/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Defining OtpScreen as a StatefulWidget to handle dynamic changes.
class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
    required this.number,
  });
  final String number;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

// State class for OtpScreen.
class _OtpScreenState extends State<OtpScreen> {
  final _otpController = TextEditingController();
  // Variables to manage the countdown timer for OTP.
  int minutes = 4;
  int seconds = 0;
  late Timer timer;

  // Method to handle tap events outside the TextField to lose focus.
  void handleTap() {
    FocusScope.of(context).unfocus();
  }

  // Method to handle 'CONTINUE' button click, navigating to HomeScreen.
  void onClickContinue() {
    final otp = _otpController.text.trim();
    if (otp.length < 6) {
      // Show a Snackbar if the entered phone number is less than 10 digits.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.otpSnackbar),
        ),
      );
    } else {
      timer.cancel();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const HomeScreen(),
        ),
      );
    }
  }

  // Method to navigate back to the previous screen.
  void onClickEdit() {
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    // Setting up a periodic timer to update the countdown every second.
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else if (minutes > 0) {
          minutes--;
          seconds = 59;
        } else {
          // Cancel the timer when countdown reaches zero.
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    // Cancel the timer to avoid memory leaks.
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Main content of the screen, structured in a column.
    Widget content = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Text(
            AppLocalizations.of(context)!.otpText,
            style: const TextStyle(fontSize: 20),
          ),
          // TextField for OTP input.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: 250,
              child: TextField(
                maxLength: 6,
                controller: _otpController,
                decoration: InputDecoration(
                  counterText: '',
                  labelText: AppLocalizations.of(context)!.enterOTPText,
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
            ),
          ),
          // Displaying the countdown timer.
          Text(
            'wait for $minutes:${seconds < 10 ? '0$seconds' : '$seconds'} minutes',
            style: const TextStyle(fontSize: 14),
          ),
          // Row to display the phone number and 'Edit' button.
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.number,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              TextButton(
                onPressed: onClickEdit,
                child: Text(
                  AppLocalizations.of(context)!.editButtonText,
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
        ],
      ),
    );

    // Building the main Scaffold of the OTP screen.
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: handleTap,
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    // Welcome text and placeholder images.
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        AppLocalizations.of(context)!.welcomeText,
                        style: const TextStyle(
                          color: AppColors.primaryGreen,
                          fontSize: 28,
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/rashannow.png',
                      height: 200,
                      width: 200,
                    ),
                    const SizedBox(height: 12),
                    Image.asset(
                      'assets/images/rashanow2.png',
                      height: 40,
                      width: 250,
                    ),
                    // Adding the main content.
                    content,
                    // 'CONTINUE' button.
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: TextButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(AppColors.primaryGreen),
                          shape: MaterialStatePropertyAll(
                            ContinuousRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        onPressed: onClickContinue,
                        child: Text(
                          AppLocalizations.of(context)!.continueButtonText,
                          style: const TextStyle(
                            fontSize: 20,
                            color: AppColors.neutralWhite,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Footer text regarding privacy policy and terms of service.
                    SizedBox(
                      width: 250,
                      child: Text(
                        AppLocalizations.of(context)!.footerText,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
