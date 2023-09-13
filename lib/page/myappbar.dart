import 'package:flutter/material.dart';

class MyAppBar{
  final TextEditingController _searchText = TextEditingController();
  PreferredSize appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(150),
      child: Container(
        margin: const EdgeInsets.only(top: 5),
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
      ),
      gradient: LinearGradient(
        colors: [Colors.white, Colors.teal.shade300],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  Widget _topBar() {
    return Row(
      children: [
        Image.asset(
          'assets/logo.png',
          scale: 50,
        ),
        const Expanded(
          child: Text(
            'EasySoftCode',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        const CircleAvatar(
          radius: 15,
          backgroundImage: AssetImage('assets/profile.jpeg'),
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
          hintText: 'Search...',
          contentPadding: const EdgeInsets.all(0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }

  Widget _tabBar() {
    return TabBar(
      labelPadding: const EdgeInsets.all(0),
      labelColor: Colors.black,
      indicatorColor: Colors.black,
      unselectedLabelColor: Colors.teal.shade800,
      tabs: const [
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.home),
          text: 'Home',
        ),
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.group),
          text: 'Group',
        ),
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.notifications),
          text: 'Notifications',
        ),
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.menu),
          text: 'Menu',
        ),
      ],
    );
  }

  Widget tabBarViewItem(IconData icon, String name) {
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