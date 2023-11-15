import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notepad/models/adapter.dart';
import 'package:notepad/pages/screens/home_page.dart';
import 'package:notepad/pages/screens/new_task_page.dart';
import 'package:notepad/pages/screens/sub_home_page.dart';
import 'package:notepad/pages/screens/update_page.dart';
import 'package:notepad/splash/splash_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'controller/control_home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  Hive.registerAdapter(NotesAdapter());
  runApp(
    ChangeNotifierProvider<HomeController>(
      create: (_) => HomeController()..initialize(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
        builder: (context, value, child) {
          return MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(), // standard dark theme
            themeMode: value.themeMode,
            home: const SplashPage(),
            routes: {
              HomePage.id:(context)=> const HomePage(),
              NewTaskPage.id:(context)=> const NewTaskPage(),
              UpdatePage.id:(context)=>  UpdatePage(descriptionOfTask: '', timeOfTask: '', dateOfTask: '', index: 0,),
              SubHomePage.id:(context)=> SubHomePage(description: '', time: '', dates: '',),
            },
          );
        });

  }
}


