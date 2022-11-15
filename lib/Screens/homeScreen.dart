import 'package:flutter/material.dart';
import 'package:people/Screens/HistoryMeetingScreen.dart';
import 'package:people/Screens/meeting_screen.dart';
import 'package:people/utils/colors.dart';
import 'package:people/custom_button.dart';
import '../resources/auth_methods.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }
  List<Widget> pages = [
    MeetingScreenPage(),
    const HistoryMeetingScreen(),
    const Text("Schedule Meeting"),
    CustomButton(text: 'Log Out', onPressed: () => AuthMethods().signOut()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text("Meet and Chat"),
        centerTitle: true,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onPageChanged,
        currentIndex: _page,
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank), label: "Meet and Chat"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Meet history"),
          BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock), label: "Meeting"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: "Settings"),
        ],
      ),
    );
  }
}
