import 'package:first_flutter_app/home_content.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int selectedItemIndex = 0;

  // List of widgets for each page
  static const List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    Text('Search'),
    Text('Your Library'),
    Text('Premium'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontFamily: 'Roboto_Medium',
            letterSpacing: 1,
            fontWeight: FontWeight.w500),
        currentIndex: selectedItemIndex,
        onTap: (value) => {
          setState(() {
            selectedItemIndex = value;
          })
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 24,
              ),
              label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_add_check_outlined), label: 'Liabrary'),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions_outlined), label: 'Premium'),
        ],
      ),
      body: IndexedStack(
        index: selectedItemIndex,
        children: _widgetOptions,
      ),
    );
  }
}
