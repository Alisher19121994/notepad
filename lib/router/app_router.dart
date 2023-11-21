//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../features/splash/presentation/pages/splash_page.dart';
// import '../injector_container.dart';
//
// //part 'name_routes.dart';
//
// final rootNavigatorKey = GlobalKey<NavigatorState>();
// final localSource = sl<LocalSource>();
//
// final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
//
// final Chuck chuck = Chuck(navigatorKey: rootNavigatorKey);
//
// sealed class AppRoutes {
//   AppRoutes._();
//
//   static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case Routes.initial:
//         return MaterialPageRoute(
//           builder: (_) => BlocProvider(
//             create: (context) => SplashBloc(),
//             child: const SplashPage(),
//           ),
//         );
//       case Routes.home:
//         return MaterialPageRoute(
//           builder: (_) => BlocProvider(
//             create: (context) =>
//             sl<HomeBloc>()..add(const FetchCurrencyEvent()),
//             child: const HomePage(),
//           ),
//         );
//     }
//     return null;
//   }
// }
//
// class FadePageRoute<T> extends PageRouteBuilder<T> {
//   FadePageRoute({required this.builder})
//       : super(
//     pageBuilder: (
//         context,
//         animation,
//         secondaryAnimation,
//         ) =>
//         builder(context),
//     transitionsBuilder: (
//         context,
//         animation,
//         secondaryAnimation,
//         child,
//         ) =>
//         FadeTransition(
//           opacity: animation,
//           child: child,
//         ),
//   );
//   final WidgetBuilder builder;
//
//   @override
//   bool get maintainState => true;
//
//   @override
//   Duration get transitionDuration => const Duration(milliseconds: 1000);
// }