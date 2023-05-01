import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_processing_app/utils/constant.dart';
import 'package:order_processing_app/views/createNewOrderScreen.dart';
import 'package:order_processing_app/views/homeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:order_processing_app/views/loginScreen.dart';
import 'package:order_processing_app/views/signUpScreen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstant.appName,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: LoginScreen(),
    );
  }
}

