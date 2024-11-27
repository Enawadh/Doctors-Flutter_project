import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // صورة توضيحية للمستشفى (يمكنك وضع AssetImage أو NetworkImage هنا)
            Image.asset(
              "assets/images/welomeimege.png", // تأكد من أن لديك الصورة في المجلد assets
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            // النص الرئيسي
            Text(
              'خياراتك الأفضل لحجز موعدك',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'في أي مكان وأي زمان',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30),
            // زر تسجيل الدخول
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(color: Colors.blue),
              ),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              child: Text(
                'تسجيل دخول',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
            SizedBox(height: 10),
            // زر إنشاء الحساب
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              color: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              child: Text(
                'إنشاء الحساب',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
