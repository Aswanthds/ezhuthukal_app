import 'package:ezhuthukal_app/view/bottpm_nav.dart';
import 'package:ezhuthukal_app/view/home/home.dart';
import 'package:flutter/material.dart';


class MainPageNav extends StatefulWidget {
  
  const MainPageNav({super.key,});

  @override
  State<MainPageNav> createState() => _MainPageNavState();
}

class _MainPageNavState extends State<MainPageNav> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var pages = [
      HomePage(),
      const SearchPageScreen(),
      const NotificationsPage(),
      const ProfilePageScreen()
    ];
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, index, _) {
          return pages[index];
        },
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
