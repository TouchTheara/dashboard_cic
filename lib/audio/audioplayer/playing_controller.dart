// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';

// class PlayingControls extends StatelessWidget {
//   final bool isPlaying;
//   // final LoopMode? loopMode;
//   final bool isPlaylist;
//   final Function()? onPrevious;
//   final Function() onPlay;
//   final Function()? onNext;
//   final Function()? toggleLoop;
//   final Function()? onStop;

//   const PlayingControls({
//     required this.isPlaying,
//     this.isPlaylist = false,
//     // this.loopMode,
//     this.toggleLoop,
//     this.onPrevious,
//     required this.onPlay,
//     this.onNext,
//     this.onStop,
//   });

//   Widget _loopIcon(BuildContext context) {
//     const iconSize = 34.0;
//     // if (loopMode == LoopMode.none) {
//     //   return const Icon(
//     //     Icons.loop,
//     //     size: iconSize,
//     //     color: Colors.grey,
//     //   );
//     // } else if (loopMode == LoopMode.playlist) {
//     //   return const Icon(
//     //     Icons.loop,
//     //     size: iconSize,
//     //     color: Colors.black,
//     //   );
//   //   } else {
//   //     //single
//   //     return Stack(
//   //       alignment: Alignment.center,
//   //       children: const [
//   //         Icon(
//   //           Icons.loop,
//   //           size: iconSize,
//   //           color: Colors.black,
//   //         ),
//   //         Center(
//   //           child: Text(
//   //             '1',
//   //             style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//   //           ),
//   //         ),
//   //       ],
//   //     );
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         GestureDetector(
//           onTap: () {
//             if (toggleLoop != null) toggleLoop!();
//           },
//           child: _loopIcon(context),
//         ),
//         const SizedBox(
//           width: 12,
//         ),
//         NeumorphicButton(
//           style: const NeumorphicStyle(
//             boxShape: NeumorphicBoxShape.circle(),
//           ),
//           padding: const EdgeInsets.all(18),
//           onPressed: isPlaylist ? onPrevious : null,
//           child: const Icon(Icons.start),
//         ),
//         const SizedBox(
//           width: 12,
//         ),
//         NeumorphicButton(
//           style: const NeumorphicStyle(
//             boxShape: NeumorphicBoxShape.circle(),
//           ),
//           padding: const EdgeInsets.all(24),
//           onPressed: onPlay,
//           child: Icon(
//             isPlaying ? Icons.pause : Icons.play_circle,
//             size: 32,
//           ),
//         ),
//         const SizedBox(
//           width: 12,
//         ),
//         NeumorphicButton(
//           style: const NeumorphicStyle(
//             boxShape: NeumorphicBoxShape.circle(),
//           ),
//           padding: const EdgeInsets.all(18),
//           onPressed: isPlaylist ? onNext : null,
//           child: const Icon(Icons.h_mobiledata),
//         ),
//         const SizedBox(
//           width: 45,
//         ),
//         if (onStop != null)
//           NeumorphicButton(
//             style: const NeumorphicStyle(
//               boxShape: NeumorphicBoxShape.circle(),
//             ),
//             padding: const EdgeInsets.all(16),
//             onPressed: onStop,
//             child: const Icon(
//               Icons.stop,
//               size: 32,
//             ),
//           ),
//       ],
//     );
//   }
// }
