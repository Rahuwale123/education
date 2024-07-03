import 'package:flutter/material.dart';
import 'package:login/data/courses.dart'; 
import 'package:login/pages/videoplay.dart';

class YoutubePlaylistScreen extends StatefulWidget {
  final String courseId;
    final String userInterest;
  const YoutubePlaylistScreen({Key? key, required this.courseId, required this.userInterest}) : super(key: key);

  @override
  State<YoutubePlaylistScreen> createState() => _YoutubePlaylistScreenState();
}

class _YoutubePlaylistScreenState extends State<YoutubePlaylistScreen> {
  @override
  Widget build(BuildContext context) {

    List<dynamic> videos = python
        .where((video) => video[0] == widget.courseId)
        .toList(); 

    return Scaffold(
      appBar: AppBar(
        title: Text('Course Playlist'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
              child: ListView.builder(
                itemCount: videos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                    
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(python[index][1].toString()),fit: BoxFit.cover)
                      ),
                    ),
                    title: Text(videos[index][2]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => YoutubePlayerScreen(
                            id: videos[index][0],
                            userInterest:widget.userInterest , 
                            onClose: () {}, 
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
