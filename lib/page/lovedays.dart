import 'package:flutter/material.dart';

class Lovedays extends StatefulWidget {
  const Lovedays({super.key});

  @override
  State<Lovedays> createState() => _LovedaysState();
}

class _LovedaysState extends State<Lovedays> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  int daylove = 1000;
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.red.shade200,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.favorite),
            icon: Icon(Icons.heart_broken_rounded),
            label: 'Love day',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_border_rounded),
            label: 'Love all the time',
          ),
        ],
      ),
      body: <Widget>[
        loveDay(),
        loveAllTheTime(),
      ][currentPageIndex],
    );
  }

  Widget loveDay(){
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              child: Text(
                'Celebrate love on a day of your choice',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
                left: 40,
                right: 40,
              ),
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Celebrate love',
                  fillColor: Colors.red,
                  suffixIcon: IconButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2150),
                      );
                    },
                    icon: const Icon(Icons.calendar_today),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [       
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: MediaQuery.of(context).size.width/2,
                    child: Image.asset('assets/icon/icon.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '$daylove',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'days of love',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
              ],
            ),
            Container(
              margin: EdgeInsets.all(30),
              child: Text(
                'My love for you is greater than $daylove days of love. I love you more than anything in the world.',
                overflow: TextOverflow.visible,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ),
            Container(
              margin: EdgeInsets.all(35),
              child: Image.asset(
                'assets/icon/icon.png',
                fit: BoxFit.cover,
              )
            ),
            Container(
              margin: EdgeInsets.all(35),
              child: Image.asset(
                'assets/icon/icon.png',
                fit: BoxFit.cover,
              )
            ),

          ],
        ),
      ),
    );
  }
  Widget loveAllTheTime(){
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
          left: 40,
          right: 40,
        ),
        child: Column(
          children: [
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'Celebrate love',
                fillColor: Colors.yellow,
                prefixIconColor: Colors.yellow,
                suffixIcon: IconButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2150),
                    );
                  },
                  icon: const Icon(Icons.calendar_today),
                ),
              ),
            ),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'Celebrate love',
                fillColor: Colors.red,
                suffixIcon: IconButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2150),
                    );
                  },
                  icon: const Icon(Icons.calendar_today),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

