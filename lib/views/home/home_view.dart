import 'package:elegant/constants/constants.dart';
import 'package:elegant/models/hotel_results.dart';
import 'package:elegant/utils/authentication_manager.dart';
import 'package:elegant/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../components/app_network_image.dart';
import '../login/login_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  static const routeName = '/home';
  final HomeController _homeController = HomeController.to;
  final AuthenticationManager _authenticationManager = AuthenticationManager.to;
  final LoginController _loginController = LoginController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('List View')),
      body: SafeArea(
        child: Padding(
          padding:
              REdgeInsets.symmetric(horizontal: Insets.horizontalScreenPadding),
          child: _buildBody(),
        ),
      ),
    );
  }

  ///build body
  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildUser(),
          _buildContent()],
      ),
    );
  }
  Widget _buildUser(){
    return Column(
      children: [
        SizedBox(height: Insets.medium .r),
        Text(_authenticationManager.getName()??'',style:  Get.textTheme.titleLarge,),
        SizedBox(height: Insets.medium .r),
        Text(_authenticationManager.getEmail()??'',style: Get.textTheme.bodyMedium,),
        SizedBox(
            width: ScreenUtil().screenWidth * 0.5,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Get.theme.primaryColor),
                onPressed: _loginController.logOut, child: const Text('Logout'))),
        SizedBox(height: Insets.medium .r),
      ],
    );
  }

  ///build hotel list
  Widget _buildContent() {
    return Obx(
      () {
        final List<HotelData> hotelList = _homeController.hotelList;
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemBuilder: (BuildContext context, int index) {
            final HotelData hotelData = hotelList[index];
            return ListTile(
              onTap: () => _homeController.navigateToHotel(index),
              leading:  AspectRatio(
                aspectRatio: 1/1,
                child: ClipOval(
                  child: AppNetworkImage(imageUrl: hotelData.image?.small??''),
                ),
              ),
              contentPadding: EdgeInsets.zero,
              isThreeLine: true,
              title: Text(hotelData.title ?? ''),
              subtitle: Text(hotelData.address ?? ''),
            );
          },
          itemCount: hotelList.length,
        );
      },
    );
  }
}
