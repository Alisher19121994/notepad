import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notepad/pages/screens/home_page.dart';
import 'package:notepad/pages/screens/new_task_page.dart';
import 'package:notepad/pages/screens/sub_home_page.dart';
import 'package:notepad/splash/splash_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('notepad');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const SplashPage(),
      routes: {
        HomePage.id:(context)=> const HomePage(),
        NewTaskPage.id:(context)=> const NewTaskPage(),
        SubHomePage.id:(context)=> const SubHomePage(),
      },
    );
  }
}


