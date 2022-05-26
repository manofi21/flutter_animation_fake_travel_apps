import 'package:flutter/material.dart';
import 'package:travel_guide_apps_animation/model/travel_photo.dart';

class TravelPhotoDetails extends StatefulWidget {
  const TravelPhotoDetails({
    Key? key,
    required this.travelPhoto,
  }) : super(key: key);
  final TravelPhoto travelPhoto;

  @override
  State<TravelPhotoDetails> createState() => _TravelPhotoDetailsState();
}

class _TravelPhotoDetailsState extends State<TravelPhotoDetails>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final _movement = -100.0;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              left: _movement * _controller.value,
              right: _movement * (1 - _controller.value),
              child: Image.asset(
                widget.travelPhoto.backImage,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 40,
              left: 10,
              right: 10,
              height: 100,
              child: FittedBox(
                child: Text(
                  widget.travelPhoto.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              left: _movement * _controller.value,
              right: _movement * (1 - _controller.value),
              child: Image.asset(
                widget.travelPhoto.frontImage,
                fit: BoxFit.cover,
              ),
            )
          ],
        );
      },
    );
  }
}
