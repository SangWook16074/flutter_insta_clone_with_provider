import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone_with_provider/src/ui/search/search_focus_view.dart';
import 'package:flutter_instagram_clone_with_provider/src/utils/animation_route.dart';
import 'package:flutter_instagram_clone_with_provider/src/widget/image_data.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            _appBar(),
            _imageGrid(),
          ],
        ),
      ),
    );
  }

  Widget _appBar() => SliverAppBar(
        floating: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context)
                .push(AnimationRoute(const SearchFocusView())),
            child: Container(
                height: 50,
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xffefefef),
                    borderRadius: BorderRadius.circular(8.0)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      Text(
                        "검색",
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      )
                    ],
                  ),
                )),
          ),
        ),
      );

  Widget _imageGrid() => SliverGrid.builder(
      itemCount: 40,
      gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 3,
          pattern: [
            //
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(2, 1),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 1),
            //
            const QuiltedGridTile(2, 1),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 1),
          ],
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0),
      itemBuilder: (context, index) => Container(
            color: Colors.blue,
          ));
}
