import 'package:clock_app/globals/headers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int hour = 0;
  int minute = 0;
  int second = 0;
  List myPage = [
    const DigitalClockComponent(),
    const AnalogClockComponent(),
    const StrapWatchComponent(),
    const TimerWatchComponent(),
  ];
  int bottomIndex = 0;
  Timer? timer;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    timer = Timer.periodic(const Duration(seconds: 60), (timer) {
      DateTime dateTime = DateTime.now();
      hour = dateTime.hour;
      minute = dateTime.minute;
      second = dateTime.second;
      setState(() {});
    });
    TextScaler textScaler = MediaQuery.textScalerOf(context);
    return Scaffold(
      appBar: AppBar(
        title: GradientText("Time Wave", colors: const [
          Colors.black,
          Colors.brown,
          Colors.black,
          Colors.brown
        ]),
        backgroundColor: const Color(0xffFFCC60),
      ),
      drawer: Drawer(
        elevation: 5,
        backgroundColor: Colors.grey.shade300,
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text(
                "Kunal Gangani",
                style: TextStyle(color: Colors.black),
              ),
              accountEmail: Text(
                "thekunalgangani@gmail.com",
                style: TextStyle(color: Colors.black),
              ),
              decoration: BoxDecoration(color: Colors.grey),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-vector/blue-circle-with-white-user_78370-4707.jpg?size=626&ext=jpg&uid=R120576166&ga=GA1.1.1753208886.1717404746&semt=ais_user"),
              ),
            ),
            ListTile(
              leading: Text(
                "1",
                style: TextStyle(
                  fontSize: textScaler.scale(16),
                ),
              ),
              title: TextButton(
                onPressed: () {},
                child: Text(
                  "Digital Clock",
                  style: TextStyle(
                      fontSize: textScaler.scale(16), color: Colors.black),
                ),
              ),
              tileColor: Colors.grey,
            ),
            const Divider(),
            ListTile(
              leading: Text(
                "2",
                style: TextStyle(
                  fontSize: textScaler.scale(16),
                ),
              ),
              title: TextButton(
                onPressed: () {},
                child: Text(
                  "Analog Clock",
                  style: TextStyle(
                    fontSize: textScaler.scale(16),
                    color: Colors.black,
                  ),
                ),
              ),
              tileColor: Colors.grey,
            ),
          ],
        ),
      ),
      body: myPage[bottomIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xffFFCC60),
        currentIndex: bottomIndex,
        onTap: (val) {
          bottomIndex = val;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.watch_outlined,
              color: Color(0xff4C2B44),
            ),
            label: "Digital Clock",
            icon: Icon(
              Icons.watch,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.watch_later_rounded,
              color: Color(0xff4C2B44),
            ),
            icon: Icon(
              Icons.watch_later,
              color: Colors.black,
            ),
            label: "Analog Clock",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.watch_outlined,
              color: Color(0xff4C2B44),
            ),
            label: "Strap Watch",
            icon: Icon(
              Icons.watch,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.watch_later_rounded,
              color: Color(0xff4C2B44),
            ),
            label: "Timer",
            icon: Icon(
              Icons.watch_later_rounded,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
