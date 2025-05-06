import 'package:final_project/pages/list_page.dart';
import 'package:final_project/pages/tamu_page.dart';
import 'package:final_project/templates/routes.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  late String _title;

  final List<Widget> _children = [
    TamuPage(),
    ListPage(),
  ];

  @override
  void initState(){
    super.initState();
    _title = 'Visitor';
  }

  void onTabTapped(int index) {
     setState(() {
     _currentIndex = index;
      switch(index) { 
       case 0: { _title = 'Visitor'; } 
       break;
       case 1: { _title = 'List'; }
       break; 
      } 
     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff007D3C),
        title: Text(
          _title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            tooltip: 'Settings',
            onPressed: () {
              Navigator.pushNamed(
                context,
                MyRoutes.settingRoute,
              );
            },
          ),
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tamu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
        ],
      ),
    );
  }
}