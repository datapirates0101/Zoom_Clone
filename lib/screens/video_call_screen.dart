import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/resources/jitsi_meet_methods.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/meeting_options.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethods _authMethods = AuthMethods();
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  late TextEditingController meetingIdController;
  late TextEditingController nameController;
  bool isAudioMuted = true;
  bool isVideoMuted = true;

  @override
  void initState() {
    meetingIdController = TextEditingController();
    nameController =
        TextEditingController(text: _authMethods.getUser.displayName);
    super.initState();
  }

  _joinMeeting() {
    _jitsiMeetMethods.createMeeting(
      roomName: meetingIdController.text,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
      username: nameController.text,
    );
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }

  @override
  void dispose() {
    meetingIdController.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Join a Meeting',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 60,
              child: TextField(
                controller: meetingIdController,
                maxLines: 1,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Room-ID',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 60,
              child: TextField(
                controller: nameController,
                maxLines: 1,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Room-ID',
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: _joinMeeting,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Join',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 20),
          MeetingOptions(
            text: 'Mute Audio',
            value: isAudioMuted,
            onChanged: onAudioMuted,
          ),
          MeetingOptions(
            text: 'Turn Off My video',
            value: isVideoMuted,
            onChanged: onVideoMuted,
          ),
        ],
      ),
    );
  }
}
