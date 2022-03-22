import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void addToMeetingHistory(String meetingId) async {
    await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('meetings')
        .add({
      'meetingId': meetingId,
      'createdAt': DateTime.now(),
    });
  }
}
