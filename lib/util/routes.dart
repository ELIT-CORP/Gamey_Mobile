import 'package:gamey_flutter/pages/signin/signin_page.dart';
import 'package:gamey_flutter/pages/signup/signup_page.dart';
import 'package:get/get.dart';

import '../pages/game/character/attributes/char_attributes_page.dart';
import '../pages/game/character/selection/char_selection_page.dart';
import '../pages/game/webview/webview_page.dart';
import '../pages/home/home_page.dart';

final appRoutes = [
  GetPage(
    name: "/",
    page: () => Home(),
  ),
  GetPage(
    name: "/signin",
    page: () => SignIn(),
  ),
  GetPage(
    name: "/signup",
    page: () => SignUp(),
  ),
  GetPage(
    name: "/selection",
    page: () => const CharSelection(),
  ),
  GetPage(
    name: "/attributes",
    page: () => const CharAttributes(),
  ),
  GetPage(
    name: "/webview",
    page: () => WebViewPage(),
  ),
];
