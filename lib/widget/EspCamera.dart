import 'package:flutter/material.dart';
import 'package:plant_base/utils/page_provider.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class EspCamera extends StatefulWidget {
  final WebSocketChannel channel;

  EspCamera({required this.channel}) : super();

  @override
  State<EspCamera> createState() => _EspCameraState();
}

class _EspCameraState extends State<EspCamera> {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 300,
      child: StreamBuilder(stream: widget.channel.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),),
            );
          } else {
            return Image.memory(snapshot.data, gaplessPlayback: true,);
          }
        }
      ),
    );
  }
}

