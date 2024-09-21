import 'package:first_flutter_app/modal/show_recent.dart';
import 'package:first_flutter_app/util/contants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'modal/my_playlist.dart';

class AllContent extends StatefulWidget {
  const AllContent({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AllContentState();
  }
}

class _AllContentState extends State<AllContent> {
  final List<MyPlaylist> myPlaylist = [
    MyPlaylist("Show 1", 1, [
      "https://farm3.staticflickr.com/2220/1572613671_7311098b76_z_d.jpg",
      "https://i.imgur.com/OnwEDW3.jpg",
      "https://i.imgur.com/OB0y6MR.jpg",
      "https://farm4.staticflickr.com/3075/3168662394_7d7103de7d_z_d.jpg"
    ]),
    MyPlaylist("Show 2", 2, [
      "https://farm4.staticflickr.com/3752/9684880330_9b4698f7cb_z_d.jpg",
      "https://farm2.staticflickr.com/1449/24800673529_64272a66ec_z_d.jpg",
      "https://farm9.staticflickr.com/8295/8007075227_dc958c1fe6_z_d.jpg",
      "https://farm4.staticflickr.com/3224/3081748027_0ee3d59fea_z_d.jpg"
    ]),
    MyPlaylist("Show 3", 3, [
      "https://farm2.staticflickr.com/1090/4595137268_0e3f2b9aa7_z_d.jpg",
      "https://farm7.staticflickr.com/6089/6115759179_86316c08ff_z_d.jpg",
      "https://i.imgur.com/OnwEDW3.jpg",
      "https://farm3.staticflickr.com/2220/1572613671_7311098b76_z_d.jpg"
    ])
  ];
  final List<ShowRecent> recentShows = [
    ShowRecent(
      title: 'Show 1',
      imageUrl:
          'https://i.imgur.com/CzXTtJV.jpg', // Replace with actual image URLs
    ),
    ShowRecent(
      title: 'Show 2',
      imageUrl: 'https://i.imgur.com/OB0y6MR.jpg',
    ),
    ShowRecent(
      title: 'Show 3',
      imageUrl:
          'https://farm4.staticflickr.com/3075/3168662394_7d7103de7d_z_d.jpg',
    ),
    ShowRecent(
      title: 'Show 4',
      imageUrl:
          'https://farm9.staticflickr.com/8505/8441256181_4e98d8bff5_z_d.jpg',
    ),
    ShowRecent(
      title: 'Show 5',
      imageUrl: 'https://i.imgur.com/OnwEDW3.jpg',
    ),
    ShowRecent(
      title: 'Show 6',
      imageUrl:
          'https://farm3.staticflickr.com/2220/1572613671_7311098b76_z_d.jpg',
    ),
    // Add more shows as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          // Important to wrap content
          // Disable GridView scrolling
          childAspectRatio: 3.0,
          // Adjust aspect ratio as needed
          children: recentShows
              .map((show) => Expanded(
                    child: Card(
                      color: Colors.white,
                      clipBehavior: Clip.hardEdge,
                      elevation: 2,
                      child: Row(
                        children: [
                          Image.network(
                            show.imageUrl,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width >
                                    kTabletBreakpoint
                                ? Adaptive.w(50)
                                : 50,
                            height: double.infinity,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 12, right: 12),
                            child: Text(
                              show.title,
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width >
                                          kTabletBreakpoint
                                      ? Adaptive.sp(16)
                                      : 16,
                                  fontFamily: 'Roboto_Medium',
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(top: 12),
          child: Text(
            'Your favorite artists',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width > kTabletBreakpoint
                    ? Adaptive.sp(18)
                    : 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto_Medium',
                letterSpacing: 1,
                color: Colors.black),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          constraints:
              const BoxConstraints(maxHeight: 180, maxWidth: double.infinity),
          margin: const EdgeInsets.only(top: 12),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recentShows.length,
              shrinkWrap: true,
              // Important to wrap content
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // todo artist playlist
                  },
                  child: SizedBox(
                      child: Container(
                    margin: const EdgeInsets.only(left: 6),
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage:
                                NetworkImage(recentShows[index].imageUrl),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 6),
                          child: Text(
                            recentShows[index].title,
                            style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Roboto_Regular',
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  )),
                );
              }),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(top: 12),
          child: const Text(
            'Suggestions',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto_Medium',
                letterSpacing: 1,
                color: Colors.black),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          constraints:
              const BoxConstraints(maxHeight: 180, maxWidth: double.infinity),
          margin: const EdgeInsets.only(top: 12),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recentShows.length,
              shrinkWrap: true,
              // Important to wrap content
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // todo artist playlist
                  },
                  child: SizedBox(
                      child: Container(
                    margin: const EdgeInsets.only(left: 6),
                    child: Column(
                      children: [
                        Image.network(
                          recentShows[index].imageUrl,
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 6),
                          child: Text(
                            recentShows[index].title,
                            style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Roboto_Regular',
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  )),
                );
              }),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(top: 12, bottom: 12),
          child: const Text(
            'Your playlists',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto_Medium',
                letterSpacing: 1,
                color: Colors.black),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          constraints:
              const BoxConstraints(maxHeight: 240, minWidth: double.infinity),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: myPlaylist.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 180,
                      width: 180,
                      margin: const EdgeInsets.only(left: 6),
                      alignment: Alignment.topLeft,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: GridView.count(
                        padding: EdgeInsets.zero,
                        childAspectRatio: 1.0,
                        // Adjust the ratio as needed
                        clipBehavior: Clip.hardEdge,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        // Or set itemExtent
                        children: myPlaylist[index]
                            .images
                            .map((show) => Expanded(
                                    child: Image.network(
                                  show,
                                  fit: BoxFit.cover,
                                )))
                            .toList(),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      child: Text(
                        myPlaylist[index].title,
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Roboto_Regular',
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    )
                  ],
                );
              }),
        ),
      ],
    );
  }
}
