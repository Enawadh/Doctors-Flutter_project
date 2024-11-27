import 'dart:io';  // لاستيراد مكتبة تحميل الصور من المسار
import 'package:flutter/material.dart';
import 'EditProfile.dart';
import 'Home.dart';  // استيراد الصفحة الرئيسية

class Profile extends StatefulWidget {
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final String image;

  Profile({
    required this.name,
    required this.email,
    this.phoneNumber = "Not Available",
    this.address = "Not Available",
    required this.image,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late String name;
  late String email;
  late String phoneNumber;
  late String address;
  late String image;

  @override
  void initState() {
    super.initState();
    name = widget.name;
    email = widget.email;
    phoneNumber = widget.phoneNumber;
    address = widget.address;
    image = widget.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'ملف التعريف',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        // إضافة زر الرجوع (Back Arrow)
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // العودة إلى الصفحة الرئيسية مع إرسال البيانات إلى المسار المحدد
            Navigator.pushNamed(context, '/mainpage', arguments: {
              'name': name,
              'email': email,
              'image': image,
            });
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: image.isNotEmpty
                  ? FileImage(File(image))  // استخدم FileImage لعرض الصورة من المسار
                  : null,
              child: image.isEmpty ? Icon(Icons.person, size: 50) : null,
            ),
            SizedBox(height: 20),
            _buildProfileItem("الأسم", name),
            SizedBox(height: 20),
            _buildProfileItem("البريد الإلكتروني", email),
            SizedBox(height: 20),
            _buildProfileItem("رقم الهاتف", phoneNumber),
            SizedBox(height: 20),
            _buildProfileItem("العنوان", address),
            SizedBox(height: 40),

            MaterialButton(
              onPressed: () async {
                final updatedData = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfile(
                      name: name,
                      email: email,
                      phoneNumber: phoneNumber,
                      address: address,
                      image: image,
                    ),
                  ),
                );
                if (updatedData != null) {
                  setState(() {
                    name = updatedData['name'] ?? name;
                    email = updatedData['email'] ?? email;
                    phoneNumber = updatedData['phone'] ?? phoneNumber;
                    address = updatedData['address'] ?? address;
                    image = updatedData['image'] ?? image;
                  });
                }
              },
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(color: Colors.blue),
              ),
              padding: EdgeInsets.symmetric(horizontal: 115, vertical: 15),
              child: Text(
                'تحرير ملف التعريف',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: 8),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, '/mainpage');
              },
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(color: Colors.red),
              ),
              padding: EdgeInsets.symmetric(horizontal: 140, vertical: 15),
              child: Text(
                'تسجيل خروج',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // وظيفة لبناء عناصر ملف التعريف
  Widget _buildProfileItem(String title, String value) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            color: Colors.blue.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(value.isEmpty ? "غير متاح" : value),
        leading: Icon(Icons.info_outline),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
      ),
    );
  }
}
