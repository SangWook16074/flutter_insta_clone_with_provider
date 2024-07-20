import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone_with_provider/src/widget/feed_box.dart';
import 'package:flutter_instagram_clone_with_provider/src/widget/image_avatar.dart';
import 'package:flutter_instagram_clone_with_provider/src/widget/image_data.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            _appBar(),
            _story(),
            _feeds(),
          ],
        ),
      ),
    );
  }

  Widget _appBar() => SliverAppBar(
        floating: true,
        title: ImageData(
          path: ImagePath.logo,
          width: 300,
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ImageData(
              path: ImagePath.active,
              width: 70,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ImageData(
              path: ImagePath.dm,
              width: 70,
            ),
          ),
        ],
      );

  Widget _story() => SliverToBoxAdapter(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            // 내 스토리 위젯 부분
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: ImageAvatar(
                type: ImageAvatarType.MYSTORY,
                size: 70,
                path:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnnnObTCNg1QJoEd9Krwl3kSUnPYTZrxb5Ig&s",
              ),
            ),
            ...List.generate(
                20,
                (index) => const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ImageAvatar(
                        type: ImageAvatarType.STORY,
                        size: 70,
                        path:
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnnnObTCNg1QJoEd9Krwl3kSUnPYTZrxb5Ig&s",
                      ),
                    )),
          ]),
        ),
      );

  Widget _feeds() => SliverList.builder(
        itemCount: 50,
        itemBuilder: (context, index) => const FeedBox(
          userThumnail:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnnnObTCNg1QJoEd9Krwl3kSUnPYTZrxb5Ig&s",
          images: [
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnnnObTCNg1QJoEd9Krwl3kSUnPYTZrxb5Ig&s",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnnnObTCNg1QJoEd9Krwl3kSUnPYTZrxb5Ig&s",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnnnObTCNg1QJoEd9Krwl3kSUnPYTZrxb5Ig&s",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnnnObTCNg1QJoEd9Krwl3kSUnPYTZrxb5Ig&s",
          ],
        ),
      );
}
