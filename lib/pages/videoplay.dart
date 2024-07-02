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
	_controller.loadVideoById(videoId: widget.id); 
} 

@override 
Widget build(BuildContext context) { 
	return Scaffold( 
	body: Padding( 
		padding: const EdgeInsets.all(8.0), 
		
		child: YoutubePlayer( 
			controller: _controller,
			aspectRatio: 16 / 9,	
		), 
	), 
	); 
} 
}
