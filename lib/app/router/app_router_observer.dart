// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:starting_slicing/app/config/logger.dart';

// class AppRouteObserver extends AutoRouterObserver {
//   @override
//   Future<void> didPush(Route route, Route? previousRoute) async {
//     // final router = AutoRouter.of(route.navigator!.context);
//     // final authorized = await PreferenceHandler.retrieveToken();

//     // logger.i('IS LOGGED $authorized');
//     logger.d(
//       'New route pushed: ${previousRoute?.settings.name} => ${route.settings.name}',
//     );

//     // if (route.settings.name == SplashScreen.id && authorized != "") {
//     //   final String? role = await PreferenceHandler.retrieveRole();
//     //   logger.i('Role: $role');
//     // }
//   }

//   // The didPop method is commented out as it is not being used
//   // @override
//   // Future<void> didPop(Route route, Route? previousRoute) async {
//   // }

//   @override
//   void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
//     logger.d('Tab route visited: ${route.name}');
//   }

//   @override
//   void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
//     logger.d('Tab route re-visited: ${route.name}');
//   }
// }
