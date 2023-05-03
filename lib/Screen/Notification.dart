import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:notice_2_parents/Screen/NotificationService.dart';
import 'package:notice_2_parents/Screen/NotificationSetting.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  int notificationCount = 0;


  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  List<String> notifications = [];

  void addNotification(String notification) {
  setState(() {
    notifications.add(notification);
    notificationCount = notifications.length;
    print("Added notification: $notification");
  });
}


  NotificationService notificationService = NotificationService();
  void newNoteNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'basic_chanel',
        title: 'Nouvelle absence',
        body: 'Une nouvelle absence a été enregistrée',
      ),
    );
    addNotification("Nouvelle note");
  }

  void newEvaluationNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 2,
        channelKey: 'basic_chanel',
        title: 'Nouvelle remise de notes',
        body: 'Une nouvelle note est disponible',
      ),
    );
    addNotification("Nouvelle évaluation");
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: newNoteNotification,
              child: Text('Remise note'),
            ),
            ElevatedButton(
              onPressed: newEvaluationNotification,
              child: Text('Nouvelle évaluation'),
            ),
          ],
        ),
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

