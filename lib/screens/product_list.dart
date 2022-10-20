import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Widgets/loader.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var Products = FirebaseFirestore.instance.collection("Products");
    return StreamBuilder(
        stream: Products.snapshots(),
        builder: (context, snapshot) {
          print(snapshot.data?.docs[0]["name"] ?? "");
          return Scaffold(
            appBar: AppBar(),
            body: (snapshot.connectionState == ConnectionState.done)
                ? ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(snapshot.data?.docs[index]["img"]),
                          ),
                          title: Text(snapshot.data?.docs[index]["name"]),
                          trailing: Text(snapshot.data?.docs[index]["price"]),
                        ))
                : LoaderWidget(
                    color: Colors.black,
                  ),
          );
        });
  }
}
