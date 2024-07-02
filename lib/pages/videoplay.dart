import 'package:flutter/material.dart'; 
import 'package:youtube_player_iframe/youtube_player_iframe.dart'; 

class YoutubePlayerScreen extends StatefulWidget { 
  final String id;
const YoutubePlayerScreen({super.key, required this.id}); 

@override 
State<YoutubePlayerScreen> createState() => _YoutubePlayerScreenState(); 
} 

class _YoutubePlayerScreenState extends State<YoutubePlayerScreen> { 
final _controller = YoutubePlayerController(params: YoutubePlayerParams(showControls: true,loop: true,showFullscreenButton: true,showVideoAnnotations: true,strictRelatedVideos: true)); 
@override 
void initState() { 
	super.initState(); 
	_controller.loadVideoById(videoId:'UrsmFxEIp5k'); 
} 

@override 
Widget build(BuildContext context) { 
	return Scaffold( 
    appBar: AppBar(),
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
                child: ListView.builder(itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
  Container(
    height: 100,
    width: 150,
    color: Colors.amber,
  )
                      ],
                    ),
                  );
                },),
              ),
            )
        ],
      ),
    ), 


	); 
} 
}
