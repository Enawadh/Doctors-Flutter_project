import 'dart:ui';
import 'package:flutter/material.dart';

class DoctorDetailPage extends StatefulWidget {
  final String doctorName;
  final String speciality;
  final String rating;
  final String image;

  DoctorDetailPage({
    required this.doctorName,
    required this.speciality,
    required this.rating,
    required this.image,
  });

  @override
  State<StatefulWidget> createState() => _DoctorDetailState();
}

class _DoctorDetailState extends State<DoctorDetailPage> {
  String? selectedDay;
  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with doctor details
            Container(
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Container(
                margin: EdgeInsets.only(left: 30, bottom: 30),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // You can change the route here
                        Navigator.pushNamed(context, '/infodoctor');
                      },
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(widget.image),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Same as above, adjust for navigation
                        Navigator.pushNamed(context, '/infodoctor');
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 100),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              child: Text(
                                widget.doctorName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, left: 80),
                              child: Text(
                                widget.speciality,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15, left: 80),
                              child: Text(
                                'Rating: ${widget.rating}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Date selection
            Container(
              margin: EdgeInsets.only(left: 20, top: 30),
              child: Text(
                'اختر اليوم',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 20, right: 20),
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  demoDates("Mon", "21", "Mon" == selectedDay),
                  demoDates("Tue", "22", "Tue" == selectedDay),
                  demoDates("Wed", "23", "Wed" == selectedDay),
                  demoDates("Thu", "24", "Thu" == selectedDay),
                  demoDates("Fri", "25", "Fri" == selectedDay),
                  demoDates("Sat", "26", "Sat" == selectedDay),
                  demoDates("Sun", "27", "Sun" == selectedDay),
                ],
              ),
            ),
            // Morning time selection
            Container(
              margin: EdgeInsets.only(left: 20, top: 30),
              child: Text(
                'صباحاً',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 2.7,
                children: [
                  doctorTimingsData("08:30 AM", "08:30 AM" == selectedTime),
                  doctorTimingsData("09:00 AM", "09:00 AM" == selectedTime),
                  doctorTimingsData("10:00 AM", "10:00 AM" == selectedTime),
                  doctorTimingsData("11:00 AM", "11:00 AM" == selectedTime),
                  doctorTimingsData("12:00 PM", "12:00 PM" == selectedTime),
                  doctorTimingsData("01:00 PM", "01:00 PM" == selectedTime),
                ],
              ),
            ),
            // Evening time selection
            Container(
              margin: EdgeInsets.only(left: 25, top: 30),
              child: Text(
                'مساءً',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 2.6,
                children: [
                  doctorTimingsData("02:00 PM", "02:00 PM" == selectedTime),
                  doctorTimingsData("03:00 PM", "03:00 PM" == selectedTime),
                  doctorTimingsData("04:00 PM", "04:00 PM" == selectedTime),
                  doctorTimingsData("05:00 PM", "05:00 PM" == selectedTime),
                  doctorTimingsData("06:00 PM", "06:00 PM" == selectedTime),
                  doctorTimingsData("07:00 PM", "07:00 PM" == selectedTime),
                ],
              ),
            ),
            // Confirm button
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 54,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue,
                    offset: Offset(0, 10),
                    blurRadius: 15,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child:GestureDetector(
                onTap: () {
                  if (selectedDay != null && selectedTime != null) {
                    // إنشاء كائن newAppointment
                    Map<String, String> newAppointment = {
                      'doctorName': widget.doctorName,
                      'day': selectedDay!,
                      'time': selectedTime!,
                      'image': widget.image,
                    };

                    // إرسال newAppointment عبر constructor
                    Navigator.pushNamed(
                      context,
                      '/ViewAllAppointments',
                      arguments: newAppointment, // إرسال البيانات
                    );

                  }
                },
                child: Text(
                  'تأكيد الحجز',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }

  Widget demoDates(String day, String date, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDay = day;
        });
      },
      child: Container(
        width: 70,
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              date,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget doctorTimingsData(String time, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTime = time;
        });
      },
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            time,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
