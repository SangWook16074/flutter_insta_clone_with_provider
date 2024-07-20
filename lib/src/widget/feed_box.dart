import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone_with_provider/src/widget/image_avatar.dart';
import 'package:flutter_instagram_clone_with_provider/src/widget/image_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FeedBox extends StatefulWidget {
  final String userThumnail;
  final List<String> images;
  const FeedBox({super.key, required this.userThumnail, required this.images});

  @override
  State<FeedBox> createState() => _FeedBoxState();
}

class _FeedBoxState extends State<FeedBox> {
  int _imageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _header(),
        _images(),
        _options(),
        _description(),
        _comment(),
      ],
    );
  }

  Widget _header() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            // 사용자 프로필
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4.0,
              ),
              child: ImageAvatar(
                path: widget.userThumnail,
                type: ImageAvatarType.OFF,
                size: 35,
              ),
            ),
            // 사용자 이름
            const Text(
              "data",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: Icon(Icons.more_horiz),
            ),
            // ...
          ],
        ),
      );

  Widget _images() => CarouselSlider(
        options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                _imageIndex = index;
              });
            },
            aspectRatio: 1,
            viewportFraction: 1,
            enableInfiniteScroll: false),
        items: widget.images.map((url) {
          return Builder(
            builder: (BuildContext context) {
              return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CachedNetworkImage(
                    imageUrl: url,
                    fit: BoxFit.cover,
                  ));
            },
          );
        }).toList(),
      );

  Widget _options() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ImageData(
                    path: ImagePath.likeOffIcon,
                    width: 80,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ImageData(
                    path: ImagePath.replyIcon,
                    width: 80,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ImageData(
                    path: ImagePath.dm,
                    width: 80,
                  ),
                ),
              ],
            ),
            AnimatedSmoothIndicator(
              activeIndex: _imageIndex,
              count: widget.images.length,
              effect: const ScrollingDotsEffect(
                  activeDotScale: 1,
                  activeDotColor: Colors.blue,
                  dotWidth: 6.0,
                  dotHeight: 6.0),
            ),
            Row(
              children: [
                Opacity(
                  opacity: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ImageData(
                      path: ImagePath.bookMarkOffIcon,
                      width: 80,
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ImageData(
                      path: ImagePath.bookMarkOffIcon,
                      width: 80,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ImageData(
                    path: ImagePath.bookMarkOffIcon,
                    width: 80,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget _description() => const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  "사용자님 외 여러 명이 좋아합니다",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: ExpandableText(
              "컨텐츠 1입니다.\n컨텐츠 1입니다.\n컨텐츠 1입니다.\n컨텐츠 1입니다\n",
              expandText: '더보기',
              collapseText: '접기',
              prefixText: "data",
              prefixStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              linkColor: Colors.grey,
            ),
          )
        ],
      );

  Widget _comment() => GestureDetector(
        onTap: showCommentModalBottomSheet,
        child: const Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "댓글 6개 모두 보기",
                style: TextStyle(fontSize: 17, color: Colors.grey),
              ),
            ),
          ],
        ),
      );

  void showCommentModalBottomSheet() {
    showModalBottomSheet(
        context: context,
        showDragHandle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.0))),
        builder: (context) => Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Opacity(
                        opacity: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ImageData(path: ImagePath.dm),
                        ),
                      ),
                      const Text(
                        '댓글',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ImageData(path: ImagePath.dm),
                      ),
                    ],
                  )
                ],
              ),
            ));
  }
}
