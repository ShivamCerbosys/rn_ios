import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ration_now/dummy_data/dummy_order.dart';
import 'package:ration_now/models/order.dart';
import 'package:ration_now/utils/utils.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 210, 223),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.primaryGreen,
            )),
        shadowColor: Colors.black,
        elevation: 5,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(
          AppLocalizations.of(context)!.orderText,
          style: const TextStyle(color: AppColors.primaryGreen, fontSize: 24),
        ),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _showOrderDetails(context, orders[index]);
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 6, 24, 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.neutralGrey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                children: [
                  Row(
                    children: [Text("#${orders[index].id}")],
                  ),
                  Row(
                    children: [
                      const Text(
                        "218 Items",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Text(
                        "${orders[index].total} /-",
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Spacer(),
                      Text(
                        "OID-0025532",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("time...."),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(orders[index].date),
                      const Spacer(),
                      const Text("full fill from 6 vendors"),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showOrderDetails(BuildContext context, Order order) {
    // Replace this with your logic to show order details screen or perform an action
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Order Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Order ID: ${order.id}'),
              Text('Date: ${order.date}'),
              Text('Total: \$${order.total.toString()}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
