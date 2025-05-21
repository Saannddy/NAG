import 'package:flutter/material.dart';
import 'package:nag_app/pages/articles.dart';
import 'package:nag_app/pages/stats.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NAG - Newborn Actionable Guidance',
      theme: ThemeData(),
      home: NavBar(),
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: BottomNavBar());
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<StatefulWidget> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selected = 0;
  static final List<Widget> _widgets = <Widget>[Stats(), Articles()];

  void _onItemTapped(int idx) => setState(() => _selected = idx);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgets.elementAt(_selected),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_nature),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_rounded),
            label: 'Articles',
          ),
        ],
        currentIndex: _selected,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
      ),
    );
  }
}
