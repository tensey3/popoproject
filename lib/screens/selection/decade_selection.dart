import 'package:flutter/material.dart';

class DecadeSelection extends StatelessWidget {
  final bool isVisible;
  final List<RangeValues> selectedDecadesRanges;
  final VoidCallback onToggleVisibility;
  final ValueChanged<RangeValues> onRangeChanged;
  final VoidCallback onAddRange;

  const DecadeSelection({
    super.key,
    required this.isVisible,
    required this.selectedDecadesRanges,
    required this.onToggleVisibility,
    required this.onRangeChanged,
    required this.onAddRange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onToggleVisibility,
            child: const Text('好きな年代'),
          ),
        ),
        if (isVisible)
          Column(
            children: [
              ...selectedDecadesRanges.asMap().entries.map((entry) {
                int index = entry.key;
                RangeValues range = entry.value;
                return Column(
                  children: [
                    RangeSlider(
                      values: range,
                      min: 1940,
                      max: 2024,
                      divisions: 84,
                      labels: RangeLabels(
                        '${range.start.round()}年',
                        '${range.end.round()}年',
                      ),
                      onChanged: (values) {
                        if (values.start < values.end) {
                          selectedDecadesRanges[index] = values;
                          onRangeChanged(values);
                        }
                      },
                    ),
                    Text(
                      '${range.start.round()}年 - ${range.end.round()}年',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              }),
              ElevatedButton(
                onPressed: onAddRange,
                child: const Text('好きな年代を追加する'),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onToggleVisibility,
                  child: const Text('年代を保存'),
                ),
              ),
            ],
          ),
      ],
    );
  }
}