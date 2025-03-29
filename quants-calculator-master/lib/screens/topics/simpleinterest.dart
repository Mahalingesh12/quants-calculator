import 'package:flutter/material.dart';
import 'package:quantscalculator/widgets/border_container.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/app_constant.dart';

class SimpleInterest extends StatefulWidget {
  const SimpleInterest({super.key});

  @override
  State<SimpleInterest> createState() => _SimpleInterestState();
}

class _SimpleInterestState extends State<SimpleInterest> {
  TextEditingController principalController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  double interest = 0.0;

  void calculateInterest() {
    setState(() {
      double principal = double.parse(principalController.text);
      double rate = double.parse(rateController.text);
      double time = double.parse(timeController.text);
      interest = (principal * rate * time) / 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Interest Calculator"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () async {
                const url =
                    'https://youtu.be/jvRq87ZWzIk?si=ofV3hdwzvUpTC1-R'; // Replace with a relevant video
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              icon: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/e/ef/Youtube_logo.png"),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BorderContainer(
                myWidget: Text(
                    "Simple Interest (SI) is the interest calculated on the principal amount over a specific period at a fixed rate. It is given by the formula:")),
            const Image(image: AssetImage("assets/si.png")),
            TextFormField(
              controller: principalController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter Principal Amount',
                labelText: 'Principal',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: rateController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter Rate of Interest (%)',
                labelText: 'Rate',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: timeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter Time (Years)',
                labelText: 'Time',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateInterest,
              child: const Text("Calculate Interest"),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                "Simple Interest: $interest",
                style: TextStyle(fontSize: 24, color: AppColor.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
