import 'package:cody/utls/Routing.dart';
import 'package:cody/utls/simple_bloc_opserviers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common wedgit/servies_locator.dart';

Future<void> main() async {
  Bloc.observer = Observer();

  setUp();
  runApp( MyApp(appRouter: AppRouter(),));
  await firstRun();
}

class MyApp extends StatelessWidget {
//  static String token ='';
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.generateRoute,
      title: 'Cody',
      debugShowCheckedModeBanner: false,
    );
  }
}

