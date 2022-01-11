import 'package:flutter/material.dart';

class AddReminder extends StatelessWidget {
  static const routeName = '/add_reminder';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Reminder'),
      ),
      body: Center(
        child: Text('Add Reminder'),
      ),
    );
  }
}
