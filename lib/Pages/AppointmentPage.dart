import 'package:flutter/material.dart';

class AppointmentPage extends StatefulWidget {
  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {
    // الحصول على البيانات المرسلة عبر arguments
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, String>?;

    // استخراج البيانات من arguments
    final doctorName = arguments?['doctorName']!;
    final speciality = arguments?['speciality']!;
    final selectedDate = arguments?['selectedDate']!;
    final selectedTime = arguments?['selectedTime']!;

    if (arguments == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text("حجز الموعد"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Text(
            'لا توجد بيانات لحجز الموعد!',
            style: TextStyle(fontSize: 18, color: Colors.red),
          ),
        ),
      );
    }


    return Scaffold(
      appBar: AppBar(
        title: Text("حجز الموعد"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "الطبيب: $doctorName",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "التخصص: $speciality",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              "التاريخ: $selectedDate",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              "الوقت: $selectedTime",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // يمكن إضافة منطق الحجز هنا
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('تم حجز الموعد بنجاح!')),
                );
              },
              child: Text("تأكيد الحجز"),
            ),
          ],
        ),
      ),
    );
  }
}
