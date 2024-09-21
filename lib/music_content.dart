import 'package:dio/dio.dart';
import 'package:first_flutter_app/modal/music_content_dto.dart';
import 'package:first_flutter_app/modal/test_content.dart';
import 'package:first_flutter_app/util/contants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'main.dart';
import 'modal/show_recent.dart';

class MusicContent extends StatefulWidget {
  const MusicContent({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MusicContentState();
  }
}

class _MusicContentState extends State<MusicContent> {
  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }
  final List<MusicContentDto> _music_Content_dto = [
    MusicContentDto("Recently Played", [
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
    ]),
    MusicContentDto("Artists", [
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
    ]),
    MusicContentDto("Suggestion", [
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
    ]),
  ];

  //We create a stream that will constantly read api data
  TestContent? apiData;

  Future<void> fetchData() async {
    const url = "https://api.spotify.com/v1/albums/4aawyAB9vmqN3uQ7FjRGTy";

// to get token from local storage
    var value = await storage.read(key: 'token');
    Map<String, String> headers = {"Authorization": "Bearer $value"};
    try {
      var response = await Dio().get(url,options: Options(headers: headers));
      if (response.statusCode == 200) {
        var data = response.data;
        setState(() {
          // apiData = TestContent(
          //   data["userId"],
          //   data["id"],
          //   data["title"],
          //   data["completed"],
          // );
          print(">>>>>>>>>>>>>>>>>>" + data);
        });
      }else {
        print(">>>>>>>>>>>>>>>>>>" + response.data);
      }
    } catch (e) {
      print(">>>>>>>>>>>>>>>>>EXCEPTION:  $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _music_Content_dto.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(alignment: Alignment.centerLeft, margin: const EdgeInsets.only(
                          bottom: 6, left: 12, right: 12, top: 12),
                        child: Text(
                          _music_Content_dto[index].title,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto_Medium',
                              fontSize: 18.sp,
                              letterSpacing: 1),
                        ),
                      ),
                      index == 0
                          ? GridView.count(
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              // Important to wrap content
                              // Disable GridView scrolling
                              childAspectRatio: 3.0,
                              // Adjust aspect ratio as needed
                              children: _music_Content_dto[index]
                                  .showRecentPlay
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
                                                width: MediaQuery.of(context).size.width > kTabletBreakpoint ? Adaptive.w(50) : 50,
                                                height: double.infinity,
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(left: 12, right: 12),
                                                child: Text(
                                                  show.title,
                                                  style:
                                                  TextStyle(fontSize: MediaQuery.of(context).size.width > kTabletBreakpoint ? Adaptive.sp(16) : 16,
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
                            )
                          : Container(
                              alignment: Alignment.centerLeft,
                              constraints: const BoxConstraints(
                                  maxHeight: 180, maxWidth: double.infinity),
                              margin: const EdgeInsets.only(top: 12),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _music_Content_dto[index]
                                      .showRecentPlay
                                      .length,
                                  shrinkWrap: true,
                                  // Important to wrap content
                                  itemBuilder: (context, recentIndex) {
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
                                                backgroundImage: NetworkImage(
                                                    _music_Content_dto[index]
                                                        .showRecentPlay[
                                                            recentIndex]
                                                        .imageUrl),
                                                backgroundColor:
                                                    Colors.transparent,
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.only(top: 6),
                                              child: Text(
                                                _music_Content_dto[index]
                                                    .showRecentPlay[recentIndex]
                                                    .title,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontFamily:
                                                        'Roboto_Regular',
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
                    ],
                  );
                }))
      ],
    );
  }
}
