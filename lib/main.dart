import 'package:elegant/constants/app_routes.dart';
import 'package:elegant/utils/authentication_manager.dart';
import 'package:elegant/views/home/home_controller.dart';
import 'package:elegant/views/home/home_view.dart';
import 'package:elegant/views/login/login_view.dart';
import 'package:elegant/views/splash_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:device_preview/device_preview.dart';

import 'constants/app_themes.dart';
import 'views/login/login_controller.dart';

void main() async {
  await GetStorage.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  _registerGetX();
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(), // Wrap your app
  ));
}

// register all getx controllers
void _registerGetX() {
   Get.put<AuthenticationManager>(AuthenticationManager());
   Get.put<HomeController>(HomeController());
   Get.put<LoginController>(LoginController());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: ThemeMode.system,
          initialRoute: "/",
          builder: DevicePreview.appBuilder,
          getPages: AppRoutes.routes,
        );
      },
      child: Root(),
    );
  }
}

class Root extends StatelessWidget {
  Root({Key? key}) : super(key: key);
  static const String routeName = '/';

  final AuthenticationManager _authManager = AuthenticationManager.to;
  final HomeController _homeController = HomeController.to;

  Future<void> initializeSettings() async {
    bool logged = _authManager.checkLoginStatus();
    if(logged) {
      _homeController.fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashView();
        } else {
          if (snapshot.hasError) {
            return LoginView();
          } else {
            /// based on the login status user will navigate to the home page or login page
            return Obx(() => _authManager.isLogged.value?  HomeView(): LoginView());
          }
        }
      },
    );
  }
}
