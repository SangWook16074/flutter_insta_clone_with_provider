import 'package:photo_manager/photo_manager.dart';

class Album {
  final String id;
  final String name;
  final List<AssetEntity> images;

  Album({
    required this.id,
    required this.name,
    required this.images,
  });
}
