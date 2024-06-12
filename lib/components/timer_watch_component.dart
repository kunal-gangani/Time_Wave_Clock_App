import 'dart:async';

import 'package:flutter/material.dart';

class TimerWatchComponent extends StatefulWidget {
  const TimerWatchComponent({super.key});

  @override
  State<TimerWatchComponent> createState() => _TimerWatchComponentState();
}

class _TimerWatchComponentState extends State<TimerWatchComponent> {
  int hour = 0;
  int minute = 0;
  int second = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      DateTime dateTime = DateTime.now();
      setState(() {
        hour = dateTime.hour;
        minute = dateTime.minute;
        second = dateTime.second;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    TextScaler textScaler = MediaQuery.textScalerOf(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            width: w,
            height: h * 0.2,
            decoration: BoxDecoration(
              border: Border.all(
                width: 4,
                color: Colors.black,
              ),
              color: const Color(0xffFFCC60),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      hour.toString().padLeft(2, '0'),
                      style: TextStyle(fontSize: textScaler.scale(35)),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      ":",
                      style: TextStyle(
                        fontSize: textScaler.scale(25),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      minute.toString().padLeft(2, '0'),
                      style: TextStyle(
                        fontSize: textScaler.scale(35),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      ":",
                      style: TextStyle(
                        fontSize: textScaler.scale(25),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      second.toString().padLeft(2, '0'),
                      style: TextStyle(fontSize: textScaler.scale(35)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: h * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Icon(Icons.play_arrow),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Icon(Icons.pause),
              ),
            ],
          )
        ],
      ),
    );
  }
}
