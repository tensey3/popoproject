import 'package:flutter/material.dart';
import 'genre_selection.dart';
import 'machine_selection.dart';
import 'decade_selection.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  SelectionScreenState createState() => SelectionScreenState();
}

class SelectionScreenState extends State<SelectionScreen> {
  bool _isGenreGridVisible = false;
  bool _isMachineListVisible = false;
  bool _isDamListVisible = false;
  bool _isJoySoundListVisible = false;
  bool _isDecadesListVisible = false;
  String _selectedMachine = '';
  final List<RangeValues> _selectedDecadesRanges = [
    const RangeValues(1940, 2024)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('選択画面'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GenreSelection(
                isVisible: _isGenreGridVisible,
                onToggleVisibility: () {
                  setState(() {
                    _isGenreGridVisible = !_isGenreGridVisible;
                  });
                },
              ),
              const SizedBox(height: 20),
              MachineSelection(
                isVisible: _isMachineListVisible,
                isDamVisible: _isDamListVisible,
                isJoySoundVisible: _isJoySoundListVisible,
                selectedMachine: _selectedMachine,
                onToggleVisibility: () {
                  setState(() {
                    _isMachineListVisible = !_isMachineListVisible;
                    _isDamListVisible = false;
                    _isJoySoundListVisible = false;
                  });
                },
                onDamToggleVisibility: () {
                  setState(() {
                    _isDamListVisible = !_isDamListVisible;
                    _isJoySoundListVisible = false;
                  });
                },
                onJoySoundToggleVisibility: () {
                  setState(() {
                    _isJoySoundListVisible = !_isJoySoundListVisible;
                    _isDamListVisible = false;
                  });
                },
                onMachineSelected: (machine) {
                  setState(() {
                    _selectedMachine = machine;
                  });
                },
              ),
              const SizedBox(height: 20),
              DecadeSelection(
                isVisible: _isDecadesListVisible,
                selectedDecadesRanges: _selectedDecadesRanges,
                onToggleVisibility: () {
                  setState(() {
                    _isDecadesListVisible = !_isDecadesListVisible;
                  });
                },
                onRangeChanged: (values) {
                  setState(() {
                    final index = _selectedDecadesRanges
                        .indexWhere((range) => range == values);
                    if (index != -1) {
                      _selectedDecadesRanges[index] = values;
                    }
                  });
                },
                onAddRange: () {
                  setState(() {
                    _selectedDecadesRanges.add(const RangeValues(1940, 2024));
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
