import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:elegant/models/hotel_results.dart';
import 'package:flutter/cupertino.dart';


/// Api controller for hotels.json
class HotelService{

  /// fetch all hotels from server
  Future<List<HotelData>> getHotels()async{
    List<HotelData> hotels = <HotelData>[];
    try{
      final Response response =await Dio().get('https://dl.dropboxusercontent.com/s/6nt7fkdt7ck0lue/hotels.json');
      if(response.statusCode == 200){
        final HotelResult hotelResult = HotelResult.fromJson(jsonDecode(response.data));
        return hotelResult.data?? hotels;
      }
    }on Exception catch(e){
      debugPrint(e.toString());
    }
    return hotels;
  }
}
