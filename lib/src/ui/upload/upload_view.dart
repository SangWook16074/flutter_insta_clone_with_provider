import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone_with_provider/src/widget/image_data.dart';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          _preview(),
          _header(),
          _images(),
        ],
      ),
    );
  }

  AppBar _appBar() => AppBar(
        foregroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "새 게시물",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        ),
        actions: const [
          Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "다음",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      );

  Widget _preview() => AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          width: double.infinity,
          color: Colors.black,
        ),
      );

  Widget _header() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text(
                  "Recent",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                ImageData(path: ImagePath.arrowDownIcon)
              ],
            ),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                  color: Color(0xff808080),
                  shape: BoxShape.circle,
                ),
                child: ImageData(
                  path: ImagePath.imageSelectIcon,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                  color: Color(0xff808080),
                  shape: BoxShape.circle,
                ),
                child: ImageData(
                  path: ImagePath.cameraIcon,
                ),
              ),
            ],
          )
        ],
      );

  Widget _images() => Expanded(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, mainAxisSpacing: 1.0, crossAxisSpacing: 1.0),
          itemCount: 50,
          itemBuilder: (context, index) => Container(
                color: Colors.blue,
              )));
}
