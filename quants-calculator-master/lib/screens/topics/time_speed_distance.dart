import 'package:flutter/material.dart';
import 'package:quantscalculator/utils/app_constant.dart';
import 'package:quantscalculator/widgets/border_container.dart';
import 'package:url_launcher/url_launcher.dart';

class TimeSpeedDistance extends StatefulWidget {
  @override
  State<TimeSpeedDistance> createState() => _TimeSpeedDistanceState();
}

class _TimeSpeedDistanceState extends State<TimeSpeedDistance> {
  TextEditingController speedController = TextEditingController();
  TextEditingController distanceController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  double? speed, distance, time;

  void calculate() {
    setState(() {
      double? s = speedController.text.isNotEmpty
          ? double.parse(speedController.text)
          : null;
      double? d = distanceController.text.isNotEmpty
          ? double.parse(distanceController.text)
          : null;
      double? t = timeController.text.isNotEmpty
          ? double.parse(timeController.text)
          : null;

      if (s != null && t != null) {
        distance = s * t;
      } else if (d != null && t != null) {
        speed = d / t;
      } else if (s != null && d != null) {
        time = d / s;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Speed, Distance & Time"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () async {
                  const url =
                      'https://youtu.be/jzNxXm5twx4?si=0eZrbM6-p-JeIk19';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                icon: Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/e/ef/Youtube_logo.png")),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BorderContainer(
                myWidget: const Text(
                    "Speed = Distance / Time\nDistance = Speed × Time\nTime = Distance / Speed"),
              ),
              // const Image(image: AssetImage("assets/speed_distance_time.jpg")),
              TextFormField(
                controller: speedController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter Speed (km/hr)',
                  helperText: 'Speed',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: distanceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter Distance (km)',
                  helperText: 'Distance',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: timeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter Time (hours)',
                  helperText: 'Time',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: calculate,
                child: const Text("Calculate"),
              ),
              const SizedBox(height: 20),
              const Center(
                  child: Text("Result", style: TextStyle(fontSize: 24))),
              if (speed != null)
                Center(
                    child: Text(
                  "Speed: ${speed!.toStringAsFixed(2)} km/hr",
                  style: TextStyle(fontSize: 24, color: AppColor.primaryColor),
                )),
              if (distance != null)
                Center(
                    child: Text(
                  "Distance: ${distance!.toStringAsFixed(2)} km",
                  style: TextStyle(fontSize: 24, color: AppColor.primaryColor),
                )),
              if (time != null)
                Center(
                    child: Text(
                  "Time: ${time!.toStringAsFixed(2)} hours",
                  style: TextStyle(fontSize: 24, color: AppColor.primaryColor),
                )),
            ],
          ),
        ),
      ),
    );
  }
}
