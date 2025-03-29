import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class YoutubeVideo extends StatefulWidget {
  const YoutubeVideo({super.key});

  @override
  State<YoutubeVideo> createState() => _YoutubeVideoState();
}

class _YoutubeVideoState extends State<YoutubeVideo> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        const url = 'https://youtube.com/shorts/vTBTzvRohJM?si=hQKfw4hgJ5dbh6z7';
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
      child: Center(
        child: Text(
          "Want Read Article Tap Here",
          style: TextStyle(
              color: Colors.green, fontSize: 25, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
