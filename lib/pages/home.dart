import 'package:dentsu_lms/constants/colors.dart';
import 'package:dentsu_lms/constants/funtions.dart';
import 'package:dentsu_lms/widgets/home.dart';
import 'package:dentsu_lms/widgets/leadsPage.dart';
import 'package:dentsu_lms/widgets/quotes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeWidget(),
    const LeadsPage(),
    const QuotesPage(),
    const Text('Profile Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: EasySearchBar(
        backgroundColor: primaryColor,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        showClearSearchIcon: true,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        searchBackIconTheme: const IconThemeData(color: Colors.white),
        searchClearIconTheme: const IconThemeData(color: Colors.white),
        putActionsOnRight: true,
        searchBackgroundColor: primaryColor,
        searchHintStyle: fontStyle(color: Colors.white),
        searchHintText: 'Type here...',
        actions: [
          const CircleAvatar(
            radius: 12,
            backgroundImage: NetworkImage(
              "https://lh3.googleusercontent.com/a/ACg8ocKSjXfgQFUQltPAkgQFI1ARnXXpmJEzX4xk64CHbHTHyPtn=s288-c-no",
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          )
        ],
        onSearch: (String) {},
        title: const SizedBox(),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Image.asset("assets/images/logo.png"),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_outlined),
            label: 'Group',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.gift),
            label: 'Leads',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: unselectedTabColor,
        selectedFontSize: 14.0,
        unselectedFontSize: 14.0,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }
}
