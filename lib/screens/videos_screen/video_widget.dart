import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import 'package:pexels_app/screens/videos_screen/videos_model.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<VideosModel>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: PageView.builder(
        controller: PageController(initialPage: model.index),
        itemCount: model.videos.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return VideoApp(
              url: model.videos[index].videoFiles[0].link,
              user: model.videos[index].user.name);
          //return Center(child: Text('page $index'));
        },
      ),
    );
  }
}

class VideoApp extends StatefulWidget {
  final String url;
  final String user;
  const VideoApp({
    Key? key,
    required this.url,
    required this.user,
  }) : super(key: key);
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url);
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _controller.value.isPlaying
              ? _controller.pause()
              : _controller.play();
        });
      },
      child: Stack(children: [
        FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return _controller.value.isInitialized
                  ? SizedBox.expand(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _controller.value.size.width,
                          height: _controller.value.size.height,
                          child: VideoPlayer(_controller),
                        ),
                      ),
                    )
                  : Container();
            } else {
              return Container();
            }
          },
        ),
        Center(
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
        Positioned(
          bottom: 20,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15, left: 15),
            child: Text('Author: ${widget.user}',
                style: const TextStyle(color: Colors.white, fontSize: 20)),
          ),
        ),
      ]),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
