import 'package:flutter/material.dart';

import 'InfoDoctor.dart';

class ViewAllDoctor extends StatefulWidget {
  final String? initialCategory;
  final List<Map<String, String>>? appointments;

  ViewAllDoctor({ this.appointments, this.initialCategory});

  @override
  State<StatefulWidget> createState() => ViewAllDoctorState();
}

class ViewAllDoctorState extends State<ViewAllDoctor> {
  final List<Map<String, String>> allDoctors = [
    {
      "img": "assets/images/dr_1.png",
      "name": "د. عمار بن سلمان",
      "speciality": "جراحي قلب",
      "rating": "4.1",
      "category": "القلب",
      "description": "د. عمار بن سلمان هو جراح قلب متمرس، مع خبرة واسعة في إجراء العمليات الجراحية المعقدة على القلب."
    },
    {
      "img": "assets/images/dr_2.png",
      "name": "د. عوض بلحول",
      "speciality": "أخصائي عظام",
      "rating": "4.2",
      "category": "العظام",
      "description": "د. عوض بلحول هو أخصائي عظام ذو سمعة ممتازة في علاج الإصابات العظمية والمعقدة."
    },
    {
      "img": "assets/images/dr_3.png",
      "name": "د. وضاح الهميمي",
      "speciality": "أخصائي عيون",
      "rating": "4.4",
      "category": "الدماغ",
      "description": "د. وضاح الهميمي هو أخصائي عيون ذو خبرة كبيرة في علاج مشاكل الرؤية المختلفة."
    },
    {
      "img": "assets/images/dr_4.png",
      "name": "د. محمد المشجري",
      "speciality": "جراحي أعصاب",
      "rating": "4.3",
      "category": "الدماغ",
      "description": "د. محمد المشجري هو جراح أعصاب بارع في علاج إصابات الدماغ والنخاع الشوكي."
    },
    {
      "img": "assets/images/dr_5.png",
      "name": "د. ناصر العتيبي",
      "speciality": "أخصائي أسنان",
      "rating": "4.8",
      "category": "الأسنان",
      "description": "د. ناصر العتيبي هو أخصائي أسنان بخبرة كبيرة في علاج مشاكل الأسنان وتركيب الأطقم."
    },
  ];


  List<Map<String, String>> displayedDoctors = [];
  String activeCategory = ""; // القسم النشط

  @override
  void initState() {
    super.initState();
    activeCategory = widget.initialCategory!;
    filterDoctors(activeCategory);
    displayedDoctors = allDoctors; // افتراضيًا، عرض كل الأطباء
  }

  void filterDoctors(String category) {
    setState(() {
      activeCategory = category; // تحديث القسم النشط
      displayedDoctors = allDoctors
          .where((doctor) => doctor["category"] == category)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue,
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
              width: size.width,
              margin: EdgeInsets.only(top: 20, left: 20),
              child: Text(
                'الأقسام',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              height: 120,
              margin: EdgeInsets.only(top: 20, left: 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  demoCategories("assets/images/tooth.png", "الأسنان"),
                  demoCategories("assets/images/brain.png", "الدماغ"),
                  demoCategories("assets/images/heart.png", "القلب"),
                  demoCategories("assets/images/bone.png", "العظام"),
                ],
              ),
            ),
            Container(
              width: size.width,
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
                  itemCount: displayedDoctors.length,
                  itemBuilder: (context, index) {
                    final doctor = displayedDoctors[index];
                    return demoTopRatedDr(
                      doctor["img"]!,
                      doctor["name"]!,
                      doctor["speciality"]!,
                      doctor["rating"]!,
                      doctor["description"]!,
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

  Widget demoCategories(String img, String name) {
    final bool isActive = activeCategory == name; // التحقق إذا كان العنصر نشطًا
    return GestureDetector(
      onTap: () {
        filterDoctors(name);
      },
      child: Container(
        width: 100,
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: isActive ? Colors.blue : Colors.white,
          // اللون بناءً على الحالة
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.blue, // إطار باللون الأزرق
            width: isActive ? 2 : 1, // سماكة الإطار تختلف إذا كان نشطًا
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                img,
                color: isActive ? Colors.white : Colors.blue, // لون الأيقونة
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                name,
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.blue, // لون النص
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

  Widget demoTopRatedDr(String img, String name, String speciality,
      String rating, String description) {
    return GestureDetector(
      onTap: () {
        // عند النقر على الطبيب، يتم الانتقال إلى صفحة معلومات الطبيب وتمرير المعلومات
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                InfoDoctor(
                  doctorName: name,
                  speciality: speciality,
                  rating: rating,
                  image: img,
                  description: description, // تم تمرير الوصف هنا
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
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    speciality,
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    'Rating: $rating',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
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