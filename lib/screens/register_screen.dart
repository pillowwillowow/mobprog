import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/constants.dart';
import '../widgets/custom_font.dart';
import '../widgets/custom_inkwell_button.dart';
import '../widgets/custom_textformfield.dart';

class User {
  static final User _instance = User._internal();
  factory User() => _instance;
  User._internal();

  String username = '';
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void _togglePassword() => setState(() => _obscurePassword = !_obscurePassword);
  void _toggleConfirmPassword() => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);

  void _showCustomModal(BuildContext context,
      {required String title, required String message, bool isError = true, VoidCallback? onOk}) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isError ? Icons.bug_report_rounded : Icons.emoji_emotions_rounded,
                color: isError ? Colors.red : Colors.green,
                size: 50,
              ),
              const SizedBox(height: 15),
              Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(message, textAlign: TextAlign.center, style: const TextStyle(fontSize: 15, color: Colors.black54)),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onOk?.call();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: isError ? YF_SECONDARY : Colors.green),
                  child: const Text('Okay', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void register() {
    final firstName = firstnameController.text.trim();
    final lastName = lastnameController.text.trim();
    final username = usernameController.text.trim();
    final contact = contactNumberController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmpasswordController.text.trim();

    if (firstName.isEmpty || lastName.isEmpty || username.isEmpty || contact.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showCustomModal(context, title: 'Error', message: 'All fields are required.');
      return;
    }

    if (!RegExp(r'^\d{11}$').hasMatch(contact)) {
      _showCustomModal(context, title: 'Error', message: 'Contact number must be exactly 11 digits.');
      return;
    }

    if (password.length < 8 ||
        !RegExp(r'[A-Z]').hasMatch(password) ||
        !RegExp(r'[a-z]').hasMatch(password) ||
        !RegExp(r'\d').hasMatch(password) ||
        !RegExp(r'[!@#$%^&*(),.?":{}|<>_]').hasMatch(password)) {
      _showCustomModal(
          context,
          title: 'Error',
          message: 'Password must be at least 8 characters and include uppercase, lowercase, number, and special character.');
      return;
    }

    if (password != confirmPassword) {
      _showCustomModal(context, title: 'Error', message: 'Passwords do not match!');
      return;
    }

    User().username = username;

    _showCustomModal(
      context,
      title: 'Success',
      message: 'You have registered successfully!',
      isError: false,
      onOk: () => Navigator.pushReplacementNamed(context, '/login'),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(25.w, 40.h, 25.w, 10.h),
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          child: Column(
            children: [
              SizedBox(height: 25.h),
              CustomFont(
                text: 'Register Here',
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
                color: YF_PRIMARY,
              ),
              SizedBox(height: 25.h),

              CustomTextFormField(
                height: 10.h,
                width: 10.w,
                controller: firstnameController,
                hintText: 'First Name',
                hintTextSize: 15.sp,
                fontSize: 15.sp,
                fontColor: Colors.black,
                validator: (_) => null,
                onSaved: (value) => firstnameController.text = value!,
              ),

              SizedBox(height: 10.h),

              CustomTextFormField(
                height: 10.h,
                width: 10.w,
                controller: lastnameController,
                hintText: 'Last Name',
                hintTextSize: 15.sp,
                fontSize: 15.sp,
                fontColor: Colors.black,
                validator: (_) => null,
                onSaved: (value) => lastnameController.text = value!,
              ),

              SizedBox(height: 10.h),

              CustomTextFormField(
                height: 10.h,
                width: 10.w,
                controller: usernameController,
                hintText: 'Username',
                hintTextSize: 15.sp,
                fontSize: 15.sp,
                fontColor: Colors.black,
                validator: (_) => null,
                onSaved: (value) => usernameController.text = value!,
              ),

              SizedBox(height: 10.h),

              CustomTextFormField(
                height: 10.h,
                width: 10.w,
                controller: contactNumberController,
                hintText: 'Contact Number',
                keyboardType: TextInputType.phone,
                hintTextSize: 15.sp,
                fontSize: 15.sp,
                fontColor: Colors.black,
                validator: (_) => null,
                onSaved: (value) => contactNumberController.text = value!,
              ),

              SizedBox(height: 6.h),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '(Contact number must be 11 digits and reachable.)',
                  style: TextStyle(fontSize: 12.sp, color: Colors.black45),
                ),
              ),

              SizedBox(height: 10.h),

              CustomTextFormField(
                height: 10.h,
                width: 10.w,
                controller: passwordController,
                hintText: 'Password',
                isPassword: true,
                isObscure: _obscurePassword,
                toggleObscure: _togglePassword,
                hintTextSize: 15.sp,
                fontSize: 15.sp,
                fontColor: Colors.black,
                validator: (_) => null,
                onSaved: (value) => passwordController.text = value!,
              ),

              SizedBox(height: 6.h),

              Text(
                '(Password must contain uppercase, lowercase, number, and special character.)',
                style: TextStyle(fontSize: 12.sp, color: Colors.black45),
              ),

              SizedBox(height: 10.h),

              CustomTextFormField(
                height: 10.h,
                width: 10.w,
                controller: confirmpasswordController,
                hintText: 'Confirm Password',
                isPassword: true,
                isObscure: _obscureConfirmPassword,
                toggleObscure: _toggleConfirmPassword,
                hintTextSize: 15.sp,
                fontSize: 15.sp,
                fontColor: Colors.black,
                validator: (_) => null,
                onSaved: (value) => confirmpasswordController.text = value!,
              ),
    
              const Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You have an account?',
                    style: TextStyle(fontSize: 15.sp, color: Colors.black45),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.popAndPushNamed(context, '/login'),
                    child: Text(
                      ' Login here',
                      style: TextStyle(
                        color: YF_PRIMARY,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.h),

              CustomInkWellButton(
                onTap: register,
                height: 45.h,
                width: ScreenUtil().screenWidth,
                fontSize: 15.sp,
                buttonName: 'Submit',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
