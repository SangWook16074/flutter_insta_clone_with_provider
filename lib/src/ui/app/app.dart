import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone_with_provider/src/ui/app/app_view_model.dart';
import 'package:flutter_instagram_clone_with_provider/src/ui/home/home_view.dart';
import 'package:flutter_instagram_clone_with_provider/src/ui/search/search_view.dart';
import 'package:flutter_instagram_clone_with_provider/src/widget/image_avatar.dart';
import 'package:flutter_instagram_clone_with_provider/src/widget/image_data.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AppViewModel>(context);
    return PopScope(
      canPop: viewModel.canPop,
      onPopInvoked: viewModel.back,
      child: Scaffold(
        body: _body(),
        bottomNavigationBar: _bottomNav(),
      ),
    );
  }

  Widget _body() => Consumer<AppViewModel>(builder: (context, provider, child) {
        return IndexedStack(
          index: provider.pageIndex,
          children: [
            const HomeView(),
            Navigator(
              key: provider.key,
              onGenerateRoute: (settings) {
                return MaterialPageRoute(
                    builder: (context) => const SearchView());
              },
            ),
            Container(
              color: Colors.yellow,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.black,
            ),
          ],
        );
      });

  Widget _bottomNav() =>
      Consumer<AppViewModel>(builder: (context, provider, child) {
        return BottomNavigationBar(
            currentIndex: provider.pageIndex,
            onTap: provider.changePage,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: ImageData(path: ImagePath.homeOff),
                  activeIcon: ImageData(path: ImagePath.homeOn),
                  label: ""),
              BottomNavigationBarItem(
                  icon: ImageData(path: ImagePath.searchOff),
                  activeIcon: ImageData(path: ImagePath.searchOn),
                  label: ""),
              BottomNavigationBarItem(
                  icon: ImageData(path: ImagePath.upload), label: ""),
              BottomNavigationBarItem(
                  icon: ImageData(path: ImagePath.reelsOff),
                  activeIcon: ImageData(path: ImagePath.reelsOn),
                  label: ""),
              const BottomNavigationBarItem(
                  icon: ImageAvatar(
                      type: ImageAvatarType.OFF,
                      path:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnnnObTCNg1QJoEd9Krwl3kSUnPYTZrxb5Ig&s",
                      size: 28),
                  activeIcon: ImageAvatar(
                    type: ImageAvatarType.ON,
                    path:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnnnObTCNg1QJoEd9Krwl3kSUnPYTZrxb5Ig&s",
                    size: 28,
                  ),
                  label: ""),
            ]);
      });
}
