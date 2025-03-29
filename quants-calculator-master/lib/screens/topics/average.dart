import 'package:flutter/material.dart';
import 'package:quantscalculator/widgets/border_container.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/app_constant.dart';

class Average extends StatefulWidget {
  const Average({super.key});

  @override
  State<Average> createState() => _AverageState();
}

class _AverageState extends State<Average> {
  TextEditingController part = new TextEditingController();
  TextEditingController whole = new TextEditingController();

  double answer = 0.0;

  void average() {
    setState(() {
      answer = (double.parse(part.text) / double.parse(whole.text));
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Averages"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: () async {
              const url = 'https://youtu.be/vwWxezGGPPQ?feature=shared';
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
                      "An average is a way of summaribing a set of numbers into a single value that represents the central or typical value of that set.\n\nThe most common type of average is the arithmetic mean Q which is what people usually mean when the talk about the average.")),
              const Image(image: AssetImage("assets/Average.jpg")),
              TextFormField(
                  controller: part,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(

                    hintText: 'Enter a total number of values',
                    helperText: 'Total Value',
                    border: OutlineInputBorder(),
                  )),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: whole,
                  keyboardType: TextInputType.number,

                  decoration: const InputDecoration(
                    hintText: 'Enter the total number of items',
                    helperText: 'Number of Items',
                    border: OutlineInputBorder(),
                  )),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  average();
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
                    "$answer",
                    style: TextStyle(fontSize: 24, color: AppColor.primaryColor),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
