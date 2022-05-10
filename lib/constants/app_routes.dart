import 'package:elegant/views/home/home_view.dart';
import 'package:elegant/views/home/hotel_map_view.dart';
import 'package:elegant/views/home/hotel_view.dart';
import 'package:elegant/views/login/login_view.dart';
import 'package:elegant/views/splash_view.dart';
import 'package:get/get.dart';

import '../main.dart';


class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(name: Root.routeName, page: () => Root()),
    GetPage(name: HomeView.routeName, page: () => HomeView()),
    GetPage(name: HotelView.routeName, page: () => HotelView()),
    GetPage(name: HotelMapView.routeName, page: () => HotelMapView()),
    GetPage(name: LoginView.routeName, page: () => LoginView()),
    GetPage(name: SplashView.routeName, page: () => const SplashView()),
  ];
}
