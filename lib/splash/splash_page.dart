import 'package:flutter/material.dart';
import 'package:notepad/components/compnents.dart';
import 'package:notepad/pages/screens/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static const String id = 'SplashPage';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1)).then((value) =>
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
                (route) => false));
    return Scaffold(
      backgroundColor: const Color(0xffe7effa),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: Image.asset(
            ImageApp.todo,
          ),
        ),
      ),
    );
  }
}
