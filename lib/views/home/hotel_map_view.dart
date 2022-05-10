import 'package:elegant/models/hotel_results.dart';
import 'package:elegant/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import 'package:latlong2/latlong.dart';

class HotelMapView extends StatelessWidget {
  HotelMapView({Key? key}) : super(key: key);
  static const routeName = '/hotel_map_view';
  final HomeController _homeController = HomeController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Map')),
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  ///build body
  Widget _buildBody() {
    return Obx(() {
      final HotelData hotelData =
          _homeController.hotelList[_homeController.selectedIndex];
      final double latitude = hotelData.latitude ?? 0;
      final double longitude = hotelData.longitude ?? 0;
      return Column(
        children: [
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(latitude, longitude),
                zoom: 5.0,
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                  attributionBuilder: (_) {
                    return const Align(
                        alignment: Alignment.bottomCenter,
                        child: Text("© OpenStreetMap contributors"));
                  },
                ),
                MarkerLayerOptions(
                  markers: [
                    Marker(
                      width: ScreenUtil().screenWidth * 0.8,
                      height: 80.0,
                      point: LatLng(latitude, longitude),
                      builder: (ctx) => Column(
                        children: [
                          Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppBorderRadius.cardRadius .r)
                              ),
                              child: Padding(
                            padding: REdgeInsets.all(Insets.large .r),
                            child: Text(hotelData.address??''),
                          )),
                          const Icon(
                            Icons.pin_drop,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      );
    });
  }
}
