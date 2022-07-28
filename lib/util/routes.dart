import 'package:gamey_flutter/pages/signin/signin_page.dart';
import 'package:gamey_flutter/pages/signup/signup_page.dart';
import 'package:get/get.dart';

import '../pages/home/home_page.dart';

final appRoutes = [
  GetPage(
    name: "/",
    page: () => HomePage(),
  ),
  GetPage(
    name: "/signin",
    page: () => SignInPage(),
  ),
  GetPage(
    name: "/signup",
    page: () => SignUpPage(),
  ),
];
