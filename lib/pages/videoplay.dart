import 'package:flutter/material.dart';
import 'package:login/data/courses.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubePlayerScreen extends StatefulWidget {
  final String id;
  const YoutubePlayerScreen({super.key, required this.id});

  @override
  State<YoutubePlayerScreen> createState() => _YoutubePlayerScreenState();
}

class _YoutubePlayerScreenState extends State<YoutubePlayerScreen> {
  final _controller = YoutubePlayerController(
      params: YoutubePlayerParams(
          showControls: true,
          loop: true,

          showFullscreenButton: true,
          showVideoAnnotations: true,
          strictRelatedVideos: true));
  @override
  void initState() {
    super.initState();
    _controller.loadVideoById(videoId: widget.id);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Back",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: YoutubePlayer(
                controller: _controller,
                aspectRatio: 16 / 9,

              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Container(
                height: 500,
                width: double.infinity,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) => YoutubePlayerScreen(id: python[index][0]),));
                          setState(() {
                            python.insert(python.length, python[index]);
                            python.removeAt(index);
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 100,
                              width: 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage(python[index][1].toString()))
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(child: Text(python[index][2],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),maxLines: 2,))
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: python.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
