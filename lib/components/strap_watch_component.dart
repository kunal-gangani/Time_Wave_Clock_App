import 'package:clock_app/globals/headers.dart';

class StrapWatchComponent extends StatefulWidget {
  const StrapWatchComponent({super.key});

  @override
  State<StrapWatchComponent> createState() => _StrapWatchComponentState();
}

class _StrapWatchComponentState extends State<StrapWatchComponent> {
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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.scale(
              scale: 8,
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
                value: second / 60,
                color: Colors.orange,
              ),
            ),
            Transform.scale(
              scale: 7,
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
                value: minute / 60,
                color: Colors.red,
              ),
            ),
            Transform.scale(
              scale: 6,
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
                value: (hour % 12 + (minute / 60)) / 12,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
