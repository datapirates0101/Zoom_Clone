import 'dart:math';
import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/jitsi_meet_methods.dart';
import '../widgets/home_meeting_button.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

class MeetScreen extends StatefulWidget {
  MeetScreen({Key? key}) : super(key: key);

  @override
  State<MeetScreen> createState() => _MeetScreenState();
}

class _MeetScreenState extends State<MeetScreen> {
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  @override
  void dispose() {
    JitsiMeet.removeAllListeners();
    super.dispose();
  }


  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) {
    Navigator.of(context).pushNamed('/video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onPressed: createNewMeeting,
              icon: Icons.videocam,
              text: 'New Meeting',
            ),
            HomeMeetingButton(
              onPressed: () => joinMeeting(context),
              icon: Icons.add_box_rounded,
              text: 'Join Meeting',
            ),
            HomeMeetingButton(
              onPressed: () {},
              icon: Icons.calendar_today,
              text: 'Sehedule',
            ),
            HomeMeetingButton(
              onPressed: () {},
              icon: Icons.arrow_upward_rounded,
              text: 'Share Screen',
            ),
          ],
        ),
        const Expanded(
          child: Center(
            child: Text(
              'Create/Join Meeting with just a click',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
