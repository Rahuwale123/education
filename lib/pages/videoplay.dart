import 'package:flutter/material.dart';
import 'package:login/pages/home.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:login/data/courses.dart';

import 'chat.dart';

class YoutubePlayerScreen extends StatefulWidget {
  final String id;
  final String userInterest;
  final VoidCallback? onClose;
  const YoutubePlayerScreen({
    Key? key,
    required this.id,
    required this.userInterest,
    this.onClose,
  }) : super(key: key);
  @override
  State<YoutubePlayerScreen> createState() => _YoutubePlayerScreenState();
}

class _YoutubePlayerScreenState extends State<YoutubePlayerScreen> {
  late YoutubePlayerController _controller;
  List<dynamic> filteredCourses = [];
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      params: YoutubePlayerParams(
        showControls: true,
        mute: false,
        enableJavaScript: true,
        playsInline: true,
        showFullscreenButton: true,
      ),
    );
    _controller.loadVideoById(videoId: widget.id);
    filterCourses();
  }

  void filterCourses() {
    switch (widget.userInterest.toLowerCase()) {
      case 'html':
        filteredCourses = html;
        break;
      case 'react':
        filteredCourses = react;
        break;
      case 'python':
        filteredCourses = python;
        break;
      case 'css':
        filteredCourses = css;
        break;
      case 'js':
        filteredCourses = js;
        break;
      case 'node':
        filteredCourses = node;
        break;
      case 'angular':
        filteredCourses = angular;
        break;
      case 'java':
        filteredCourses = java;
        break;
      case 'ai':
        filteredCourses = ai;
        break;
      case 'ml':
        filteredCourses = ml;
        break;
      case 'ruby':
        filteredCourses = ruby;
        break;
      case 'rust':
        filteredCourses = rust;
        break;
      default:
        filteredCourses = python;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Solve doubts",style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w700),),
          InkWell(
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => Chat(),));
            },
            child: Container(
              height:80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/images/edu.jpeg'),fit: BoxFit.cover)
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(
          "Back",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(show: widget.userInterest),
                ));
            _controller.stopVideo();
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: YoutubePlayer(
              controller: _controller,
              aspectRatio: 16 / 9,
            ),
          ),
          _suggestions(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    _controller.stopVideo();
    super.dispose();
  }
  _suggestions(){
    return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  filteredCourses[index][1].toString(),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              filteredCourses[index][2],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        final selectedVideo = filteredCourses[index];
                        _controller.loadVideoById(videoId: selectedVideo[0]);
                        setState(() {});
                      },
                    ),
                  );
                },
                itemCount: filteredCourses.length,
              ),
            ),
          );
  }
}
