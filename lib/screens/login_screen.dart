import 'package:flutter/material.dart';
import 'package:ration_now/screens/otp_screen.dart';
import 'package:ration_now/utils/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _numberController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  var _isFocused = false;

  // Method to handle tap events outside the TextField to lose focus.
  void handleTap() {
    FocusScope.of(context).unfocus();
  }

  // Method to handle 'CONTINUE' button click, navigating to OtpScreen.
  void onClickContinue() {
    final phoneNumber = _numberController.text.trim();
    if (phoneNumber.length < 10) {
      // Show a Snackbar if the entered phone number is less than 10 digits.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.mobileSnackbar,
          ),
        ),
      );
    } else {
      // Navigate to the OTP screen only if the phone number is valid.
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => OtpScreen(
            number: phoneNumber,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    // Dispose the FocusNode when the widget is removed from the widget tree.
    _focusNode.dispose();
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Main content of the screen, structured in a column.
    Widget content = Column(
      children: [
        // Displaying 'Phone' label.
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                AppLocalizations.of(context)!.phoneText,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        // TextField for phone number input.
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Focus(
            onFocusChange: (hasFocus) {
              setState(() => _isFocused = hasFocus);
            },
            child: TextField(
              maxLength: 10,
              controller: _numberController,
              focusNode: _focusNode,
              // Decoration changes based on focus state.
              decoration: _isFocused
                  ? InputDecoration(
                      counterText: '',
                      prefixText: '+91  ',
                      labelText: AppLocalizations.of(context)!.enterPhoneText,
                      border: const OutlineInputBorder(),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 20),
                    )
                  : InputDecoration(
                      counterText: '',
                      label: Row(
                        children: [
                          const Text("+91"),
                          const SizedBox(width: 10),
                          Text(AppLocalizations.of(context)!.enterPhoneText),
                        ],
                      ),
                      border: const OutlineInputBorder(),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      prefix: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('+91 ', style: TextStyle(fontSize: 16))
                        ],
                      ),
                    ),
              keyboardType: TextInputType.phone,
            ),
          ),
        ),
        const SizedBox(height: 150),
      ],
    );

    // Building the main Scaffold of the login screen.
    return GestureDetector(
      onTap: handleTap,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  // Welcome text.
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(
                      AppLocalizations.of(context)!.welcomeText,
                      style: const TextStyle(
                          color: AppColors.primaryGreen, fontSize: 28),
                    ),
                  ),
                  // Placeholder images, assumed to be logos or relevant graphics.
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

                  // Content containing the TextField and other widgets.
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
                            color: AppColors.neutralWhite, fontSize: 20),
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
    );
  }
}
