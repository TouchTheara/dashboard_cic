import 'dart:async';

// import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AudioTest extends StatefulWidget {
  @override
  State<AudioTest> createState() => _AudioTestState();
}

class _AudioTestState extends State<AudioTest> {
  // AudioPlayer player = AudioPlayer();
  // late AssetsAudioPlayer assetsAudioPlayer;
  // final List<StreamSubscription> subscriptions = [];
  // final audios = <Audio>[
  //   Audio.file('assets/audio/congratSound.mp3'),
  //   Audio.file('assets/audio/congrat2.mp3'),
  // ];

  // void openPlayer() async {
  //   await assetsAudioPlayer.open(
  //     Playlist(audios: audios, startIndex: 0),
  //     showNotification: true,
  //     autoStart: true,
  //   );
  //   assetsAudioPlayer.stop();
  // }

  @override
  void initState() {
    super.initState();
    // assetsAudioPlayer = AssetsAudioPlayer.newPlayer();

    // subscriptions.add(assetsAudioPlayer.playlistAudioFinished.listen((data) {
    //   print('playlistAudioFinished : $data');
    // }));
    // subscriptions.add(assetsAudioPlayer.audioSessionId.listen((sessionId) {
    //   print('audioSessionId : $sessionId');
    // }));

    // openPlayer();
  }

  @override
  void dispose() {
    // assetsAudioPlayer.dispose();
    print('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: NeumorphicTheme.baseColor(context),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 48.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () {},
                      child: const Icon(Icons.play_arrow_rounded))
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // Stack(
                  //   fit: StackFit.passthrough,
                  //   children: <Widget>[
                  //     StreamBuilder<Playing?>(
                  //         stream: assetsAudioPlayer.current,
                  //         builder: (context, playing) {
                  //           if (playing.data != null) {
                  //             final myAudio = find(
                  //                 audios, playing.data!.audio.assetAudioPath);
                  //             print(playing.data!.audio.assetAudioPath);
                  //             return Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: Neumorphic(
                  //                 style: const NeumorphicStyle(
                  //                   depth: 8,
                  //                   surfaceIntensity: 1,
                  //                   shape: NeumorphicShape.concave,
                  //                   boxShape: NeumorphicBoxShape.circle(),
                  //                 ),
                  //                 child: myAudio.metas.image?.path == null
                  //                     ? const SizedBox()
                  //                     : myAudio.metas.image?.type ==
                  //                             ImageType.network
                  //                         ? Image.network(
                  //                             myAudio.metas.image!.path,
                  //                             height: 150,
                  //                             width: 150,
                  //                             fit: BoxFit.contain,
                  //                           )
                  //                         : Image.asset(
                  //                             myAudio.metas.image!.path,
                  //                             height: 150,
                  //                             width: 150,
                  //                             fit: BoxFit.contain,
                  //                           ),
                  //               ),
                  //             );
                  //           }
                  //           return const SizedBox.shrink();
                  //         }),
                  //     Align(
                  //       alignment: Alignment.topRight,
                  //       child: NeumorphicButton(
                  //         style: const NeumorphicStyle(
                  //           boxShape: NeumorphicBoxShape.circle(),
                  //         ),
                  //         padding: const EdgeInsets.all(18),
                  //         margin: const EdgeInsets.all(18),
                  //         onPressed: () {
                  //           AssetsAudioPlayer.playAndForget(
                  //               Audio('assets/audios/horn.mp3'));
                  //         },
                  //         child: Icon(
                  //           Icons.add_alert,
                  //           color: Colors.grey[800],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // assetsAudioPlayer.builderCurrent(
                  //     builder: (context, Playing? playing) {
                  //   return Column(
                  //     children: <Widget>[
                  //       assetsAudioPlayer.builderLoopMode(
                  //         builder: (context, loopMode) {
                  //           return PlayerBuilder.isPlaying(
                  //               player: assetsAudioPlayer,
                  //               builder: (context, isPlaying) {
                  //                 return PlayingControls(
                  //                   loopMode: loopMode,
                  //                   isPlaying: isPlaying,
                  //                   isPlaylist: true,
                  //                   onStop: () {
                  //                     assetsAudioPlayer.stop();
                  //                   },
                  //                   toggleLoop: () {
                  //                     assetsAudioPlayer.toggleLoop();
                  //                   },
                  //                   onPlay: () {
                  //                     assetsAudioPlayer.playOrPause();
                  //                   },
                  //                   onNext: () {
                  //                     //assetsAudioPlayer.forward(Duration(seconds: 10));
                  //                     assetsAudioPlayer.next(
                  //                         keepLoopMode:
                  //                             true /*keepLoopMode: false*/);
                  //                   },
                  //                   onPrevious: () {
                  //                     assetsAudioPlayer.previous(
                  //                         /*keepLoopMode: false*/);
                  //                   },
                  //                 );
                  //               });
                  //         },
                  //       ),
                  //       assetsAudioPlayer.builderRealtimePlayingInfos(
                  //           builder: (context, RealtimePlayingInfos? infos) {
                  //         if (infos == null) {
                  //           return const SizedBox();
                  //         }
                  //         //print('infos: $infos');
                  //         return Column(
                  //           children: [
                  //             PositionSeekWidget(
                  //               currentPosition: infos.currentPosition,
                  //               duration: infos.duration,
                  //               seekTo: (to) {
                  //                 assetsAudioPlayer.seek(to);
                  //               },
                  //             ),
                  //             Row(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 NeumorphicButton(
                  //                   onPressed: () {
                  //                     assetsAudioPlayer
                  //                         .seekBy(const Duration(seconds: -10));
                  //                   },
                  //                   child: const Text('-10'),
                  //                 ),
                  //                 const SizedBox(
                  //                   width: 12,
                  //                 ),
                  //                 NeumorphicButton(
                  //                   onPressed: () {
                  //                     assetsAudioPlayer
                  //                         .seekBy(const Duration(seconds: 10));
                  //                   },
                  //                   child: const Text('+10'),
                  //                 ),
                  //               ],
                  //             )
                  //           ],
                  //         );
                  //       }),
                  //     ],
                  //   );
                  // }),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // assetsAudioPlayer.builderCurrent(
                  //     builder: (BuildContext context, Playing? playing) {
                  //   return SongsSelector(
                  //     audios: audios,
                  //     onPlaylistSelected: (myAudios) {
                  //       assetsAudioPlayer.open(
                  //         Playlist(audios: myAudios),
                  //         showNotification: true,
                  //         headPhoneStrategy:
                  //             HeadPhoneStrategy.pauseOnUnplugPlayOnPlug,
                  //         audioFocusStrategy: const AudioFocusStrategy.request(
                  //             resumeAfterInterruption: true),
                  //       );
                  //     },
                  //     onSelected: (myAudio) async {
                  //       try {
                  //         await assetsAudioPlayer.open(
                  //           myAudio,
                  //           autoStart: true,
                  //           showNotification: true,
                  //           playInBackground: PlayInBackground.enabled,
                  //           audioFocusStrategy:
                  //               const AudioFocusStrategy.request(
                  //                   resumeAfterInterruption: true,
                  //                   resumeOthersPlayersAfterDone: true),
                  //           headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplug,
                  //           notificationSettings: const NotificationSettings(
                  //               //seekBarEnabled: false,
                  //               //stopEnabled: true,
                  //               //customStopAction: (player){
                  //               //  player.stop();
                  //               //}
                  //               //prevEnabled: false,
                  //               //customNextAction: (player) {
                  //               //  print('next');
                  //               //}
                  //               //customStopIcon: AndroidResDrawable(name: 'ic_stop_custom'),
                  //               //customPauseIcon: AndroidResDrawable(name:'ic_pause_custom'),
                  //               //customPlayIcon: AndroidResDrawable(name:'ic_play_custom'),
                  //               ),
                  //         );
                  //       } catch (e) {
                  //         print(e);
                  //       }
                  //     },
                  //     playing: playing,
                  //   );
                  // }),
                  /*
                  PlayerBuilder.volume(
                      player: assetsAudioPlayer,
                      builder: (context, volume) {
                        return VolumeSelector(
                          volume: volume,
                          onChange: (v) {
                            assetsAudioPlayer.setVolume(v);
                          },
                        );
                      }),
                   */
                  /*
                  PlayerBuilder.forwardRewindSpeed(
                      player: assetsAudioPlayer,
                      builder: (context, speed) {
                        return ForwardRewindSelector(
                          speed: speed,
                          onChange: (v) {
                            assetsAudioPlayer.forwardOrRewind(v);
                          },
                        );
                      }),
                   */
                  /*
                  PlayerBuilder.playSpeed(
                      player: assetsAudioPlayer,
                      builder: (context, playSpeed) {
                        return PlaySpeedSelector(
                          playSpeed: playSpeed,
                          onChange: (v) {
                            assetsAudioPlayer.setPlaySpeed(v);
                          },
                        );
                      }),
                   */
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
