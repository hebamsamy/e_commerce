import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("Welcome to Our Store")),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "t",
            child: Icon(Icons.list),
            onPressed: () {
              Navigator.of(context).pushNamed("/products");
            },
          ),
          FloatingActionButton(
            heroTag: "s",
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed("/add");
            },
          ),
        ],
      ),
    );
  }
}
