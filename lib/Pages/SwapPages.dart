import 'package:booky_appointment/Pages/AppointmentPage.dart';
import 'package:booky_appointment/Pages/ViewAllAppointment.dart';
import 'package:flutter/material.dart';
import 'Home.dart';
import 'Notification.dart';
import 'ViewAllDoctor.dart';

class MainPage extends StatefulWidget {
  final List<Map<String, dynamic>> appointments;

  // التعيين الافتراضي للقائمة إن لم تكن هناك مواعيد مبدئية
  MainPage({this.appointments = const []});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  String? userName;
  String? userEmail;
  String? image;
  String? doctorName;
  String? speciality;
  String? doctorImage;
  DateTime? dateTime;
  List<Map<String, dynamic>> appointments = [
    {
      'doctorName': 'الدكتور علي',
      'speciality': 'طب الأطفال',
      'dateTime': DateTime(2024, 11, 27, 10, 30),  // مثال لتاريخ ووقت كـ DateTime
      'image': 'assets/doctor1.jpg',
    },
  ];// يجب أن يكون هذا من النوع DateTime

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // استلام البيانات من LoginPage
    final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;  // تعديل النوع هنا
    if (arguments != null) {
      userName = arguments['name'];
      userEmail = arguments['email'];
      doctorName = arguments['doctorName'];
      speciality = arguments['speciality'];
      doctorImage = arguments['doctorImage'];  // تعديل المفتاح هنا ليتوافق مع الأسماء المرسلة
      dateTime = arguments['dateTime'] as DateTime?;  // تأكد من تحويل التاريخ إلى DateTime
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      Home(userName: userName, userEmail: userEmail, image: image), // تمرير البيانات إلى Home
      NotificationPage(),
      AllAppointments(newAppointment: {})
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'المواعيد'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'الأطباء'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
