import 'dart:html';

import 'package:flutter/material.dart';
import 'package:agora_uikit/agora_uikit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Call Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String appId = '<YOUR_APP_ID>'; // Replace with your Agora App ID
  final String channel = 'test_channel';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Call Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AgoraVideoViewer(
              client: AgoraClient.createClient(),
              // appId: appId,
              // joinChannel: channel,
              // leaveChannel : channel,
              // channel: channel,
              onJoinChannelSuccess: (String channel, int uid, int elapsed) {
                print('Local user joined channel: $channel, uid: $uid');
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                AgoraVideoViewer.joinChannel(channel);
              },
              child: const Text('Join Channel'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                AgoraVideoViewer.leaveChannel();
              },
              child: const Text('Leave Channel'),
            ),
          ],
        ),
      ),
    );
  }
}
