import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoUploaderPage extends StatefulWidget {
  @override
  _VideoUploaderPageState createState() => _VideoUploaderPageState();
}

class _VideoUploaderPageState extends State<VideoUploaderPage> {
  late File _videoFile;

  // Future<void> _pickVideo() async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.getVideo(source: ImageSource.gallery);
  //   setState(() {
  //     _videoFile = File(pickedFile.path);
  //   });
  // }

  Future<void> _pickVideo() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _videoFile = File(pickedFile.path!);
      });
    } else {
      // User canceled video picking process
      print('User canceled video picking.');
    }
  }

  Future<void> _saveVideo() async {
    final Directory appDirectory = await getApplicationDocumentsDirectory();
    final String videoPath = '${appDirectory.path}/my_video.mp4';
    final File localVideoFile = File(videoPath);
    await _videoFile.copy(videoPath);
    // Video saved to local folder
    print('Video saved to: $videoPath');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Uploader'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _videoFile == null
                ? Text('No video selected.')
                : VideoPlayer(_videoFile),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickVideo,
              child: Text('Pick Video'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _videoFile != null ? _saveVideo : null,
              child: Text('Save Video'),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoPlayer extends StatelessWidget {
  final File videoFile;

  VideoPlayer(this.videoFile);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        child: VideoPlayerController.file(videoFile).value.isInitialized
            ? VideoPlayerWidget(videoFile)
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

// class VideoPlayerWidget extends StatelessWidget {
//   final File videoFile;

//   VideoPlayerWidget(this.videoFile);

//   @override
//   Widget build(BuildContext context) {
//     return VideoPlayerController.file(
//       videoFile,
//       videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
//     );
//   }
// }
class VideoPlayerWidget extends StatelessWidget {
  final File videoFile;

  VideoPlayerWidget(this.videoFile);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        child: VideoPlayerController.file(videoFile).value.isInitialized
            ? VideoPlayer(videoFile)
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
