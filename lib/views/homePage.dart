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
        backgroundColor: Colors.white,
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
              decoration: BoxDecoration(color: Color(0xffFFCC60)),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://media.licdn.com/dms/image/D5603AQEi1-HR6IF5-A/profile-displayphoto-shrink_400_400/0/1718204945962?e=1723680000&v=beta&t=HfFeYsL_qkE3no6l0gUKlg0JnnmJkCdNC9JUpo-TKDE"),
              ),
            ),
            ListTile(
              leading: Text(
                "01",
                style: TextStyle(
                  fontSize: textScaler.scale(16),
                ),
              ),
              subtitle: const Text("A modern digital Clock"),
              title: TextButton(
                onPressed: () {},
                child: Text(
                  "Digital Clock",
                  style: TextStyle(
                      fontSize: textScaler.scale(16), color: Colors.black),
                ),
              ),
              tileColor: const Color(0xffFFCC60),
            ),
            ListTile(
              leading: Text(
                "02",
                style: TextStyle(
                  fontSize: textScaler.scale(16),
                ),
              ),
              subtitle: const Text("A classic Analog Clock"),
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
              tileColor: const Color(0xffFFCC60),
            ),
            ListTile(
              leading: Text(
                "03",
                style: TextStyle(
                  fontSize: textScaler.scale(16),
                ),
              ),
              subtitle: const Text("A Strap Watch"),
              title: TextButton(
                onPressed: () {},
                child: Text(
                  "Strap Watch",
                  style: TextStyle(
                    fontSize: textScaler.scale(16),
                    color: Colors.black,
                  ),
                ),
              ),
              tileColor: const Color(0xffFFCC60),
            ),
            ListTile(
              leading: Text(
                "04",
                style: TextStyle(
                  fontSize: textScaler.scale(16),
                ),
              ),
              subtitle: const Text("A Timer to track your records"),
              title: TextButton(
                onPressed: () {},
                child: Text(
                  "Timer",
                  style: TextStyle(
                    fontSize: textScaler.scale(16),
                    color: Colors.black,
                  ),
                ),
              ),
              tileColor: const Color(0xffFFCC60),
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
              Icons.watch,
              color: Color(0xff4C2B44),
            ),
            label: "Digital Clock",
            icon: Icon(
              Icons.watch_outlined,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.watch_later,
              color: Color(0xff4C2B44),
            ),
            icon: Icon(
              Icons.watch_later_outlined,
              color: Colors.black,
            ),
            label: "Analog Clock",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.watch,
              color: Color(0xff4C2B44),
            ),
            label: "Strap Watch",
            icon: Icon(
              Icons.watch_outlined,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.alarm,
              color: Color(0xff4C2B44),
            ),
            label: "Timer",
            icon: Icon(
              Icons.access_alarm,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
