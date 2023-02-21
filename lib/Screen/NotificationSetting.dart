import 'package:flutter/material.dart';

// Créer un formulaire pour les paramètres de notification
class NotificationSettingsForm extends StatefulWidget {
  @override
  _NotificationSettingsFormState createState() => _NotificationSettingsFormState();
}

class _NotificationSettingsFormState extends State<NotificationSettingsForm> {
  bool _homeworkNotifications = false;
  bool _absenceNotifications = false;
  bool _eventNotifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('Paramètres de notification'),
      ),
      body: Form(
        child: Column(
          children: [
            SwitchListTile(
              title: Text('Notifications de devoirs'),
              activeColor: Colors.brown,
              value: _homeworkNotifications,
              onChanged: (value) {
                setState(() {
                  _homeworkNotifications = value;
                });
              },
            ),
            SwitchListTile(
              activeColor: Colors.brown,
              title: Text('Notifications d\'absence'),
              value: _absenceNotifications,
              onChanged: (value) {
                setState(() {
                  _absenceNotifications = value;
                });
              },
            ),
            SwitchListTile(
              activeColor: Colors.brown,
              title: Text('Notifications d\'événement'),
              value: _eventNotifications,
              onChanged: (value) {
                setState(() {
                  _eventNotifications = value;
                });
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.brown, // Fond de couleur marron
                onPrimary: Colors.white, // Texte de couleur blanche
              ),
              onPressed: () {
                // Enregistrer les paramètres de notification dans la base de données ou le stockage local
                // et afficher un message de confirmation
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Paramètres de notification enregistrés.'),
                  ),
                );
              },
              child: Text('Enregistrer'),
            ),
          ],
        ),
      ),
    );
  }
}
