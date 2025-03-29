import 'package:flutter/material.dart';
import 'package:quantscalculator/screens/topics/average.dart';
import 'package:quantscalculator/screens/topics/calendar.dart';
import 'package:quantscalculator/screens/topics/clock.dart';
import 'package:quantscalculator/screens/topics/percentage.dart';
import 'package:quantscalculator/screens/topics/simpleinterest.dart';
import 'package:quantscalculator/screens/topics/time_speed_distance.dart';
import 'package:quantscalculator/screens/topics/work_time_calculator.dart';
import 'package:quantscalculator/utils/app_constant.dart';
import 'package:quantscalculator/widgets/border_container.dart';
import 'package:quantscalculator/widgets/list_tile_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quants Calculator"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BorderContainer(
                  myWidget: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Quote by Eleanor Roosevelt",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor,
                            fontSize: 18,
                          ),
                        ),
                        const Text(
                          "\"The future belongs to those who believe in the beauty of their dreams.\"",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Image(
                      image: AssetImage(
                        "assets/banner.png",
                      ),
                    ),
                  )
                ],
              )),
              BorderContainer(
                myWidget: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About our Service",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                        "We provide you with an easy way to solve aptitude problems along with detailed explanations of the concepts")
                  ],
                ),
              ),
              Text(
                "Quants Topics",
                style: TextStyle(fontSize: 25),
              ),
              ListTileWidget(
                title: "Percentage",
                url: "assets/percentage-image.png",
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Percentage()));
                },
              ),
              ListTileWidget(
                title: "Calendar",
                url: "assets/calendar-image.png",
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Calendar()));
                },
              ),
              ListTileWidget(
                title: "Averages",
                url: "assets/average-image.png",
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Average()));
                },
              ),
              ListTileWidget(
                title: "Clocks",
                url: "assets/clock-image.png",
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ClockAptitudeScreen()));
                },
              ),
              ListTileWidget(
                title: "Simple Interest",
                url: "assets/si-image.png",
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SimpleInterest()));
                },
              ),
              ListTileWidget(
                title: "Time Speed & Distance",
                url: "assets/dst-image.png",
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TimeSpeedDistance()));
                },
              ),
              ListTileWidget(
                title: "Work & Time",
                url: "assets/wt-image.png",
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WorkTimeCalculator()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
