import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

class AgoraUiKit extends StatefulWidget {
  const AgoraUiKit({Key? key}) : super(key: key);

  @override
  State<AgoraUiKit> createState() => _AgoraUiKitState();
}

class _AgoraUiKitState extends State<AgoraUiKit> {
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: "e6e86fdf3bf343cfbb9a05ebe259e109",
      channelName: "test",
      username: "user",
    ),
  );

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Agora VideoUIKit'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            AgoraVideoViewer(
              client: client,
              layoutType: Layout.floating,
              enableHostControls: true, // Add this to enable host controls
            ),
            AgoraVideoButtons(
              client: client,
              addScreenSharing: false, // Add this to enable screen sharing
            ),
          ],
        ),
      ),
    );
  }
}
