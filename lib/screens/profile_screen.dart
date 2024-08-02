import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/genre_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _favoriteSongController = TextEditingController();
  int _frequency = 0;

  @override
  Widget build(BuildContext context) {
    final genreProvider = Provider.of<GenreProvider>(context);
    // ignore: no_leading_underscores_for_local_identifiers
    final List<String> _selectedGenres = genreProvider.selectedGenres;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            'プロフィール',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _usernameController,
            decoration: const InputDecoration(labelText: 'ユーザー名'),
          ),
          TextField(
            controller: TextEditingController(text: _selectedGenres.join(', ')),
            decoration: const InputDecoration(labelText: '好きなジャンル'),
            readOnly: true,
          ),
          TextField(
            controller: _favoriteSongController,
            decoration: const InputDecoration(labelText: 'よく歌う曲'),
          ),
          const SizedBox(height: 20),
          Text('カラオケの頻度: $_frequency'),
          Slider(
            value: _frequency.toDouble(),
            min: 0,
            max: 10,
            divisions: 10,
            label: '$_frequency',
            onChanged: (value) {
              setState(() {
                _frequency = value.toInt();
              });
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // 保存処理をここに追加
            },
            child: const Text('プロフィールを保存'),
          ),
        ],
      ),
    );
  }
}