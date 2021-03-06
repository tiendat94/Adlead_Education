import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter_app/views/download/download_view.dart';
import 'package:video_player/video_player.dart';

class CourseDetail extends StatefulWidget {
  @override
  _courseDetail createState() {
    // TODO: implement createState
    return _courseDetail();
  }
}

class _courseDetail extends State<CourseDetail> {
  int _indexSelected = 0;
  TabController controller;
  final List<String> option = [
    'Discuss',
    'Intro',
    'Question',
  ];

  final _pageoption = [TestVideoApp(), GiaodichApp(), GiaodichApp()];
  ChewieController _chewieController;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _chewieController = ChewieController(
        videoPlayerController: VideoPlayerController.network(
            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
        aspectRatio: 16 / 9,
        autoPlay: false,
        autoInitialize: true,
        looping: true,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(errorMessage),
          );
        });
  }

  void _onItemTapped(int index) {
    setState(() {
      _indexSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 23,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context)),
        title: Container(
          padding: EdgeInsets.only(right: 35),
          alignment: Alignment.center,
          child: Text("Course Detail"),
        ),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Kỹ năng quản lý thời gian",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text("Giảng viên - Nguyễn Huy Anh"),
                Row(
                  children: <Widget>[
                    Expanded(flex: 1, child: Text("Ngày bắt đầu: 01/01/2020")),
                    Expanded(flex: 1, child: Text("Ngày kết thúc: 01/05/2020")),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Chewie(
                  controller: _chewieController,
                ),
                Container(
                  height: 40.0,
                  color: Colors.white,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: option.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () {
                              _onItemTapped(index);
                            },
                            child: Container(
                                width: 130,
                                color: index == _indexSelected
                                    ? Colors.black12
                                    : Colors.white,
                                height: 40.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      option[index],
                                      style: TextStyle(
                                          color: index == _indexSelected
                                              ? Colors.blue
                                              : Colors.red,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                  ],
                                )));
                      }),
                ),
                Container(
                  padding: EdgeInsets.only(top: 4),
                  height: 425,
                  child: _pageoption[_indexSelected],
                )
              ],
            ),
          )),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
    _chewieController.dispose();
  }
}
