import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'features/home/data/global_models/models/adapter.dart';
import 'features/home/presentation/bloc/controller/control_home.dart';
import 'features/home/presentation/pages/screens/home_page.dart';
import 'features/home/presentation/pages/screens/morePage/hand_writing.dart';
import 'features/home/presentation/pages/screens/new_task_page.dart';
import 'features/home/presentation/pages/screens/sub_home_page.dart';
import 'features/home/presentation/pages/screens/update_page.dart';
import 'features/splash/presentation/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await EasyLocalization.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  //await Hive.openBox<Notes>('notepad');
  Hive.registerAdapter(NotesAdapter());
  runApp(
    // ChangeNotifierProvider<HomeController>(
    //   create: (_) => HomeController()..initialize(),
    //   child: const MyApp(),
    // ),
    EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('de', 'DE'),
          Locale('ru', 'RU'),
          Locale('ar', 'AR'),
          Locale('es', 'ES'),
          Locale('zh', 'CN'),
          Locale('uz', 'UZ'),
          Locale('fr', 'FR'),
          Locale('ko', 'KO'),
          Locale('ja', 'JA'),
        ],
        path: 'assets/translations',
        // <-- change the path of the translation files
        fallbackLocale: const Locale('en', 'US'),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  //  return Consumer<HomeController>(builder: (context, value, child) {
      return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        // standard dark theme
      //  themeMode: value.themeMode,
        home: const SplashPage(),
        routes: {
          HomePage.id: (context) => const HomePage(),
          NewTaskPage.id: (context) => const NewTaskPage(),
          HandWritingPage.id: (context) => const HandWritingPage(),
          UpdatePage.id: (context) => const UpdatePage(
                title: '',
                descriptionOfTask: '',
                timeOfTask: '',
                dateOfTask: '',
                index: 0,
              ),
          SubHomePage.id: (context) => const SubHomePage(
                title: '',
                description: '',
                time: '',
                dates: '',
              ),
        },
      );
  //  });
  }
}
