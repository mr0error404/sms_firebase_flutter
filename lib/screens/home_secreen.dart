import 'package:flutter/material.dart';

class HomeSecreen extends StatefulWidget {
  const HomeSecreen({Key? key}) : super(key: key);

  @override
  State<HomeSecreen> createState() => _HomeSecreenState();
}

class _HomeSecreenState extends State<HomeSecreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}
