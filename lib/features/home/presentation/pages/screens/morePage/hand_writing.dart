import 'package:flutter/material.dart';

class HandWritingPage extends StatefulWidget {
  const HandWritingPage({super.key});
  static const String id = 'HandWritingPage';
  @override
  State<HandWritingPage> createState() => _HandWritingPageState();
}

class _HandWritingPageState extends State<HandWritingPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffe7effa),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xff699BE0),
        title:  const Text(
          'Hand writing',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        )
      )
    );
  }
}
