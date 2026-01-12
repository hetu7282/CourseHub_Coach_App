// ignore_for_file: unused_field

import 'dart:developer';

import 'package:coach_app/Utils/custom_widget.dart';
import 'package:flick_video_player/flick_video_player.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../Utils/custom_appbar_widget.dart';
import '../../Utils/string_constant.dart';

/* class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(
            "https://firebasestorage.googleapis.com/v0/b/fir-1f13b.appspot.com/o/Video%2F8d502e50-f311-1e73-93f7-950d545b8063?alt=media&token=f0725402-2fa7-43f0-aa61-26910ead3031"),
      ),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => isInternetAvailable.value == true
            ? Scaffold(
                appBar: const CustomAppBar(
                    titleText: "Video Play", isLeadingButton: true),
                body: FlickVideoPlayer(flickManager: flickManager),
              )
            : noInertnet(top: 267),
      ),
    );
  }
}
 */

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late FlickManager flickManager;
  late YoutubePlayerController _controller;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;
  var link = Get.arguments;
  @override
  void initState() {
    super.initState();
    // flickManager = FlickManager(
    //   videoPlayerController: VideoPlayerController.networkUrl(
    //     Uri.parse(
    //         "https://firebasestorage.googleapis.com/v0/b/fir-1f13b.appspot.com/o/Video%2F8d502e50-f311-1e73-93f7-950d545b8063?alt=media&token=f0725402-2fa7-43f0-aa61-26910ead3031"),
    //   ),
    // );
       var id = YoutubePlayer.convertUrlToId(
        link.toString());
        log(id!);
    _controller = YoutubePlayerController(
      initialVideoId: id,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
       _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
   
    setState(() {
      
    });
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(() => isInternetAvailable.value == true
            ? YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.blueAccent,
                  topActions: <Widget>[
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        _controller.metadata.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                 
                  ],
                  onReady: () {
                    _isPlayerReady = true;
                  },
                  onEnded: (data) {
                    // _controller.load(
                    //     _ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
                    // _showSnackBar('Next Video Started!');
                  },
                ),
                builder: (context, player) =>  Scaffold(
                  appBar: const CustomAppBar(
                      titleText: "Video Play", isLeadingButton: true),
                      body: player,
                ),
              )
            : noInertnet(top: 267)));
  }
}
