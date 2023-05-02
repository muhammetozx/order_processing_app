import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    Query ref = FirebaseFirestore.instance
        .collection('Orders')
        .where("userId", isEqualTo: auth.currentUser?.uid);

    return StreamBuilder<QuerySnapshot>(
      stream: ref.snapshots(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot orderList = snapshot.data!.docs[index];
                  return Card(
                    child: ListTile(
                      title: Text("${orderList['productName']}"),
                      subtitle: Text(
                        "${orderList['clientName']}",
                        style: TextStyle(color: Colors.blue),
                      ),
                      leading: CircleAvatar(
                        child: Text((index + 1).toString()),
                      ),
                      trailing: CircleAvatar(child: Icon(Icons.edit)),
                    ),
                  );
                },
              );
      },
    );
  }
}
