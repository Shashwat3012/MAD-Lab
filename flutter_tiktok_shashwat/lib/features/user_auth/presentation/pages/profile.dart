// import 'package:flutter/material.dart';

// class ProfilePage extends StatefulWidget {
//   // Pass user information as arguments
// final String userName = "shashwat";
// final String bio = "Shashwat Tripathi studies in D15A";
// final String profileImageUrl = "";
// final int followerCount = 300;
// final bool isFollowing = false;

//   const ProfilePage({
//     Key? key,
//     // required this.userName,
//     // required this.bio,
//     // required this.profileImageUrl,
//     // required this.followerCount,
//     // required this.isFollowing,
//   }) : super(key: key);

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   bool _isFollowing = false;

//   @override
//   void initState() {
//     super.initState();
//     _isFollowing = widget.isFollowing;
//   }

//   void _toggleFollowing() {
//     setState(() {
//       _isFollowing = !_isFollowing;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("TikTok"),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             children: [
//               // Profile Image
//               Image.asset(
//                 'assets/tiktok_logo.jpg', // Replace with the correct path to your TikTok logo image
//                 height: 40, // Adjust height as needed
//               ),

//               // CircleAvatar(
//               //   // backgroundImage: NetworkImage(widget.profileImageUrl),
//               //   backgroundImage: NetworkImage("assets/tiktok_logo.png"),
//               //   radius: 50.0,
//               // ),
//               SizedBox(height: 10.0),
//               // Username
//               Text(
//                 widget.userName,
//                 style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10.0),
//               // Bio
//               Text(widget.bio),
//               SizedBox(height: 20.0),
//               // Follower Count
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "followerCount Followers",
//                     style: TextStyle(fontSize: 16.0),
//                   ),
//                   // Follow Button
//                   ElevatedButton(
//                     onPressed: _toggleFollowing,
//                     child: Text(_isFollowing ? "Following" : "Follow"),
//                   ),
//                 ],
//               ),
//               // ... other profile content (e.g., posts, etc.)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_tiktok_shashwat/features/user_auth/presentation/pages/upload.dart';

class ProfilePage extends StatefulWidget {
  // Pass user information as arguments
  final String userName = "shashwat";
  final String bio = "Shashwat Tripathi studies in D15A";
  final String profileImageUrl = "";
  final int followerCount = 300;
  final bool isFollowing = false;

  const ProfilePage({
    Key? key,
    // required this.userName,
    // required this.bio,
    // required this.profileImageUrl,
    // required this.followerCount,
    // required this.isFollowing,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isFollowing = false;

  @override
  void initState() {
    super.initState();
    _isFollowing = widget.isFollowing;
  }

  void _toggleFollowing() {
    setState(() {
      _isFollowing = !_isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.black, // Set background color to black for TikTok theme
      appBar: AppBar(
        backgroundColor: Colors.black, // Apply black background to AppBar
        title: Text(
          "TikTok",
          style:
              TextStyle(color: Colors.white), // Set title text color to white
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Profile Image
              // CircleAvatar(
              //   backgroundImage: NetworkImage(widget.profileImageUrl),
              //   radius: 50.0,
              // ),
              // SizedBox(height: 10.0),
              SizedBox(height: 10), // Adjust the height as needed
              Image.asset(
                'assets/tiktok_logo.jpg', // Replace with the correct path to your TikTok logo image
                height: 40, // Adjust height as needed
              ),

              // Username
              Text(
                widget.userName,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Set text color to white
                ),
              ),
              SizedBox(height: 10.0),

              // Bio
              Text(
                widget.bio,
                style:
                    TextStyle(color: Colors.white), // Set text color to white
              ),
              SizedBox(height: 20.0),

              // Follower Count
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.followerCount.toString()} Followers",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white), // Set text color to white
                  ),
                  // Follow Button
                  ElevatedButton(
                    onPressed: _toggleFollowing,
                    child: Text(
                      _isFollowing ? "Following" : "Follow",
                      style: TextStyle(
                          color: Colors.white), // Set text color to white
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // Set button color to red
                    ),
                  ),
                ],
              ),

              // ... other profile content (e.g., posts, etc.)

              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  // child: FloatingActionButton(
                  //   onPressed: () => Navigator.pushNamed(context,
                  //       '/upload'), // Replace with your upload page route name
                  //   backgroundColor: Colors.red, // Set button color to red
                  //   child: Icon(Icons.add),
                  // ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => VideoUploaderPage()),
                      );
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(widget.profileImageUrl),
                      radius: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
