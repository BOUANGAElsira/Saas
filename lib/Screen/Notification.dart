import 'package:flutter/material.dart';
import 'package:notice_2_parents/Screen/NotificationService.dart';
import 'package:notice_2_parents/Screen/NotificationSetting.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<String> notifications = [];

  void addNotification(String notification) {
    setState(() {
      notifications.add(notification);
      print("Added notification: $notification");
    });
  }

  NotificationService notificationService = NotificationService();

  void refreshNotifications() {
    addNotification("New grade report");
  }

  @override
  Widget build(BuildContext context) {
    print("Rebuilding widget with ${notifications.length} notifications");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('Notifications'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: openNotificationSettings,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notifications[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown,
        onPressed: refreshNotifications,
        child: Icon(Icons.refresh),
      ),
    );
  }

  void openNotificationSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NotificationSettingsForm()),
    );
  }
}
