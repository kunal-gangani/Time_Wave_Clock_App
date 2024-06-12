import 'dart:math';

import 'package:flutter/material.dart';

class AnalogClockComponent extends StatefulWidget {
  const AnalogClockComponent({super.key});

  @override
  State<AnalogClockComponent> createState() => _AnalogClockComponentState();
}

class _AnalogClockComponentState extends State<AnalogClockComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xffE8EEFB),
            shape: BoxShape.circle,
          ),
          width: 300,
          height: 300,
          child: Stack(
            alignment: Alignment.center,
            children: List.generate(60, (index) => Transform.rotate(
              angle: (index * (pi * 2)) / 60,
              child: Container(
                height: 10,
                child: const Divider(
                  indent: 100,
                  thickness: 1,
                ),
              ),
            )),
          ),
        ),
      ),
    );
  }
}