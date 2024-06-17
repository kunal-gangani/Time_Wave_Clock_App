import 'package:clock_app/globals/headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DigitalClockComponent extends StatefulWidget {
  const DigitalClockComponent({super.key});

  @override
  State<DigitalClockComponent> createState() => _DigitalClockComponentState();
}

class _DigitalClockComponentState extends State<DigitalClockComponent> {
  int hour = 0;
  int minute = 0;
  int second = 0;
  Timer? timer;
  DateTime dateTime = DateTime.now();
  List<String> weekDays = ['Mon', 'Tues', 'Wed', 'Thurs', 'Fri', 'Sat', 'Sun'];
  List<String> monthNames = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();
        String day = weekDays[dateTime.weekday - 1];
        String month = monthNames[dateTime.month - 1];
        String date = dateTime.day.toString().padLeft(2, '0');
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
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
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
                            second.toString().padLeft(2, '0'),
                            style: TextStyle(
                              fontSize: textScaler.scale(35),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "${weekDays[dateTime.weekday - 1]} ${dateTime.day} ${monthNames[dateTime.month - 1]} ${dateTime.year}",
                    style: TextStyle(
                      fontSize: textScaler.scale(20),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
