// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, file_names

import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:order_processing_app/utils/constant.dart';
import 'package:order_processing_app/views/loginScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController singUpUserNameController = TextEditingController();
  TextEditingController singUpEmailController = TextEditingController();
  TextEditingController singUpPasswordController = TextEditingController();

  singUpClass() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: singUpEmailController.text,
            password: singUpPasswordController.text)
        .then((user) {
      FirebaseFirestore.instance
          .collection('Users')
          .doc(singUpUserNameController.text)
          .set({
        'UserName': singUpUserNameController.text,
        'Email': singUpEmailController.text,
        'Password': singUpPasswordController.text
      }).whenComplete(() => Get.to(() => LoginScreen()));
    }).whenComplete(
      () => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Kayıt işlemi başarılı."),
          duration: Duration(seconds: 2),
        ),
      ),
    );
  }

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
                  child: Lottie.asset('assets/images/hello.json',
                      fit: BoxFit.cover),
                ),
              ),
              FadeInLeft(
                duration: Duration(milliseconds: 1800),
                child: TextFormField(
                  controller: singUpUserNameController,
                  decoration: InputDecoration(
                      hintText: "UserName",
                      labelText: "UserName",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
              ),
              SizedBox(height: 10.0),
              FadeInLeft(
                duration: Duration(milliseconds: 1800),
                child: TextFormField(
                  controller: singUpEmailController,
                  decoration: InputDecoration(
                      hintText: "Email",
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
              ),
              SizedBox(height: 10.0),
              FadeInLeft(
                duration: Duration(milliseconds: 1800),
                child: TextFormField(
                  controller: singUpPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: Icon(Icons.visibility),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  singUpClass();
                },
                child: Text("SignUp"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
