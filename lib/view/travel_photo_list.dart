import 'package:flutter/material.dart';
import 'package:travel_guide_apps_animation/view/travel_photo_list_item.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

import '../model/travel_photo.dart';

class TravelPhotosList extends StatefulWidget {
  const TravelPhotosList({Key? key, this.onPhotoSelected}) : super(key: key);

  final ValueChanged<TravelPhoto>? onPhotoSelected;

  @override
  State<TravelPhotosList> createState() => _TravelPhotosListState();
}

class _TravelPhotosListState extends State<TravelPhotosList> {
  final _animatedListKey = GlobalKey<AnimatedListState>();
  double page = 0.0;
  final _pageController = PageController();
  void _listendScroll() {
    setState(() {
      page = _pageController.page ?? 0;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_listendScroll);
  }

  @override
  void dispose() {
    _pageController.removeListener(_listendScroll);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _animatedListKey,
      physics: const PageScrollPhysics(),
      controller: _pageController,
      initialItemCount: travelPhotos.length,
      scrollDirection: Axis.horizontal,

      itemBuilder: (context, index, animation) {
        final travelPhoto = travelPhotos[index];

        final percent = page - page.floor();
        final factor = percent > 0.5 ? (1 - percent) : percent;
        return InkWell(
          onTap: () {
            travelPhotos.insert(travelPhotos.length, travelPhoto);
            _animatedListKey.currentState!.insertItem(travelPhotos.length - 1);
            final itemToDelete = travelPhoto;
            widget.onPhotoSelected!(travelPhoto);
            travelPhotos.removeAt(index);
            _animatedListKey.currentState!.removeItem(
              index,
              (context, animation) => FadeTransition(
                opacity: animation,
                child: SizeTransition(
                  sizeFactor: animation,
                  axis: Axis.horizontal,
                  child: TravelPhotoListItem(
                    travelPhoto: itemToDelete,
                  ),
                ),
              ),
            );
          },
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(
                vector.radians(90 * factor),
              ),
            child: TravelPhotoListItem(
              travelPhoto: travelPhoto,
            ),
          ),
        );
      },
    );
  }
}
