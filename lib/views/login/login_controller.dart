import 'package:elegant/utils/authentication_manager.dart';
import 'package:elegant/views/home/home_controller.dart';
import 'package:elegant/views/home/home_view.dart';
import 'package:elegant/views/login/login_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController to = Get.find();
  final AuthenticationManager _authenticationManager = AuthenticationManager.to;
  final HomeController _homeController = HomeController.to;
  Future<void> loginWithFacebook() async {
    AccessToken? _accessToken;
    final LoginResult result = await FacebookAuth.instance
        .login(); // by default we request the email and the public profile

    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;
      // get the user data
      // by default we get the userId, email,name and picture
      final userData = await FacebookAuth.instance.getUserData();
      _authenticationManager.saveUserData(_accessToken?.token ?? '',
          userData['name'] ?? '', userData['email'] ?? '');
      await _homeController.fetchData();
      Get.offAndToNamed(HomeView.routeName);
    } else {
      debugPrint(result.status.toString());
      debugPrint(result.message);
    }
  }

  Future<void> logOut() async {
    _authenticationManager.remove();
    await FacebookAuth.instance.logOut();

    Get.offAllNamed(LoginView.routeName);
  }
}
