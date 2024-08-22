import 'package:get/get.dart';
import 'package:project_eek/screens/home.dart';
import 'package:project_eek/screens/login.dart';

final List<GetPage> pages = [
  GetPage(name: '/', page: () => const HomeScreen(), transition: Transition.fadeIn),
  GetPage(name: '/login', page: () => const LoginScreen(), transition: Transition.fadeIn),
];
