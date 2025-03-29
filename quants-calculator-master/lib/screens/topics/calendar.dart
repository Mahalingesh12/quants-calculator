import 'package:flutter/material.dart';
import 'package:quantscalculator/utils/app_constant.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/border_container.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final TextEditingController _day =  TextEditingController();
  final TextEditingController _month =  TextEditingController();
  final TextEditingController _year =  TextEditingController();



  String? _result;

  void _calculateDayOfWeek() {
    // Retrieve input values
    int? day = int.tryParse(_day.text);
    int? month = int.tryParse(_month.text);
    int? year = int.tryParse(_year.text);

    if (day == null || month == null || year == null) {
      setState(() {
        _result = "Please enter valid numbers!";
      });
      return;
    }

    // Adjust month and year for January and February
    if (month == 1 || month == 2) {
      month += 12;
      year--;
    }

    // Zeller's Congruence formula
    int k = year % 100; // Year within the century
    int j = year ~/ 100; // Century
    int dayOfWeek = (day + ((13 * (month + 1)) ~/ 5) + k + (k ~/ 4) + (j ~/ 4) - (2 * j)) % 7;

    // Adjust dayOfWeek to make Sunday = 0
    dayOfWeek = (dayOfWeek + 7) % 7;

    // Map the result to day names
    List<String> days = [
      "Saturday",
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday"
    ];

    setState(() {
      _result = "The day of the week is: ${days[dayOfWeek]}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calendar"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () async {
                  const url =
                      'https://youtu.be/jgvi8kEXmEQ?si=KquYcEOSp6dwmxl8';
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
                      "Zeller's Congruence Formula")),
              Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: const Image(image: AssetImage("assets/Calendar.jpg")),
              ),
              const Text("""Where:
   h is the day of the week
   q is the day of the month
   m is the month
   K is the year of the century (i.e., year % 100)
   J is the zero-based century (i.e.,year / 100).
                """),
              TextFormField(
                  controller: _day,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Enter a Day',
                    helperText: 'Day',
                    border: OutlineInputBorder(),
                  )),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: _month,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Enter a Month',
                    helperText: 'Month',
                    border: OutlineInputBorder(),
                  )),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: _year,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Enter a Year',
                    helperText: 'Year',
                    border: OutlineInputBorder(),
                  )),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  _calculateDayOfWeek();
                  // print(int.parse(part.text) + int.parse(whole.text));
                  print(_result);
                },
                child: const Text("Calculate"),
              ),

              Center(
                  child: Text(
                "$_result",
                style: TextStyle(fontSize: 24, color: AppColor.primaryColor),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
