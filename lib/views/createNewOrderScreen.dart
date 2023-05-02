// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, file_names

import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:order_processing_app/utils/constant.dart';
import 'package:order_processing_app/views/signUpScreen.dart';

class CreateNewOrderScreen extends StatefulWidget {
  const CreateNewOrderScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewOrderScreen> createState() => _CreateNewOrderScreenState();
}

class _CreateNewOrderScreenState extends State<CreateNewOrderScreen> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController clientNameController = TextEditingController();
  TextEditingController clientAddressController = TextEditingController();
  TextEditingController clientMobileController = TextEditingController();
  TextEditingController buyPriceController = TextEditingController();
  TextEditingController salePriceController = TextEditingController();
  TextEditingController saleDateController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  orderAdd() {
    FirebaseFirestore.instance
        .collection('Orders')
        .doc(productNameController.text)
        .set({
      'userId': auth.currentUser?.uid,
      'productName': productNameController.text,
      'clientName': clientNameController.text,
      'clientAddress': clientAddressController.text,
      'clientMobile': clientMobileController.text,
      'buyPrice': buyPriceController.text,
      'salePrice': salePriceController.text,
      'saleDate': saleDateController.text,
    });
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
              SizedBox(height: 20.0),
              TextFormField(
                controller: productNameController,
                decoration: InputDecoration(
                    hintText: "Product Name",
                    labelText: "Product Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: clientNameController,
                decoration: InputDecoration(
                    hintText: "Client Name",
                    labelText: "Client Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: clientAddressController,
                decoration: InputDecoration(
                    hintText: "Client Address",
                    labelText: "Client Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: clientMobileController,
                decoration: InputDecoration(
                    hintText: "Client Mobile",
                    labelText: "Client Mobile",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: buyPriceController,
                decoration: InputDecoration(
                    hintText: "Buy Price",
                    labelText: "Buy Price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: salePriceController,
                decoration: InputDecoration(
                    hintText: "Sale Price",
                    labelText: "Sale Price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: saleDateController,
                decoration: InputDecoration(
                    hintText: "Sale Date",
                    labelText: "Sale Date",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  orderAdd();
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
