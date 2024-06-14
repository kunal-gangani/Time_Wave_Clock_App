import 'dart:async';
import 'dart:math';

import 'package:clock_app/globals/headers.dart';
import 'package:flutter/material.dart';

class AnalogClockComponent extends StatefulWidget {
  const AnalogClockComponent({super.key});

  @override
  State<AnalogClockComponent> createState() => _AnalogClockComponentState();
}

class _AnalogClockComponentState extends State<AnalogClockComponent> {
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
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xffE8EEFB),
            shape: BoxShape.circle,
          ),
          width: w * 0.9,
          height: h * 0.9,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ...List.generate(
                  60,
                  (index) => Transform.rotate(
                        angle: (index * (pi * 2)) / 60,
                        child: Divider(
                          indent: (index % 5 == 0) ? 350 : 360,
                          thickness: (index % 5 == 0) ? 3 : 1,
                          color: (index % 5 == 0) ? Colors.red : Colors.black,
                        ),
                      )),
              Transform.rotate(
                angle: pi/2,
                child: Transform.rotate(
                    angle: (hour % 12 + (minute / 60)) * (pi*2) / 12,
                    child: const Divider(
                      thickness: 4,
                      endIndent: 150,
                      indent: 70,
                      color: Colors.black,
                    )),
              ),
              Transform.rotate(
                angle: pi/2,
                child: Transform.rotate(
                    angle: (minute*(pi*2))/60,
                    child: const Divider(
                      thickness: 4,
                      endIndent: 150,
                      indent: 45,
                      color: Colors.orange,
                    )),
              ),
              Transform.rotate(
                  angle: (second*(pi*2))/60,
                  child: const Divider(
                    thickness: 4,
                    endIndent: 150,
                    indent: 30,
                    color: Colors.red,
                  )),
              Center(
                  child: CircleAvatar(
                backgroundColor: Colors.red,
                    radius: w*0.03,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
