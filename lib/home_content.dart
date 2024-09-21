import 'package:first_flutter_app/all_content.dart';
import 'package:first_flutter_app/music_content.dart';
import 'package:flutter/material.dart';

import 'modal/drawer_content.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeContentState();
  }
}

class _HomeContentState extends State<HomeContent> {
  String pressedType = Type.ALL.name;
  int selectedIndex = 0;
  static const List<Widget> _home_widget_options = <Widget>[
    AllContent(),
    MusicContent(),
    Text('Podcasts')
  ];

  static final List<DrawerContent> _drawerContent = [
    DrawerContent("Add Account", Icons.add),
    DrawerContent("What's New", Icons.format_list_bulleted),
    DrawerContent("Listening history", Icons.history_toggle_off),
    DrawerContent("Settings and privacy", Icons.settings),
  ];

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
        width: MediaQuery.of(context).size.width - 80,
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: DrawerHeader(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 18, bottom: 0),
                  margin: EdgeInsets.zero,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.deepPurple,
                            child: Text(
                              'T',
                              style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 1,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Suse-Medium'),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 12),
                            child: Column(
                              children: [
                                const Text(
                                  'Test User',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1,
                                      color: Colors.black,
                                      fontFamily: 'Roboto_Medium'),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // todo open profile screen
                                  },
                                  child: const Text(
                                    'View Profile',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 1,
                                        color: Colors.black54,
                                        fontFamily: 'Roboto_Regular'),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: _drawerContent.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(left: 12, right: 12, bottom: 24),
                      child: Row(
                        children: [
                          Icon(_drawerContent[index].icon,
                              size: 32, color: Colors.purple),
                          Container(
                            margin: const EdgeInsets.only(left: 12, right: 12),
                            child: Text(
                              _drawerContent[index].title,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Suse_Medium',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 42, left: 12, right: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Wrap content in Column
              children: [
                Row(
                  children: [
                    RawMaterialButton(
                      onPressed: () {
                        scaffoldKey.currentState?.openDrawer();
                      },
                      constraints:
                      const BoxConstraints(minHeight: 42, minWidth: 42),
                      shape: const CircleBorder(
                          side: BorderSide(color: Colors.white, width: 2)),
                      fillColor: Colors.deepPurple,
                      child: const Text(
                        "T",
                        style: TextStyle(
                            fontSize: 18,
                            letterSpacing: 1,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Suse-Medium'),
                      ),
                    ),
                    RawMaterialButton(
                      onPressed: () {
                        setState(() {
                          pressedType = Type.ALL.name;
                          selectedIndex = 0;
                        });
                      },
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          side: BorderSide(color: Colors.white, width: 0)),
                      fillColor: pressedType != Type.ALL.name
                          ? Colors.grey
                          : Colors.green,
                      child: const Text(
                        "All",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 1,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Regular'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      child: RawMaterialButton(
                        onPressed: () {
                          setState(() {
                            pressedType = Type.MUSIC.name;
                            selectedIndex = 1;
                          });
                        },
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            side: BorderSide(color: Colors.white, width: 0)),
                        fillColor: pressedType != Type.MUSIC.name
                            ? Colors.grey
                            : Colors.green,
                        child: const Text(
                          "Music",
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 1,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto_Regular'),
                        ),
                      ),
                    ),
                    RawMaterialButton(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      onPressed: () {
                        setState(() {
                          pressedType = Type.PODCASTS.name;
                          selectedIndex = 2;
                        });
                      },
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          side: BorderSide(color: Colors.white, width: 0)),
                      fillColor: pressedType != Type.PODCASTS.name
                          ? Colors.grey
                          : Colors.green,
                      child: const Text(
                        "Podcasts",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 1,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Regular'),
                      ),
                    )
                  ],
                ),
                IndexedStack(
                  index: selectedIndex,
                  children: _home_widget_options,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum Type { ALL, MUSIC, PODCASTS }
