import 'package:flutter/material.dart';

import 'DoctorDetailPage.dart';

class InfoDoctor extends StatelessWidget {
  final String doctorName;
  final String speciality;
  final String rating;
  final String image;
  final String description;

  InfoDoctor({
    required this.doctorName,
    required this.speciality,
    required this.rating,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "معلومات الطبيب",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
        ),
        backgroundColor: Color(0xFF0077B6),  // اللون الأزرق الموحد
        centerTitle: true,
        elevation: 8,  // إضافة الظلال للـ AppBar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),  // مسافات أكبر حول المحتوى
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(120), // جعل الصورة دائرية بشكل أكبر
                child: Image.asset(
                  image,
                  width: 130,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Text(
                doctorName,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,  // نفس اللون الأزرق
                ),
              ),
              Text(
                speciality,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildInfoColumn(Icons.people, "+1000", "المرضى"),
                  _buildInfoColumn(Icons.access_time, "10 سنوات", "الخبرة"),
                  _buildInfoColumn(Icons.star, rating, "التقييم"),
                ],
              ),
              SizedBox(height: 30),
              Divider(thickness: 1, color: Colors.grey[300]),
              SizedBox(height: 25),
              Text(
                'نبذة عامة',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0077B6),  // نفس اللون الأزرق
                ),
              ),
              SizedBox(height: 10),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[800],
                  height: 1.8,
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DoctorDetailPage(
                        doctorName: doctorName,
                        speciality: speciality,
                        rating: rating,
                        image: image,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Color(0xFF0077B6),  // اللون الأزرق الموحد للزر
                  elevation: 10,  // إضافة ظلال أكثر للأزرار
                ),
                child: Text(
                  "احجز موعدًا",
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoColumn(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: Color(0xFF0077B6), size: 32),  // نفس اللون الأزرق
        SizedBox(height: 10),
        Text(
          value,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
