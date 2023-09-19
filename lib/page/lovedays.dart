import 'package:flutter/material.dart';

class Lovedays extends StatefulWidget {
  const Lovedays({super.key});

  @override
  State<Lovedays> createState() => _LovedaysState();
}

class _LovedaysState extends State<Lovedays> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

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
        indicatorColor: Colors.amber[800],
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.favorite),
            icon: Icon(Icons.heart_broken_rounded),
            label: 'Love day',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border_rounded),
            label: 'Love all the time',
          ),
        ],
      ),
      body: <Widget>[
        SafeArea(
          child: Padding(
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
        ),
        SafeArea(
          child: Padding(
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
          ),
        ),
      ][currentPageIndex],
    );
  }
}