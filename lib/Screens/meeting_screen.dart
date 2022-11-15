import 'dart:math';
import 'package:flutter/material.dart';
import 'package:people/Screens/jitsi_meet_screen.dart';
import '../utils/home_meeting_button.dart';

class MeetingScreenPage extends StatelessWidget {
  MeetingScreenPage({Key? key}) : super(key: key);
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  createNewMeeting() {
   var random = Random();
   String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(roomName: 'roomName', isAudioMuted: true, isVideoMuted: true);
  }
  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, "videoCall");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeMeetingButton(
                onPressed: createNewMeeting,
                icon: Icons.videocam,
                text: "New meeting",
              ),
              HomeMeetingButton(
                onPressed: () => joinMeeting(context),
                icon: Icons.add_box_rounded,
                text: "Join meeting",
              ),
              HomeMeetingButton(
                onPressed: () {},
                icon: Icons.calendar_today,
                text: "Schedule",
              ),
              HomeMeetingButton(
                onPressed: () {},
                icon: Icons.arrow_upward_rounded,
                text: "Share screen",
              ),
            ],
          ),
          const Expanded(
            child: Center(
              child: Text(
                "Create/join the meeting with just a single click!",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
