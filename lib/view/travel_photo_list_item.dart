import 'package:flutter/material.dart';

import '../model/travel_photo.dart';

class TravelPhotoListItem extends StatelessWidget {
  const TravelPhotoListItem({Key? key, required this.travelPhoto})
      : super(key: key);
  final TravelPhoto travelPhoto;
  @override
  Widget build(BuildContext context) {
    // return Image.asset(
    //   travelPhoto.frontImage,
    //   // fit: BoxFit.cover,
    // );
    return SizedBox(
      width: 200,
      height: 200,
      child: Image.asset(travelPhoto.backImage),
    );
  }
}
