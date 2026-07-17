import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_font.dart';
import '../widgets/constants.dart';
import 'newsfeed_screen.dart';
import 'notification_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  final String profileName; 

  const HomeScreen({super.key, required this.profileName, required String username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late PageController _pageController;
  late List<Widget> pages;
  late List<String> appBarTitles;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

    appBarTitles = [
      'Kulitaptap',             // Home feed
      'Notifications',          // Notifications
      widget.profileName,       // Profile tab title
    ];

    pages = [
      const NewsFeedScreen(),
      NotificationScreen(),
      ProfileScreen(profileName: widget.profileName),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onNavBarTapped(int index) {
    _pageController.jumpToPage(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: YF_LIGHT,
        elevation: 2,
        title: CustomFont(
          text: appBarTitles[_selectedIndex],
          fontFamily: "Klavika",
          fontSize: 25.sp,
          color: YF_PRIMARY,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: YF_PRIMARY,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onNavBarTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
