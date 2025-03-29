import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quantscalculator/widgets/border_container.dart';
import 'package:url_launcher/url_launcher.dart';

class ClockAptitudeScreen extends StatefulWidget {
  const ClockAptitudeScreen({super.key});

  @override
  State<ClockAptitudeScreen> createState() => _ClockAptitudeScreenState();
}

class _ClockAptitudeScreenState extends State<ClockAptitudeScreen> {
  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();
  double angle = 0.0;

  void calculateAngle() {
    setState(() {
      int hours = int.parse(hourController.text) % 12;
      int minutes = int.parse(minuteController.text);
      double hourAngle = (hours * 30) + (minutes * 0.5);
      double minuteAngle = minutes * 6;
      angle = (hourAngle - minuteAngle).abs();
      angle = angle > 180 ? 360 - angle : angle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Clock Aptitude"), actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(onPressed: () async {
            const url = 'https://youtu.be/ZsW4sfgUgrs?si=WMSVevph56j8lpVq';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }

          }, icon: Image.network("https://upload.wikimedia.org/wikipedia/commons/e/ef/Youtube_logo.png")),
        )
      ],),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BorderContainer(myWidget: Text("Clock aptitude problems involve calculating the angle between the hour and minute hands of an analog clock. These problems test logical thinking and mathematical skills, commonly appearing in competitive exams, interviews, and aptitude tests."),),
            const Image(image: AssetImage("assets/clock.png")),
            SizedBox(height: 20,),
            TextFormField(
              controller: hourController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter Hour (1-12)',
                labelText: 'Hour',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: minuteController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter Minutes (0-59)',
                labelText: 'Minutes',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateAngle,
              child: const Text("Calculate Angle"),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                "Angle: $angle°",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
