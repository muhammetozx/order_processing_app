import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:order_processing_app/utils/constant.dart';
import 'package:order_processing_app/views/orderListScreen.dart';
import 'package:order_processing_app/views/createNewOrderScreen.dart';
import 'package:order_processing_app/views/loginScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;

// QuerySnapshot? userSnapshot;
  /*  getUserDetails() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    userSnapshot = await FirebaseFirestore.instance.collection('Users').get();
    print("");
  }*/


  /*DocumentSnapshot? userSnapshot;
  getUserDetails() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    userSnapshot =
        await FirebaseFirestore.instance.collection('Users').doc(uid).get();

    setState(() {});
  }*/

  @override
  Widget build(BuildContext context) {
    //getUserDetails();
    return Scaffold(
        appBar: AppBar(
          title: Text(AppConstant.appName),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(() => CreateNewOrderScreen());
              },
              child: Container(
                margin: EdgeInsets.only(right: 10.0),
                child:
                    CircleAvatar(radius: 15.0, child: Icon(Icons.add_business)),
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  child: Text("MO"),
                ),
                accountName: Text("userSnapshot![UserNam]"),
                accountEmail: Text(user.email!),
              ),
              ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                trailing: Icon(Icons.arrow_circle_right),
              ),
              ListTile(
                title: Text("Add New Order"),
                leading: Icon(Icons.add_business),
                trailing: Icon(Icons.arrow_circle_right),
              ),
              ListTile(
                title: Text("Info"),
                leading: Icon(Icons.info),
                trailing: Icon(Icons.arrow_circle_right),
              ),
              Divider(
                height: 10.0,
                color: Colors.grey,
              ),
              ListTile(
                title: Text("Help"),
                leading: Icon(Icons.help),
                trailing: Icon(Icons.arrow_circle_right),
              ),
              GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => LoginScreen()),
                        (Route<dynamic> route) => false);
                  });
                },
                child: ListTile(
                  title: Text("LogOut"),
                  leading: Icon(Icons.logout),
                  trailing: Icon(Icons.arrow_circle_right),
                ),
              ),
            ],
          ),
        ),
        body: OrderListScreen());
  }
}
