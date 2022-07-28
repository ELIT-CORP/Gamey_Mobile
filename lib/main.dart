import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gamey_flutter/firebase_options.dart';
import 'package:gamey_flutter/pages/home/home_page.dart';
import 'package:get/get.dart';

import 'util/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GamEy',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      getPages: appRoutes,
      home: HomePage(),
    );
  }
}