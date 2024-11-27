import 'package:flutter/material.dart';
import 'package:booky_appointment/Pages/ViewAllDoctor.dart';

class AllAppointments extends StatefulWidget {
  final Map<String, String> newAppointment;

  AllAppointments({required this.newAppointment});

  @override
  _AllAppointmentsState createState() => _AllAppointmentsState();
}

class _AllAppointmentsState extends State<AllAppointments> {
  // قائمة مواعيد الحجز
  List<Map<String, String>> appointments = [];

  @override
  void initState() {
    super.initState();
    // إضافة الموعد الذي وصل من DoctorDetailPage إلى القائمة
    appointments.add(widget.newAppointment);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('جميع المواعيد'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // قائمة المواعيد
          Expanded(
            child: ListView.builder(
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final appointment = appointments[index];
                return ListTile(
                  title: Text("د. ${appointment['doctorName']}"),
                  subtitle: Text(
                      "${appointment['day']} - ${appointment['time']}"),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(appointment['image'] ?? 'assets/default_image.png'),  // تأكد من وجود صورة افتراضية
                  ),
                );
              },
            ),
          ),
          // زر الرجوع إلى صفحة AllDoctors
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewAllDoctor(initialCategory: ""), // قم هنا بتمرير الصفحة التي تريد الانتقال إليها
                ),
              );
            },
            child: Text('الذهاب إلى قائمة الأطباء'),
          ),
        ],
      ),
    );
  }
}
