import 'package:elegant/views/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/constants.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  static const routeName = '/login';
  final LoginController _controller = LoginController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: REdgeInsets.symmetric(
                horizontal: Insets.horizontalScreenPadding),
           child: Center(
             child: ElevatedButton(
               onPressed: _controller.loginWithFacebook,
               child: const Text('Continue with Facebook'),
             ),
           ),
        ),
      ),
    );
  }
}
