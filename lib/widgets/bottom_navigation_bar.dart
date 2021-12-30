import 'package:flutter/material.dart';
import 'package:reed/constants/colors.dart';
import 'package:reed/utils/size_config.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.widthPercent * 5,
        vertical: SizeConfig.heightPercent * 1,
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kSelectedIconColor,
        unselectedItemColor: kInactiveIconColor,
        selectedIconTheme: IconTheme.of(context).copyWith(
          color: kSelectedIconColor,
        ),
        unselectedIconTheme: IconTheme.of(context).copyWith(
          color: kInactiveIconColor,
        ),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        currentIndex: selectedItem,
        onTap: (index) {
          setState(() {
            selectedItem = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_music_rounded,
            ),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fiber_new_sharp,
            ),
            label: 'Hot',
          ),
        ],
      ),
    );
  }
}
