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
  bool isTimerOn = false;

  Future<void> timerWatch() async {
    isTimerOn = true;
    await Future.delayed(const Duration(milliseconds: 50), () {
      if (isTimerOn) {
        second++;
      }
      if (second > 59) {
        second = 0;
        minute++;
      }
      if (minute > 59) {
        minute = 0;
        hour++;
      }
      if (hour > 12) {
        hour = 0;
      }
      setState(() {});
    });
    if (isTimerOn) {
      timerWatch();
    }
  }

  List timerWatchHist = [];

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
                onPressed: () {
                  if (!isTimerOn) {
                    timerWatch();
                  }
                  setState(() {});
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                  const Color(0xffE7EEFB),
                )),
                child: const Icon(Icons.play_arrow),
              ),
              ElevatedButton(
                onPressed: () {
                  isTimerOn = false;
                  timerWatchHist.add({
                    'hour': hour,
                    'minute': minute,
                    'second': second,
                  });
                  setState(() {});
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                  const Color(0xffE7EEFB),
                )),
                child: const Icon(Icons.pause),
              ),
            ],
          ),
          SizedBox(
            height: h * 0.01,
          ),
          ElevatedButton(
            onPressed: () {
              hour = minute = second = 0;
              isTimerOn = false;
              timerWatchHist = [];
              setState(() {});
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
              const Color(0xffE7EEFB),
            )),
            child: const Icon(Icons.restart_alt),
          ),
          SizedBox(
            height: h * 0.01,
          ),
          ...timerWatchHist.map((e) => Container(
                width: w,
                height: h * 0.05,
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Lap 1",
                      style: TextStyle(
                        fontSize: textScaler.scale(18),
                      ),
                    ),
                    Text(
                      "${e['hour'].toString().padLeft(2,'0')} : ${e['minute'].toString().padLeft(2,'0')} : ${e['second'].toString().padLeft(2,'0')}",
                      style: TextStyle(
                        fontSize: textScaler.scale(18),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
