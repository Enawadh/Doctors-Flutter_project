import 'dart:io';

import 'package:flutter/material.dart';
import 'Dector.dart';
import 'InfoDoctor.dart';
import 'Profile.dart';
import 'Singup.dart';
import 'ViewAllDoctor.dart';  // تأكد من استيراد صفحة InfoDoctor هنا

class Home extends StatefulWidget {
  final String? userName;
  final String? userEmail;
  final String? image;

  Home({ this.userName, this.userEmail, this.image});
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  String  userName="";
  String userEmail="";
  String userImage="";
  String categoryName="";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, String?>?;
    if (arguments != null) {
      setState(() {
        userName = arguments['name'] ?? ''; // استلام اسم المستخدم
        userEmail = arguments['email'] ?? ''; // استلام البريد الإلكتروني
        userImage = arguments['image'] ?? ''; // استلام البريد الإلكتروني
      });
    } else {
      print('No arguments were passed to Home page.');
    }
  }  // قائمة الأطباء
  List<Doctor> doctors = [
    Doctor(
      name: 'د. عمار سلمان',
      speciality: 'جراحي قلب',
      rating: '4.1',
      image: 'assets/images/dr_1.png',
      description:"يعد د.عمار من أفضل الأطباء في تخصصه الانف والاذن"
    ),
    Doctor(
      name: 'د. عوض بلحول',
      speciality: 'أخصائي عظام',
      rating: '4.2',
      image: 'assets/images/dr_2.png',
        description:"يعد د.عوض من أفضل الأطباء في تخصصه العطام"
    ),
    Doctor(
      name: 'د. فهد العتيبي',
      speciality: 'أخصائي أنف وأذن',
      rating: '4.5',
      image: 'assets/images/dr_3.png',
        description:"يعد د.عمار من أفضل الأطباء في تخصصه القلب"
    ),

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(userName ?? 'مستخدم غير معروف'),
              accountEmail: Text(userEmail ?? 'البريد الإلكتروني غير معروف'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: userImage.isNotEmpty
                    ? FileImage(File(userImage)) // إذا كان هناك صورة للمستخدم يتم عرضها
                    : AssetImage('assets/images/profile.png') as ImageProvider, // صورة افتراضية
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.blue),
              title: Text('ملف التعريف'),
              onTap: () async {
                // الانتقال إلى صفحة الملف الشخصي مع استلام البيانات عند العودة
                final updatedData = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(
                      name: userName,  // تمرير الاسم
                      email: userEmail,
                      image: userImage ?? 'assets/images/profile.png',  // التحقق من الصورة إذا كانت null
                    ),
                  ),
                );

                // إذا تم استلام بيانات جديدة، قم بتحديث الحالة
                if (updatedData != null) {
                  setState(() {
                    userName = updatedData['name'] ?? userName;
                    userEmail = updatedData['email'] ?? userEmail;
                  });
                }
              },
            ),

            ListTile(
              leading: Icon(Icons.book, color: Colors.blue),
              title: Text('سجل الحجوزات'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.support_agent, color: Colors.blue),
              title: Text('خدمة العملاء'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.blue),
              title: Text('الإعدادات'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.blue),
              title: Text('تسجيل خروج'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SignupPage()),
                      (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, left: 250),
              child: Text(
                "مرحبا, $userName", // عرض اسم المستخدم
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 130),
              child: Text(
                "كيف نقدر نساعدك؟",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25, left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
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
                        style: TextStyle(color: Colors.blue, fontSize: 20),
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
            // عرض الأقسام
            Container(

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
                      "assets/images/tooth.png", "الأسنان"),
                  demoCategories(
                      "assets/images/brain.png", "الدماغ"),
                  demoCategories(
                      "assets/images/heart.png", "القلب"),
                  demoCategories(
                      "assets/images/bone.png", "العظام"),
                ],
              ),
            ),
            // عرض الأطباء
            Container(
              margin: EdgeInsets.only(top: 20, left: 20),
              child: Text(
                'أفضل الأطباء',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: ListView.builder(
                  itemCount: doctors.length,
                  itemBuilder: (context, index) {
                    final doctor = doctors[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InfoDoctor(
                              doctorName: doctor.name,
                              speciality: doctor.speciality,
                              rating: doctor.rating,
                              image: doctor.image,
                              description: doctor.description,
                            ),
                          ),
                        );
                      },
                      child: demoTopRatedDr(
                        doctor.image,
                        doctor.name,
                        doctor.speciality,
                        doctor.rating,
                        doctor.description
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget demoCategories(String img, String categoryName) {
    return GestureDetector(
      onTap: () {
        // عند النقر، الانتقال إلى صفحة ViewAllDoctor وتمرير اسم القسم
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewAllDoctor(initialCategory: categoryName,
               // تمرير اسم القسم
            ),
          ),
        );
      },
      child: Container(
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
                categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget demoTopRatedDr(String img, String name, String speciality, String rating, String des) {
    return GestureDetector(
      onTap: () {
        // عند النقر، سيتم الانتقال إلى صفحة Dector
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InfoDoctor(
              doctorName: name,
              speciality: speciality,
              rating: rating,
              image: img,
              description: des,
            ),
          ),
        );
      },
      child: Container(
        height: 90,
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
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
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
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(width: 20),
                        Row(
                          children: [
                            Text(
                              "Rating: ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              rating,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
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
