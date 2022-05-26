import 'package:flutter/material.dart';
import 'package:travel_guide_apps_animation/model/travel_photo.dart';
import 'package:travel_guide_apps_animation/view/travel_photo_details.dart';
import 'package:travel_guide_apps_animation/view/travel_photo_list.dart';

import 'fake_review.dart';

class TravelPhotosHome extends StatefulWidget {
  const TravelPhotosHome({Key? key}) : super(key: key);

  @override
  State<TravelPhotosHome> createState() => _TravelPhotosHomeState();
}

class _TravelPhotosHomeState extends State<TravelPhotosHome> {
  @override
  Widget build(BuildContext context) {
    TravelPhoto _selected = travelPhotos.last;

    final size = MediaQuery.of(context).size;
    final topCardHeight = size.height / 2;
    const horizontalListHeight = 160.0;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            height: topCardHeight,
            left: 0,
            right: 0,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 700),
              child: TravelPhotoDetails(
                key: Key(_selected.name),
                travelPhoto: _selected,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: topCardHeight - horizontalListHeight / 3,
            height: horizontalListHeight,
            // child: Container(
            //   width: 200,
            //   height: 200,
            //   color: Colors.red,
            // ),
            child: TravelPhotosList(
              onPhotoSelected: (item) {
                setState(() {
                  _selected = item;
                });
              },
            ),
          ),
          Positioned(
            top:
                topCardHeight - horizontalListHeight / 3 + horizontalListHeight,
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Recommendation',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    FakeReview()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
