import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:order_processing_app/utils/constant.dart';
import 'package:order_processing_app/views/createNewOrderScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
              child: CircleAvatar(
                radius: 15.0,
                child: Icon(Icons.add_business)),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(child: Text("MO"),),
              accountName: Text("Muhammet Oz"), 
              accountEmail: Text("Muhammetozx@icloud.com"),
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
            Divider(height: 10.0,color: Colors.grey,),
            ListTile(
              title: Text("Help"),
              leading: Icon(Icons.help),
              trailing: Icon(Icons.arrow_circle_right),
            ),
          ],
        ),
      ),
      body: FadeInLeft(
        child: Container(
          child:ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text("Order no 01"),
                  subtitle: Text("pending", style: TextStyle(color:  Colors.blue),),
                  leading: CircleAvatar(child: Text((index + 1) .toString()),),
                  trailing: CircleAvatar(child: Icon(Icons.edit)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}