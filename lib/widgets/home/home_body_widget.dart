import 'package:flutter/material.dart';
import 'package:ration_now/utils/utils.dart';
import 'package:ration_now/widgets/home/carousel/carousel_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.neutralGrey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.searchBarText,
                    prefixIcon: const Icon(Icons.search),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: AppColors
                        .neutralWhite, // White background for the TextField
                    contentPadding: const EdgeInsets.fromLTRB(12, 12, 48,
                        12), // Adjust padding to make space for the mic button
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      right:
                          0), // Slight margin to align the button inside the TextField
                  decoration: BoxDecoration(
                    color: Colors
                        .grey[200], // Slight grey background for mic button
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.mic,
                      color: AppColors.primaryGreen,
                    ),
                    onPressed: () {
                      // Implement microphone action
                    },
                  ),
                ),
              ],
            ),
          ),
          MyCarouselWithStack()
        ],
      ),
    );
  }
}
