import 'dart:io';  // استيراد مكتبة `dart:io` لتحميل الصور من المسار
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final String image;

  EditProfile({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.image,
  });

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late String image;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    emailController = TextEditingController(text: widget.email);
    phoneController = TextEditingController(text: widget.phoneNumber);
    addressController = TextEditingController(text: widget.address);
    image = widget.image;
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = pickedFile.path; // حفظ مسار الصورة
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تحرير ملف التعريف"),
        backgroundColor: Colors.blueAccent,  // تعديل لون الخلفية
        elevation: 0,  // إزالة الظلال
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 100,  // تغيير حجم الصورة لتناسب التصميم
                backgroundImage: image.isNotEmpty
                    ? FileImage(File(image)) // استخدم FileImage لتحميل الصورة من المسار
                    : null,
                child: image.isEmpty
                    ? Icon(Icons.camera_alt, size: 40, color: Colors.white)  // أيقونة الكاميرا
                    : null,
              ),
            ),
            SizedBox(height: 30),  // زيادة المسافة بين الصورة وبقية العناصر
            _buildTextField("الاسم", nameController),
            SizedBox(height: 16),
            _buildTextField("البريد الإلكتروني", emailController),
            SizedBox(height: 16),
            _buildTextField("رقم الهاتف", phoneController),
            SizedBox(height: 16),
            _buildTextField("العنوان", addressController),
            SizedBox(height: 30),
            _buildSaveButton(),
            SizedBox(height: 20),
            _buildCancelButton(),
          ],
        ),
      ),
    );
  }

  // زر حفظ التعديلات
  Widget _buildSaveButton() {
    return MaterialButton(
      onPressed: () {
        Navigator.pop(context, {
          'name': nameController.text,
          'email': emailController.text,
          'phone': phoneController.text,
          'address': addressController.text,
          'image': image,
        });
      },
      color: Colors.blueAccent,  // تغيير اللون ليتناسب مع الألوان الرئيسية
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
      child: Text(
        "حفظ التعديلات",
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }

  // زر إلغاء
  Widget _buildCancelButton() {
    return MaterialButton(
      onPressed: () {
        Navigator.pop(context); // العودة إلى الصفحة السابقة دون حفظ
      },
      color: Colors.grey,  // اللون الرمادي لزر الإلغاء
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(horizontal: 120, vertical: 15),
      child: Text(
        "إلغاء",
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }

  // بناء حقل النصوص
  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: 'أدخل $label هنا', // نص توضيحي للحقل
        labelStyle: TextStyle(color: Colors.blueAccent),  // لون النص
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15), // حواف دائرية
          borderSide: BorderSide(color: Colors.blueAccent), // حواف بلون أزرق
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      ),
      keyboardType: label == "البريد الإلكتروني" ? TextInputType.emailAddress : TextInputType.text,
    );
  }
}
