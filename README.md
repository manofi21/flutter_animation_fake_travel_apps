# travel_guide_apps_animation
## Practice Flutter Animation
### Thank You diegoveloper for share his Tutorial 
https://www.youtube.com/watch?v=KZGi5kgnjbQ&t=148s

A new Flutter project.

## Add Image
create folder to save all images and regist in `pubspect.yaml`

```yaml
  assets:
    - assets/travel_photos/
```

## Create The Model
create a model to place the data to be displayed in the UI.
```dart
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
```