import 'package:elegant/models/hotel_results.dart';
import 'package:elegant/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../components/app_network_image.dart';

class HotelView extends StatelessWidget {
  HotelView({Key? key}) : super(key: key);
  static const routeName = '/hotel_view';
  final HomeController _homeController = HomeController.to;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        _homeController.selectedIndex = -1;
        return true;
      },
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('Details'),actions: [
          IconButton(onPressed: _homeController.navigateToMap, icon: const Icon(Icons.pin_drop))
        ]),
        body: SafeArea(
          child: Padding(
            padding:
            REdgeInsets.symmetric(horizontal: Insets.horizontalScreenPadding),
            child: _buildBody(),
          ),
        ),
      ),
    );
  }

  ///build body
  Widget _buildBody() {
    return SingleChildScrollView(
      child: Obx(() {
        final HotelData hotelData = _homeController.hotelList[_homeController.selectedIndex];
        return Column(
          children: [
            SizedBox(
                height: 250.w,
                child: AppNetworkImage(imageUrl: hotelData.image?.large??'')),
            SizedBox(width: Insets.verticalBetweenPadding.h,),
            Text(hotelData.title??'',style: Get.theme.textTheme.headlineMedium,textAlign: TextAlign.center,),
            SizedBox(height: Insets.verticalBetweenPadding.h,),
            Text(hotelData.description??'',style: Get.theme.textTheme.bodySmall),
          ],
        );
      }),
    );
  }

}
