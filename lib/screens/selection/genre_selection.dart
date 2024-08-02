import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/genre_provider.dart';

class GenreSelection extends StatelessWidget {
  final bool isVisible;
  final VoidCallback onToggleVisibility;

  const GenreSelection({super.key, 
    required this.isVisible,
    required this.onToggleVisibility,
  });

  final List<String> _genres = const [
    'ポップ',
    'ロック',
    'ジャズ',
    'ヒップホップ',
    'クラシック',
    '演歌',
    'アニメ',
    'VOCALOID',
  ];

  @override
  Widget build(BuildContext context) {
    final genreProvider = Provider.of<GenreProvider>(context);
    final List<String> selectedGenres = genreProvider.selectedGenres;

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onToggleVisibility,
            child: const Text('ジャンル選択'),
          ),
        ),
        if (isVisible)
          Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: _genres.length,
                itemBuilder: (context, index) {
                  final genre = _genres[index];
                  final isSelected = selectedGenres.contains(genre);

                  return GestureDetector(
                    onTap: () {
                      genreProvider.toggleGenre(genre);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blueAccent : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isSelected ? Colors.blue : Colors.grey,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          genre,
                          style: TextStyle(
                            fontSize: 18,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onToggleVisibility,
                  child: const Text('ジャンルを保存'),
                ),
              ),
            ],
          ),
      ],
    );
  }
}