import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/product.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  String? src = null;
  Product prd = Product(id: "", name: "name", img: "", price: 1, quantity: 1);
  var FormKey = GlobalKey<FormState>();
  saveForm() {
    FormKey.currentState?.save();
    FirebaseFirestore.instance
        .collection("Products")
        .add({
          "name": prd.name,
          "img": prd.img,
          "price": prd.price,
          "quantity": prd.quantity,
        })
        .then((value) => Navigator.of(context).pushNamed("/products"))
        .onError((error, stackTrace) => print(error.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Form(
            key: FormKey,
            child: ListView(children: [
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(label: Text("Name")),
                onSaved: (newValue) {
                  prd.name = newValue!;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(label: Text("Price")),
                onSaved: (newValue) {
                  prd.price = int.parse(newValue!);
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(label: Text("Quantity")),
                onSaved: (newValue) {
                  prd.quantity = int.parse(newValue!);
                },
              ),
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 200,
                    child: (src == null || src!.isEmpty)
                        ? Text('No image yet')
                        : Image.network(src!),
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(label: Text("ImageUrl")),
                      onSaved: (newValue) {
                        prd.img = newValue!;
                      },
                      onChanged: (val) {
                        setState(() {
                          src = val;
                        });
                      },
                    ),
                  ),
                ],
              ),
              ElevatedButton(onPressed: saveForm, child: Text("Send"))
            ]),
          )),
    );
  }
}
