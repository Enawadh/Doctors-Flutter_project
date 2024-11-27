
import 'package:booky_appointment/Pages/DoctorDetailPage.dart';
import 'package:booky_appointment/Pages/Home.dart';
// import 'package:booky_appointment/Pages/Login.dart';
// import 'package:booky_appointment/Pages/Login.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_work/Pages/login.dart';

class Appointment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppointmentState();
}

class AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    return initScreen();
  }

  Widget initScreen() {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        actions: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.notifications_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, left: 250),
              child: Text(
                "مرحبا, عبدالله",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  // fontFamily: 'Roboto',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 130),
              child: Text(
                "  المواعيدك القادمة",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  // fontFamily: 'Roboto',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25, left: 20, right: 20),
              width: size.width,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 2),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        maxLines: 1,
                        autofocus: false,
                        style: TextStyle(color: Colors.teal, fontSize: 20),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'أبحث..',
                        ),
                        cursorColor: Colors.blue,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: size.width,
              margin: EdgeInsets.only(top: 20, left: 20),
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 20, top: 1),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'الأقسام',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            // fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )),
                  Container(
                    // margin: EdgeInsets.only(right: 20, top: 1),
                    child: Text(
                      'عرض الكل',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 19,
                        // fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 120,
              margin: EdgeInsets.only(top: 20, left: 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  demoCategories(
                      "assets/images/tooth.png", "الأسنان", "10 أطباء"),
                  demoCategories(
                      "assets/images/brain.png", "الدماغ", "15 أطباء"),
                  demoCategories(
                      "assets/images/heart.png", "القلب", "17 أطباء"),
                  demoCategories(
                      "assets/images/bone.png", "العظام", "24 أطباء"),
                ],
              ),
            ),
            Container(
              width: size.width,
              margin: EdgeInsets.only(top: 20, left: 20),
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 20, top: 1),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'أفضل الأطباء',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            // fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )),
                  Container(
                    child: Text(
                      'عرض الكل ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 19,
                        // fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: ListView(
                  children: [
                    demoTopRatedDr(
                      "assets/images/dr_1.png",
                      "د. عمار بن سلمان",
                      "جراحي قلب",
                      "4.1",
                      "",
                    ),
                    demoTopRatedDr(
                      "assets/images/dr_2.png",
                      "د. عوض بلحول",
                      "أخصائي عظام",
                      "4.2",
                      "",
                    ),
                    demoTopRatedDr(
                      "assets/images/dr_3.png",
                      "د. وضاح الهميمي",
                      "أخصائي عيون",
                      "4.4",
                      "",
                    ),
                    demoTopRatedDr("assets/images/dr_2.png", "د. محمد المشجري",
                        "جراحي أعصاب", "4.3", ""),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget demoCategories(String img, String name, String drCount) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(img),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                // fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.07),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              drCount,
              style: TextStyle(
                color: Colors.white,
                fontSize: 8,
                // fontFamily: 'Roboto',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget demoTopRatedDr(String img, String name, String speciality,
      String rating, String distance) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Home()));
      },
      child: Container(
        height: 90,
        // width: size.width,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 90,
              width: 50,
              child: Image.asset(img),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        // fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Text(
                          speciality,
                          style: TextStyle(
                            color: Colors.blue,
                            // fontFamily: 'Roboto',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: 3, left: size.width * 0.25),
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  "Rating: ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    // fontFamily: 'Roboto',
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  rating,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    // fontFamily: 'Roboto',
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
