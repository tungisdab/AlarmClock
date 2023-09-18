import 'package:alarm_clock/page/alarm.dart';
import 'package:alarm_clock/page/todo.dart';
import 'package:alarm_clock/page/weather.dart';
import 'package:flutter/material.dart';
import 'package:alarm_clock/page/notification.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool check = true;
  String textSearch = "Steal someone's heart";
  final TextEditingController _searchText = TextEditingController();
  @override
  void initState() {
    super.initState();
    LocalNotification.initilize(flutterLocalNotificationsPlugin);
    tz.initializeTimeZones();
  }
  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: TabBarView(
        children: [
          Alarm(),
          // _tabBarViewItem(Icons.task, 'Todo List'),
          Todo(),
          _tabBarViewItem(Icons.my_library_music_outlined, 'Music'),
          // _tabBarViewItem(Icons.sunny_snowing, 'Weather'),
          Weather(),
          _tabBarViewItem(Icons.heart_broken, 'Lovedays'),
          _tabBarViewItem(Icons.picture_as_pdf_outlined, 'PDF'),
        ],
      ),
    );
  }
  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(150),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: _boxDecoration(),
        child: SafeArea(
          child: Column(
            children: [
              _topBar(),
              const SizedBox(height: 5),
              _searchBox(),
              _tabBar(),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(20),
        top: Radius.circular(20),
      ),
      gradient: LinearGradient(
        colors: [Color.fromARGB(255, 237, 80, 59), Color.fromARGB(255, 226, 104, 104)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  Widget _topBar() {
    return Row(
      children: [
        Image.asset(
          'assets/images/ah4.png',
          scale: 50,
        ),
        const Expanded(
          child: Text(
            'My Heartbeats',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color.fromARGB(255, 220, 231, 117), fontSize: 16),
          ),
        ),
        const CircleAvatar(
          radius: 15,
          backgroundImage: AssetImage('assets/icon/icon.png'),
        )
      ],
    );
  }

  Widget _searchBox() {
    return SizedBox(
      height: 35,
      child: TextFormField(
        textAlign: TextAlign.start,
        controller: _searchText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(Icons.search),
          suffixIcon: InkWell(
            child: const Icon(Icons.close),
            onTap: () {
              _searchText.clear();
            },
          ),
          hintText: textSearch,
          contentPadding: const EdgeInsets.all(0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(17)),
          ),
        ),
      ),
    );
  }

  Widget _tabBar() {
    return TabBar(
      labelPadding: const EdgeInsets.all(0),
      labelColor: Colors.lime.shade300,
      indicatorColor: Colors.black,
      unselectedLabelColor: Colors.white,
      tabs: const [
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.alarm),
          text: 'Alarm',
        ),
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.task),
          text: 'Todo',
        ),
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.my_library_music_outlined),
          text: 'Music',
        ),
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.sunny_snowing),
          text: 'Weather',
        ),
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.heart_broken),
          text: 'Lovedays',
        ),
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.picture_as_pdf_outlined),
          text: 'PDF',
        ),
      ],
    );
  }

  Widget _tabBarViewItem(IconData icon, String name) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 100,
        ),
        Text(
          name,
          style: const TextStyle(fontSize: 40),
        ),
      ],
    );
  }
}