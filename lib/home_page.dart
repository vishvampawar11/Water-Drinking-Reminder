import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:reminder/add_reminder.dart';
import 'package:reminder/chart.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home-page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double drankWater = 0;

  void updateValue() {
    setState(() {
      drankWater += 0.3;
    });
  }

  FlutterLocalNotificationsPlugin localNotification;

  @override
  void initState() {
    super.initState();
    var androidInitialize =
        new AndroidInitializationSettings('@mipmap/ic_launcher');

    var iOSInitialize = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: androidInitialize, iOS: iOSInitialize);
    localNotification = new FlutterLocalNotificationsPlugin();
    localNotification.initialize(initializationSettings);
  }

  Future _showNotification() async {
    var androidDetails = new AndroidNotificationDetails(
      'channelId',
      "channelName",
      "channelDescription",
      importance: Importance.high,
    );
    var iosDetails = new IOSNotificationDetails();
    var generalNotificationDetails = new NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );
    await localNotification.show(
      0,
      'Water drinking Reminder',
      "The body of the notification",
      generalNotificationDetails,
    );
  }

  @override
  Widget build(BuildContext context) {
    final amount = ModalRoute.of(context).settings.arguments as int;
    final vol = amount / 33.814;

    return Container(
      width: double.infinity,
      color: Colors.blue.shade800,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: _showNotification,
              child: Icon(
                Icons.alarm_add_outlined,
                color: Colors.blue.shade800,
                size: 32,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Text(
              'Add Reminder',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 90),
          Chart(drankWater, vol),
          SizedBox(
            width: 210,
            height: 55,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              onPressed: updateValue,
              child: Text(
                '+ DRINK (300 ml)',
                style: TextStyle(
                  color: Colors.blue.shade900,
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
