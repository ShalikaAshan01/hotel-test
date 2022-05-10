import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///A network widget for whole app
class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({Key? key,required this.imageUrl}) : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: imageUrl,
      placeholder: (BuildContext context,_)=>Card(color: Get.theme.primaryColorDark,shape: const CircleBorder()),
      errorWidget: (BuildContext context,para1,para2)=>const Icon(Icons.error),
    );
  }
}
