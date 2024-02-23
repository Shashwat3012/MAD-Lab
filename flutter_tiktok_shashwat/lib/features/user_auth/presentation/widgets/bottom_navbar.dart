// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_tiktok_shashwat/features/user_auth/presentation/pages/home_page.dart';
// import 'package:flutter_tiktok_shashwat/features/user_auth/presentation/pages/profile.dart';
// import 'package:flutter_tiktok_shashwat/features/user_auth/presentation/pages/upload.dart';
// import 'package:google_fonts/google_fonts.dart';
// // import 'package:flutter_tiktok_shashwat/screens/message_screen.dart';

// class BottomNavBarScreen extends StatefulWidget {
//   const BottomNavBarScreen({super.key});

//   @override
//   State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
// }

// class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
//   int pageIndex = 0;

//   final List<Widget> pages = [
//     const HomePage(),
//     VideoUploaderPage(),
//     // const MessageScreen(),
//     const ProfilePage()
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: _buildBody(),
//       bottomNavigationBar: Container(
//         height: 66,
//         padding: const EdgeInsets.fromLTRB(27, 0, 27, 2),
//         child: BottomNavigationBar(
//           backgroundColor: Colors.black,
//           currentIndex: pageIndex,
//           unselectedItemColor: Colors.grey.shade700,
//           selectedItemColor: Colors.white,
//           iconSize: 26,
//           onTap: (index) {
//             setState(() {
//               pageIndex = index;
//             });

//             if (index == 2) {
//               showModalBottomSheet(
//                 context: context,
//                 isDismissible: false,
//                 isScrollControlled: true,
//                 shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(15),
//                     topRight: Radius.circular(15),
//                   ),
//                 ),
//                 builder: (BuildContext context) {
//                   return _bottomSheetContainer();
//                 },
//               );
//             }
//           },
//           type: BottomNavigationBarType.fixed,
//           showSelectedLabels: false,
//           showUnselectedLabels: false,
//           items: [
//             const BottomNavigationBarItem(
//               icon: Icon(Icons.home_filled),
//               label: "home",
//             ),
//             const BottomNavigationBarItem(
//               icon: Icon(Icons.search),
//               label: "home",
//             ),
//             const BottomNavigationBarItem(
//               icon: Icon(Icons.add),
//               label: "home",
//             ),
//             const BottomNavigationBarItem(
//               icon: Icon(CupertinoIcons.chat_bubble_text_fill),
//               label: "home",
//             ),
//             BottomNavigationBarItem(
//               icon: CircleAvatar(
//                 radius: 15,
//                 child: Text(
//                   "D",
//                   style: GoogleFonts.poppins(color: Colors.white),
//                 ),
//               ),
//               label: "home",
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildBody() {
//     return pages[pageIndex];
//   }

//   Widget _bottomSheetContainer() {
//     return WillPopScope(
//       onWillPop: () async {
//         return false;
//       },
//       child: Container(
//         height: 350.h,
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: Colors.grey.shade900,
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(15),
//             topRight: Radius.circular(15),
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 10.h,
//             ),
//             Row(
//               children: [
//                 GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Icon(
//                       CupertinoIcons.xmark,
//                       color: Colors.white,
//                       size: 24,
//                     )),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 80),
//                   child: Text(
//                     "Start creating now",
//                     style: GoogleFonts.poppins(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 17.sp,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 10.h,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 _optionsButton(CupertinoIcons.pin, "Pin"),
//                 _optionsButton(
//                     CupertinoIcons.square_fill_on_square_fill, "Collage"),
//                 _optionsButton(Icons.dashboard, "Board"),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _optionsButton(IconData icon, String string) {
//     return Center(
//       child: Column(
//         children: [
//           Container(
//             margin: const EdgeInsets.all(5),
//             width: 90.w,
//             height: 70.h,
//             decoration: BoxDecoration(
//               shape: BoxShape.rectangle,
//               borderRadius: BorderRadius.circular(20),
//               color: Colors.grey.shade800,
//             ),
//             child: Center(
//               child: TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Icon(
//                     icon,
//                     size: 26,
//                     color: Colors.white,
//                   )),
//             ),
//           ),
//           SizedBox(
//             height: 5.h,
//           ),
//           Text(
//             string,
//             style: GoogleFonts.poppins(
//               fontWeight: FontWeight.w600,
//               fontSize: 18.sp,
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_tiktok_shashwat/features/user_auth/presentation/pages/profile.dart';
import 'package:flutter_tiktok_shashwat/features/user_auth/presentation/pages/upload.dart';
import 'package:flutter_tiktok_shashwat/features/user_auth/presentation/pages/home_page.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen() : super();

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int pageIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    VideoUploaderPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: pageIndex,
        unselectedItemColor: Colors.grey.shade700,
        selectedItemColor: Colors.white,
        iconSize: 26,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "home",
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => pages[pageIndex]);
          default:
            return MaterialPageRoute(builder: (_) => pages[pageIndex]);
        }
      },
    );
  }
}
