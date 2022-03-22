import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/resources/firestore_methods.dart';

class JitsiMeetMethods {
  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = '',
  }) async {
    final AuthMethods authMethods = AuthMethods();
    final FireStoreMethods _fireStoreMethods = FireStoreMethods();
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p

      String name;

      if (username.isEmpty) {
        name = authMethods.getUser.displayName!;
      } else {
        name = username;
      }

      var options = JitsiMeetingOptions(
        room: roomName,
      )
        ..userDisplayName = name
        ..userEmail = authMethods.getUser.email
        ..userAvatarURL = authMethods.getUser.photoURL // or .png
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;

      _fireStoreMethods.addToMeetingHistory(roomName);
      await JitsiMeet.joinMeeting(options);
    } catch (e) {
      print(e.toString());
    }
  }
}
