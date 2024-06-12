import 'package:clock_app/globals/headers.dart';

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
                  child: Column(
                    children: [
                      Expanded(flex: 1,child: Transform.translate(
                        offset: const Offset(0, 35),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            second.toString().padLeft(2, '0'),
                            style: TextStyle(fontSize: textScaler.scale(35),),
                          ),
                        ),
                      )),
                      Expanded(flex: 1,child: Container(color: Colors.transparent,
                      child: const Row(
                        children: [
                          // Text("${dateTime}")
                        ],
                      ),))
                    ],
                  ),
                ),
              ],
            ),
          )
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