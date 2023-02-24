import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
class AppGuide extends StatefulWidget {
  const AppGuide({Key? key}) : super(key: key);

  @override
  State<AppGuide> createState() => _AppGuideState();
}

class _AppGuideState extends State<AppGuide> {

  late VideoPlayerController _controller;
  late Future<void> _initializedVideoPlayerFuture;

  @override
  void initState(){

    _controller = VideoPlayerController.asset('assets/images/guideVideo.mp4');
    _initializedVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Guide"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),


      body: Center(
        child: FutureBuilder(
          future: _initializedVideoPlayerFuture,
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              );
            }else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            if(_controller.value.isPlaying){
              _controller.pause();
            }else{
              _controller.play();
            }
          });
        },
        child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}