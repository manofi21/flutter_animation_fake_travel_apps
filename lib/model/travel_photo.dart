class TravelPhoto {
  const TravelPhoto({
    required this.backImage,
    required this.frontImage,
    required this.name,
    required this.photos,
  });

  final String backImage;
  final String frontImage;
  final String name;
  final int photos;
}

final travelPhotos = [
  const TravelPhoto(
    backImage: 'assets/travel_photos/japan_backImage.png',
    frontImage: 'assets/travel_photos/japan_frontImage.png',
    name: "Japan",
    photos: 3,
  ),
  const TravelPhoto(
    backImage: 'assets/travel_photos/kuala_lumpur_backImage.png',
    frontImage: 'assets/travel_photos/kuala_lumpur_frontImage.png',
    name: "Kuala Lumpur",
    photos: 30,
  ),
];
