import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<Map<String, dynamic>> notifications = [
    {
      'id': 1,
      'text':
          'اقترب وقت موعدك لدى د. عمار بن سلمان\nيوم السبت 3/12 الساعة 7:30 مساءً',
      'color': Colors.blue
    },
    {
      'id': 2,
      'text':
          'اقترب وقت موعدك لدى د. عمار بن سلمان\nيوم السبت 3/12 الساعة 7:30 مساءً',
      'color': Colors.blue
    },
    {
      'id': 3,
      'text':
          'اقترب وقت موعدك لدى د. عمار بن سلمان\nيوم السبت 3/12 الساعة 7:30 مساءً',
      'color': Colors.blue
    },
    {
      'id': 4,
      'text':
          'اقترب وقت موعدك لدى د. عمار بن سلمان\nيوم السبت 3/12 الساعة 7:30 مساءً',
      'color': Colors.blue
    },
  ];
  List<Map<String, dynamic>> rednotifications = [
    {
      'id': 1,
      'text':
          'اقترب وقت موعدك لدى د. عمار بن سلمان\nيوم السبت 3/12 الساعة 7:30 مساءً',
      'color': Colors.blue
    },
    {
      'id': 2,
      'text':
          'اقترب وقت موعدك لدى د. عمار بن سلمان\nيوم السبت 3/12 الساعة 7:30 مساءً',
      'color': Colors.blue
    },
  ];

  void deleteNotification(int id) {
    setState(() {
      notifications.removeWhere((notification) => notification['id'] == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'التنبيهات',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "غير مقروءة",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Dismissible(
                  key: Key(notification['id'].toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    deleteNotification(notification['id']);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('تم حذف التنبيه'),
                      ),
                    );
                  },
                  background: Container(
                    color: Colors.blue,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationDetailsPage(
                            notificationText: notification['text'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border:
                            Border.all(color: notification['color'], width: 2),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: notification['color'],
                            child: Icon(Icons.group, color: Colors.white),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              notification['text'],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // SizedBox.fromSize(100),

          ///
          ///
          ///المقروءة
          ///
          ///
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "مقروءة",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: rednotifications.length,
              itemBuilder: (context, index) {
                final rednotifications = notifications[index];
                return Dismissible(
                  key: Key(rednotifications['id'].toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    deleteNotification(rednotifications['id']);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('تم حذف التنبيه'),
                      ),
                    );
                  },
                  background: Container(
                    color: Colors.grey,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationDetailsPage(
                            notificationText: rednotifications['text'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            color: rednotifications['color'], width: 2),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: rednotifications['color'],
                            child: Icon(Icons.group, color: Colors.white),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              rednotifications['text'],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationDetailsPage extends StatelessWidget {
  final String notificationText;

  NotificationDetailsPage({required this.notificationText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'تفاصيل التنبيه',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'التفاصيل',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              notificationText,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 16),
            Text(
              'يرجى الحضور قبل الموعد بـ 15 دقيقة للتأكد من الاستعداد.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
