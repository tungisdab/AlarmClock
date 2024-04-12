import 'package:alarm_clock/page/alarm.dart';
import 'package:alarm_clock/page/lovedays.dart';
import 'package:alarm_clock/page/music.dart';
import 'package:alarm_clock/page/read_pdf.dart';
import 'package:alarm_clock/page/sign_in_page.dart';
import 'package:alarm_clock/page/todo_view.dart';
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
      body: Column(
        children: [
          Divider(
            height: 1.5,
            thickness: 1.5,
            color: Colors.red,
          ),
          Expanded(
            child: TabBarView(
              children: [
                Alarm(),
                // _tabBarViewItem(Icons.task, 'Todo List'),
                TodoView(),
                Music(),
                Weather(),
                Lovedays(),
                ReadPdf(),
              ],
            ),
          ),
        ],
      ),
    );
  }
  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: Container(
        decoration: _boxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _space(),
            _topBar(),
            _tabBar(),
          ],
        ),
      ),
    );
  }
  
  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(0),
        top: Radius.circular(0),
      ),
      gradient: LinearGradient(
        colors: [Colors.white, Colors.white],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  Widget _topBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Heartbeats',
            style: TextStyle(
              color: Colors.red, 
              fontSize: 25,
              fontWeight: FontWeight.normal,
            ),
          ),
          Row(
            children: [
              CircleAvatar(
                child: Icon(
                  Icons.search_outlined,
                  color: Colors.red,
                  size: 30,
                ),
                backgroundColor: Colors.grey.shade300,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
              ),
              InkWell(
                onTap: (){
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                  );
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/icon/icon.png'),
                ),
              ),
            ],
          ),
        ],
      ),
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

  Widget _space() {
    return SizedBox(
      height: 30,
    );
  }

  Widget _tabBar() {
    return TabBar(
      labelPadding: const EdgeInsets.all(0),
      labelColor: Colors.red,
      indicatorColor: Colors.red,
      unselectedLabelColor: Colors.grey.shade600,
      indicator: BoxDecoration(  
        border: Border(
          bottom: BorderSide(
            color: Colors.red,
            width: 2,
            
          ),
        ),
      ),
      tabs: const [
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.alarm),
          // text: 'Alarm',
        ),
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.task),
        ),
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.my_library_music_outlined),
        ),
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.sunny_snowing),
        ),
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.favorite_border_outlined),
        ),
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.picture_as_pdf_outlined),
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