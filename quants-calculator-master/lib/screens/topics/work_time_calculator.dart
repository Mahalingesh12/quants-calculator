import 'package:flutter/material.dart';
import 'package:quantscalculator/utils/app_constant.dart';
import 'package:quantscalculator/widgets/border_container.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkTimeCalculator extends StatefulWidget {
  const WorkTimeCalculator({super.key});

  @override
  State<WorkTimeCalculator> createState() => _WorkTimeCalculatorState();
}

class _WorkTimeCalculatorState extends State<WorkTimeCalculator> {
  TextEditingController workController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController efficiencyController = TextEditingController();

  double? work, time, efficiency;

  void calculate() {
    setState(() {
      double? w = workController.text.isNotEmpty
          ? double.parse(workController.text)
          : null;
      double? t = timeController.text.isNotEmpty
          ? double.parse(timeController.text)
          : null;
      double? e = efficiencyController.text.isNotEmpty
          ? double.parse(efficiencyController.text)
          : null;

      if (e != null && t != null) {
        work = e * t; // Work Done = Efficiency × Time
      } else if (w != null && t != null) {
        efficiency = w / t; // Efficiency = Work Done / Time
      } else if (w != null && e != null) {
        time = w / e; // Time = Work Done / Efficiency
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Work & Time Calculator"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () async {
                  const url =
                      'https://youtu.be/KE7tQf9spPg?si=v7liSbJ7h9j3KZfa';
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
                    "Work Done = Efficiency × Time\nEfficiency = Work Done / Time\nTime = Work Done / Efficiency"),
              ),
              // const Image(image: AssetImage("assets/work_time.jpg")),
              TextFormField(
                controller: workController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter Work Done',
                  helperText: 'Work',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: timeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter Time Taken (Days)',
                  helperText: 'Time',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: efficiencyController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter Efficiency (Work per Day)',
                  helperText: 'Efficiency',
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
              if (work != null)
                Center(
                    child: Text(
                  "Work Done: ${work!.toStringAsFixed(2)} units",
                  style: TextStyle(fontSize: 24, color: AppColor.primaryColor),
                )),
              if (efficiency != null)
                Center(
                    child: Text(
                  "Efficiency: ${efficiency!.toStringAsFixed(2)} work/day",
                  style: TextStyle(fontSize: 24, color: AppColor.primaryColor),
                )),
              if (time != null)
                Center(
                    child: Text(
                  "Time Required: ${time!.toStringAsFixed(2)} days",
                  style: TextStyle(fontSize: 24, color: AppColor.primaryColor),
                )),
            ],
          ),
        ),
      ),
    );
  }
}
