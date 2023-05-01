// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, file_names

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:order_processing_app/utils/constant.dart';
import 'package:order_processing_app/views/loginScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                  decoration: InputDecoration(
                    hintText: "UserName",
                    labelText: "UserName",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              FadeInLeft(
                  duration: Duration(milliseconds: 1800),
                child: TextFormField(
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
              FadeInLeft(
                duration: Duration(milliseconds: 1800),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: Icon(Icons.visibility),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  
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