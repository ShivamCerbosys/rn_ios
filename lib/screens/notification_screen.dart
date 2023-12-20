import 'package:flutter/material.dart';
// import 'package:ration_now/utils/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationScreen extends StatelessWidget {
  final List<String> notifications = [
    'Notification 1',
    'Notification 2',
    'Notification 3',
    'Notification 4',
    'Notification 5',
    // Add more notifications as needed
  ];
  NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.notificationText),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notifications[index]),
            subtitle: const Text('Tap to view details'),
            onTap: () {
              // Handle tap on a notification (e.g., navigate to details screen)
              _showNotificationDetails(context, notifications[index]);
            },
          );
        },
      ),
    );
  }
}

void _showNotificationDetails(BuildContext context, String notification) {
  // Replace this with your logic to show details screen or perform an action
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Notification Details'),
        content: Text(notification),
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
