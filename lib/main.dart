import 'package:booky_appointment/Pages/Home.dart';
import 'package:booky_appointment/Pages/Login.dart';
import 'package:booky_appointment/Pages/Singup.dart';
import 'package:booky_appointment/Pages/SwapPages.dart';
import 'package:booky_appointment/Pages/ViewAllDoctor.dart';
import 'package:flutter/material.dart';
import 'package:booky_appointment/Pages/Welcome.dart';

import 'Pages/Appointment.dart';
import 'Pages/AppointmentPage.dart';
import 'Pages/DoctorDetailPage.dart';
import 'Pages/InfoDoctor.dart';
import 'Pages/Notification.dart';
import 'Pages/ViewAllAppointment.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Cairo"),
      initialRoute: "/Welcome",
      routes: {
        // '/': (context) => MainPage(),
        '/Welcome': (context) => Welcome(),
        '/nn': (context) => NotificationPage(),
        '/ViewAllAppointments': (context) => AllAppointments(newAppointment: {}),
        '/mainpage': (context) => MainPage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/ini': (context) => ViewAllDoctor(initialCategory: "عظام"),
        '/viewww': (context) => InfoDoctor(doctorName: 'awadh', speciality: "جراحي قلب", rating: "4.1", image: 'assets/images/dr_2.png', description: ' newk asdkf fsadkfa asdfad',),

        '/home': (context) => Home(),
        '/appointmenes': (context) => DoctorDetailPage(doctorName: 'maa', speciality: 'bb', rating: '4', image: '',),

        // '/doctor_apr': (context) => Doctor_apr(),
      },
    );
  }
}
