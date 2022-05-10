import 'package:elegant/models/hotel_results.dart';
import 'package:elegant/services/hotel_service.dart';
import 'package:elegant/views/home/hotel_map_view.dart';
import 'package:elegant/views/home/hotel_view.dart';
import 'package:get/get.dart';

/// handle data in home views and related views
class HomeController extends GetxController{
  static HomeController to = Get.find();
  int selectedIndex = -1;
  final hotelList = <HotelData>[].obs;
  Future<void> fetchData()async{
    hotelList.value = await HotelService().getHotels();
  }

  /// navigate to hotel
  void navigateToHotel(int index){
    selectedIndex = index;
    Get.toNamed(HotelView.routeName);
  }

  /// navigate to map view
  void navigateToMap(){
    Get.toNamed(HotelMapView.routeName);
  }
}
