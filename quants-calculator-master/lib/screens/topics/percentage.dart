import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quantscalculator/utils/app_constant.dart';
import 'package:quantscalculator/widgets/border_container.dart';
import 'package:url_launcher/url_launcher.dart';

class Percentage extends StatefulWidget {
  const Percentage({super.key});

  @override
  State<Percentage> createState() => _PercentageState();
}

class _PercentageState extends State<Percentage> {
  TextEditingController part = new TextEditingController();
  TextEditingController whole = new TextEditingController();

  double answer = 0.0;

  void percentage() {
    setState(() {
      answer = (double.parse(part.text) / double.parse(whole.text)) * 100;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Percentage"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: () async {
                const url = 'https://youtube.com/shorts/vTBTzvRohJM?si=hQKfw4hgJ5dbh6z7';
                if (await canLaunch(url)) {
              await launch(url);
              } else {
              throw 'Could not launch $url';
              }

            }, icon: Image.network("https://upload.wikimedia.org/wikipedia/commons/e/ef/Youtube_logo.png")),
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
                      "Percentage is just a way of expressing a number as a fraction of 100. It is represented by the symbol %.")),
              const Image(image: AssetImage("assets/Percentage.jpg")),
              TextFormField(
                  controller: part,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(

                    hintText: 'Enter a Part Value',
                    helperText: 'Part Value',
                    border: OutlineInputBorder(),
                  )),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: whole,
                  keyboardType: TextInputType.number,

                  decoration: const InputDecoration(
                    hintText: 'Enter a Whole Value',
                    helperText: 'Whole Value',
                    border: OutlineInputBorder(),
                  )),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  percentage();
                  print(int.parse(part.text) + int.parse(whole.text));
                  print(answer);
                },
                child: const Text("Calculate"),
              ),
              const Center(
                  child: Text(
                "Answer",
                style: TextStyle(fontSize: 24),
              )),
              Center(
                  child: Text(
                "$answer%",
                style: TextStyle(fontSize: 24, color: AppColor.primaryColor),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
