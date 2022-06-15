import 'package:flutter/material.dart';
import 'package:halopantai/controller/navbar_controller.dart';
import 'package:halopantai/view/explore_screen.dart';
import 'package:halopantai/view/favorite_screen.dart';
import 'package:halopantai/view/profile_screen.dart';
import 'package:provider/provider.dart';

class NavBar extends StatelessWidget {
  NavBar({Key? key}) : super(key: key);

  final _listScreen = [
    ExploreScreen(),
    FavoriteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NavBarController>(
      create: (context) => NavBarController(),
      child: Consumer<NavBarController>(
        builder: (context, navBarController, _) => Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore_outlined), label: 'Explore'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star_border), label: 'Favorite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline), label: 'Profile')
            ],
            currentIndex: navBarController.selectedTab,
            onTap: (value) => navBarController.selectedTab = value,
          ),
          body: _listScreen.elementAt(navBarController.selectedTab),
        ),
      ),
    );
  }
}
