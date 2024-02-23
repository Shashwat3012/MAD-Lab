import 'package:flutter/material.dart';
import 'package:flutter_tiktok_shashwat/features/user_auth/presentation/pages/profile.dart';
import 'package:flutter_tiktok_shashwat/features/user_auth/presentation/widgets/bottom_navbar.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  String get profileImageUrl => "null";

  // Navigator.pushNamed(context, '/homepage', arguments: {'user': user, 'currentIndex': 0});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // void navigateToHome() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => MyHomePage()),
  //   );
  // }

  // void navigateToUpload() {
  //   // Replace with your upload page route
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => UploadPage()),
  //   );
  // }

  // void navigateToProfile() {
  //   // Replace with your profile page route
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => ProfilePage()),
  //   );
  // }

  late VideoPlayerController controller;
  bool isLiked = false;
  bool isDisliked = false;
  bool isCommentOpen = false;
  List<String> videoUrls = [
    'assets/running.mp4',
    'assets/flowers.mp4',
    'assets/lights.mp4',
    'assets/rowing.mp4',
    'assets/traffic.mp4',
  ];
  int currentVideoIndex = 0;

  @override
  void initState() {
    super.initState();
    loadVideoPlayer();
  }

  loadVideoPlayer() async {
    controller = VideoPlayerController.asset(videoUrls[currentVideoIndex]);
    await controller.initialize();
    controller.addListener(() {
      setState(() {});
    });
    controller.play(); // Start playing the video automatically
    setState(() {});
  }

  @override
  void dispose() {
    controller.removeListener(() {});
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const String profileImageUrl = "";
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Video Player
          Expanded(
            child: controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: VideoPlayer(controller),
                  )
                : Center(child: CircularProgressIndicator()),
          ),
          // Positioned(
          //   top: 10.0,
          //   right: 10.0,
          //   child: CircleAvatar(
          //     backgroundImage: NetworkImage(widget.profileImageUrl),
          //     radius: 20.0,
          //     // Replace with your navigation logic (e.g., Navigator.pushNamed)
          //     onPressed: () => print('Navigate to profile page'),
          //   ),
          // ),

          Positioned(
            top: 10.0,
            right: 10.0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.profileImageUrl),
                radius: 20.0,
              ),
            ),
          ),

          // Controls
          Positioned(
            bottom: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                      color: isLiked ? Colors.red : Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                        isDisliked = false;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      isDisliked ? Icons.thumb_down : Icons.thumb_down_outlined,
                      color: isDisliked ? Colors.blue : Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        isDisliked = !isDisliked;
                        isLiked = false;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.comment, color: Colors.black),
                    onPressed: () {
                      // ... (Show comments as before)
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.replay, color: Colors.black),
                    onPressed: () {
                      controller.seekTo(Duration.zero);
                      setState(() {});
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.skip_next, color: Colors.black),
                    onPressed: () {
                      setState(() {
                        currentVideoIndex =
                            (currentVideoIndex + 1) % videoUrls.length;
                        loadVideoPlayer();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     IconButton(
      //       icon: Icon(Icons.home),
      //       onPressed: navigateToHome,
      //     ),
      //     IconButton(
      //       icon: Icon(Icons.cloud_upload),
      //       onPressed: navigateToUpload,
      //     ),
      //     IconButton(
      //       icon: Icon(Icons.person),
      //       onPressed: navigateToProfile,
      //     ),
      //   ],
      // ),
      // bottomNavigationBar: BottomNavBarScreen()
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_tiktok_shashwat/features/user_auth/presentation/widgets/bottom_navbar.dart';
// import 'package:video_player/video_player.dart';

// class HomePage extends StatefulWidget {
//   const HomePage() : super();

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late VideoPlayerController controller;
//   bool isLiked = false;
//   bool isDisliked = false;
//   bool isCommentOpen = false;
//   List<String> videoUrls = [
//     'assets/running.mp4',
//     'assets/flowers.mp4',
//     'assets/lights.mp4',
//     'assets/rowing.mp4',
//     'assets/traffic.mp4',
//   ];
//   int currentVideoIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     loadVideoPlayer();
//   }

//   loadVideoPlayer() async {
//     controller = VideoPlayerController.asset(videoUrls[currentVideoIndex]);
//     await controller.initialize();
//     controller.addListener(() {
//       setState(() {});
//     });
//     controller.play(); // Start playing the video automatically
//     setState(() {});
//   }

//   @override
//   void dispose() {
//     controller.removeListener(() {});
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           // Video Player
//           Expanded(
//             child: controller.value.isInitialized
//                 ? AspectRatio(
//                     aspectRatio: controller.value.aspectRatio,
//                     child: VideoPlayer(controller),
//                   )
//                 : Center(child: CircularProgressIndicator()),
//           ),
//           // Controls
//           Positioned(
//             bottom: 0,
//             right: 0,
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   IconButton(
//                     icon: Icon(
//                       isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
//                       color: isLiked ? Colors.red : Colors.black,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         isLiked = !isLiked;
//                         isDisliked = false;
//                       });
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(
//                       isDisliked ? Icons.thumb_down : Icons.thumb_down_outlined,
//                       color: isDisliked ? Colors.blue : Colors.black,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         isDisliked = !isDisliked;
//                         isLiked = false;
//                       });
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.comment, color: Colors.black),
//                     onPressed: () {
//                       // ... (Show comments as before)
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.replay, color: Colors.black),
//                     onPressed: () {
//                       controller.seekTo(Duration.zero);
//                       setState(() {});
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.skip_next, color: Colors.black),
//                     onPressed: () {
//                       setState(() {
//                         currentVideoIndex =
//                             (currentVideoIndex + 1) % videoUrls.length;
//                         loadVideoPlayer();
//                       });
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       // bottomNavigationBar: BottomNavBarScreen(),
//     );
//   }
// }
