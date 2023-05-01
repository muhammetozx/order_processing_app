// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, file_names

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:order_processing_app/utils/constant.dart';
import 'package:order_processing_app/views/signUpScreen.dart';

class CreateNewOrderScreen extends StatefulWidget {
  const CreateNewOrderScreen({ Key? key }) : super(key: key);

  @override
  State<CreateNewOrderScreen> createState() => _CreateNewOrderScreenState();
}

class _CreateNewOrderScreenState extends State<CreateNewOrderScreen> {
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
              SizedBox(height: 20.0),
              TextFormField(
                  decoration: InputDecoration(
                    hintText: "Product Name",
                    labelText: "Product Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                  ),
                ),
              SizedBox(height: 10.0),
              TextFormField(
                  decoration: InputDecoration(
                    hintText: "Client Name",
                    labelText: "Client Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                  ),
                ),
              SizedBox(height: 10.0),  
              TextFormField(
                  decoration: InputDecoration(
                    hintText: "Client Address",
                    labelText: "Client Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                  ),
                ),
              SizedBox(height: 10.0),  
              TextFormField(
                  decoration: InputDecoration(
                    hintText: "Client Mobile",
                    labelText: "Client Mobile",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                  ),
                ),
              SizedBox(height: 10.0),  
              TextFormField(
                  decoration: InputDecoration(
                    hintText: "Buy Price",
                    labelText: "Buy Price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                  ),
                ),
              SizedBox(height: 10.0),  
              TextFormField(
                  decoration: InputDecoration(
                    hintText: "Sale Price",
                    labelText: "Sale Price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                  ),
                ),
              SizedBox(height: 10.0),  
              TextFormField(
                  decoration: InputDecoration(
                    hintText: "Sale Date",
                    labelText: "Sale Date",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                  ),
                ),
              SizedBox(height: 10.0),   
              ElevatedButton(
                onPressed: () {
                  
                },
                child: Text("Create Order"),
              ),    
            ],
          ), 
        ),
      ),
    );
  }
}