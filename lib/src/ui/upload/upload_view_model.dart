import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone_with_provider/src/model/Album.dart';
import 'package:photo_manager/photo_manager.dart';

class UploadViewModel extends ChangeNotifier {
  // 1. 권한을 확인해야됨.
  // 권한 거부됨 -> 설정을 열어줘야됨.
  // 권한이 허용됨 -> 갤러리에서 앨범 다 끌고옴

  final List<Album> _albums = [];

  final int _albumIndex = 0;

  List<Album> get albums => _albums;

  int get albumIndex => _albumIndex;

  Album get currentAlbum => _albums[_albumIndex];

  UploadViewModel() {
    _checkPermission();
  }

  void _checkPermission() async {
    final ps = await PhotoManager.requestPermissionExtend(
        requestOption: const PermissionRequestOption(
            androidPermission: AndroidPermission(
                type: RequestType.image, mediaLocation: true)));
    if (ps.isAuth) {
      // 앨범을 가져옴
      _getAlbums();
    } else {
      // 설정을 열어줌.
      PhotoManager.openSetting();
    }
  }

  void _getAlbums() async {
    final paths = await PhotoManager.getAssetPathList();
    for (AssetPathEntity entity in paths) {
      final images = await entity.getAssetListRange(start: 0, end: 10000);
      if (images.isNotEmpty) {
        // 앨범을 앱으로 가져오면 됨.
        final album = Album(id: entity.id, name: entity.name, images: images);
        _albums.add(album);
      }
    }
    notifyListeners();
  }
}
