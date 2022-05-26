import 'package:flutter/material.dart';

import '../model/travel_photo.dart';

class TravelPhotosList extends StatelessWidget {
  const TravelPhotosList({Key? key, required this.onPhotoSelected}) : super(key: key);

  final void Function(TravelPhoto item) onPhotoSelected;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
