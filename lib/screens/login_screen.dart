import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_textformfield.dart';
import '../widgets/custom_inkwell_button.dart';
import '../widgets/constants.dart';
import '../screens/home_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController usernameController =
      TextEditingController(text: 'user');
  TextEditingController passwordController =
      TextEditingController(text: 'user');

  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  void _togglePassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      if (usernameController.text == 'user' &&
          passwordController.text == 'user') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => HomeScreen(
              username: usernameController.text, profileName: 'User',
            ),
          ),
        );
      } else {
        _showDialog(
          context,
          'Error',
          title: 'Login Error',
          message: 'Username and Password does not match',
        );
      }
    }
  }

void _showDialog(BuildContext context, String s,
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(height: 40.h, width: double.infinity, color: YF_PRIMARY),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    children: [
                      Image.asset(
                        //Enhancement 1: Created my Own Logo (DONE)
                        'assets/images/logogo.png',
                        height: 200.h,
                      ),
                      SizedBox(height: 30.h),

                      // Username
                      CustomTextFormField(
                        controller: usernameController,
                        validator: (value) =>
                            value!.isEmpty ? 'Enter your username' : null,
                        fontSize: 15.sp,
                        fontColor: YF_PRIMARY,
                        hintTextSize: 15.sp,
                        hintText: 'Username', onSaved: (String? newValue) {  }, height: 0, width: 0,
                      ),

                      SizedBox(height: 10.h),

                      // Password
                      CustomTextFormField(
                        controller: passwordController,
                        validator: (value) =>
                            value!.isEmpty ? 'Enter your password' : null,
                        fontSize: 15.sp,
                        fontColor: YF_PRIMARY,
                        hintTextSize: 15.sp,
                        hintText: 'Password',
                        isObscure: _obscurePassword,
                        isPassword: true,
                        toggleObscure: _togglePassword, onSaved: (String? newValue) {  }, height: 0, width: 0,
                      ),

                      SizedBox(height: 50.h),

                      CustomInkWellButton(
                        onTap: _login,
                        height: 40.h,
                        fontWeight: FontWeight.bold,
                        width: ScreenUtil().screenWidth,
                        buttonName: 'Login',
                        fontSize: 15.sp,
                      ),
                    ],
                  ),
                ),

                Container(
                  height: 40.h,
                  width: double.infinity,
                  color: YF_PRIMARY,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You do not have an account?',
                        style: TextStyle(
                          color: Colors.grey.shade200,
                          fontSize: 15.sp,
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            Navigator.popAndPushNamed(context, '/register'),
                        child: Text(
                          ' Register here',
                          style: TextStyle(
                            color: YF_LIGHT,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
