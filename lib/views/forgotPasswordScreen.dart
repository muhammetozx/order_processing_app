// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, file_names

import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:order_processing_app/utils/constant.dart';
import 'package:order_processing_app/views/loginScreen.dart';
import 'package:order_processing_app/views/signUpScreen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({ Key? key }) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController forgetPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstant.appName),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              FadeInDown(
                duration: Duration(milliseconds: 1800),
                child: Container(
                  alignment: Alignment.center,
                  child: Lottie.asset('assets/images/hello.json',fit: BoxFit.cover),
                ),
              ),
              FadeInLeft(
                  duration: Duration(milliseconds: 1800),
                child: TextFormField(
                  controller: forgetPasswordController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                  ),
                ),
              ),
              SizedBox(height: 10.0),  
              ElevatedButton(
                onPressed: () async{
                  var forgotEmail = forgetPasswordController.text.trim();

                  try{
                    await FirebaseAuth.instance
                    .sendPasswordResetEmail(email: forgotEmail)
                    .then((value) => {
                      print("Email Sent!"),
                      Get.off(() => LoginScreen()),
                    });
                  }on FirebaseAuthException catch (e){
                    print("Error $e");
                  }
                },
                child: Text("Forgot"),
              ),    
            ],
          ), 
        ),
      ),
    );
  }
}