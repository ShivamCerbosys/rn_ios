import 'package:flutter/material.dart';
import 'package:ration_now/dummy_data/dummy_stores.dart';
import 'package:ration_now/utils/utils.dart';

class StoreBodyWidget extends StatelessWidget {
  const StoreBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: stores.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // _showOrderDetails(context, orders[index]);
          },
          child: SingleChildScrollView(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    stores[index].image,
                    height: 70,
                    width: 70,
                  ),
                ),
                const SizedBox(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stores[index].name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w900),
                    ),
                    Text(
                      stores[index].address,
                      style: const TextStyle(
                          fontSize: 14, color: AppColors.neutralGrey),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
