import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'selection/selection_screen.dart'; // 正しいファイル名をインポート
import 'match_screen.dart';
import 'chat_screen.dart';
import 'event_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2; // デフォルトでマッチング画面を表示

  static final List<Widget> _widgetOptions = <Widget>[
    const ProfileScreen(),
    const SelectionScreen(), // 修正されたファイル名
    const MatchScreen(),
    const ChatScreen(),
    const EventScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'プロフィール',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'ジャンル選択',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'マッチング',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'チャット',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'イベント',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey, // 未選択状態のアイコンの色を指定
        onTap: _onItemTapped,
        showSelectedLabels: true, // 選択されたアイテムのラベルを表示
        showUnselectedLabels: true, // 選択されていないアイテムのラベルも表示
      ),
    );
  }
}