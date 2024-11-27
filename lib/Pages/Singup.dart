import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();
  bool _obscureText = true;

  void _signup() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, '/login', arguments: {
        'name': '${firstNameController.text} ${lastNameController.text}',
        'email': emailController.text,
        'password': passwordController.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white, // خلفية بيضاء
      appBar: AppBar(
        title: Text(
          'إنشاء حساب',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[


                // First Name Field
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'الاسم الأول',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 10), // المسافة بين النص وحقل الإدخال
                TextFormField(
                  controller: firstNameController,
                  textAlign: TextAlign.right, // محاذاة النص داخل الحقل لليمين
                  decoration: InputDecoration(
                    hintText: 'قم بوضع الاسم الأول',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    filled: true,
                    fillColor: Colors.white, // تغيير اللون إلى أبيض
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال الاسم الأول';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20), // المسافة بين الحقول
                // Last Name Field
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'الاسم الأخير',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 10), // المسافة بين النص وحقل الإدخال
                TextFormField(
                  controller: lastNameController,
                  textAlign: TextAlign.right, // محاذاة النص داخل الحقل لليمين
                  decoration: InputDecoration(
                    hintText: 'قم بوضع الاسم الأخير',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    filled: true,
                    fillColor: Colors.white, // تغيير اللون إلى أبيض
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال الاسم الأخير';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20), // المسافة بين الحقول
                // Email Field
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'البريد الإلكتروني',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 10), // المسافة بين النص وحقل الإدخال
                TextFormField(
                  controller: emailController,
                  textAlign: TextAlign.right, // محاذاة النص داخل الحقل لليمين
                  decoration: InputDecoration(
                    hintText: 'قم بوضع بريدك الإلكتروني',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    filled: true,
                    fillColor: Colors.white, // تغيير اللون إلى أبيض
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال البريد الإلكتروني';
                    }
                    final emailRegExp = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                    if (!emailRegExp.hasMatch(value)) {
                      return 'البريد الإلكتروني غير صالح';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20), // المسافة بين الحقول
                // Password Field
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'كلمة المرور',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 10), // المسافة بين النص وحقل الإدخال
                TextFormField(
                  controller: passwordController,
                  textAlign: TextAlign.right, // محاذاة النص داخل الحقل لليمين
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    hintText: 'كلمة المرور',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    filled: true,
                    fillColor: Colors.white, // تغيير اللون إلى أبيض
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال كلمة المرور';
                    }
                    if (value.length < 6) {
                      return 'يجب أن تكون كلمة المرور أطول من 6 أحرف';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20), // المسافة بين الحقول
                // Confirm Password Field
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'تأكيد كلمة المرور',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 10), // المسافة بين النص وحقل الإدخال
                TextFormField(
                  controller: confirmPasswordController,
                  textAlign: TextAlign.right, // محاذاة النص داخل الحقل لليمين
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    hintText: 'تأكيد كلمة المرور',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    filled: true,
                    fillColor: Colors.white, // تغيير اللون إلى أبيض
                  ),
                  validator: (value) {
                    if (value == null || value != passwordController.text) {
                      return 'كلمة المرور غير متطابقة';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30), // المسافة بين الحقول
                // Sign Up Button
                Center(
                  child: ElevatedButton(
                    onPressed: _signup,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          vertical: 15, horizontal: 100),
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'إنشاء الحساب',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      'لدي حساب بالفعل',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
