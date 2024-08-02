import 'package:flutter/material.dart';

class MachineSelection extends StatelessWidget {
  final bool isVisible;
  final bool isDamVisible;
  final bool isJoySoundVisible;
  final String selectedMachine;
  final VoidCallback onToggleVisibility;
  final VoidCallback onDamToggleVisibility;
  final VoidCallback onJoySoundToggleVisibility;
  final ValueChanged<String> onMachineSelected;

  const MachineSelection({
    super.key,
    required this.isVisible,
    required this.isDamVisible,
    required this.isJoySoundVisible,
    required this.selectedMachine,
    required this.onToggleVisibility,
    required this.onDamToggleVisibility,
    required this.onJoySoundToggleVisibility,
    required this.onMachineSelected,
  });

  final List<String> _damMachines = const [
    'LIVE DAM AiR（DAM-XG8000R）',
    'LIVE DAM Ai（DAM-XG8000）',
    'Cyber DAM +（DAM-G100W）'
  ];

  final List<String> _joySoundMachines = const [
    'JOYSOUND X1',
    'JOYSOUND MAX GO',
    'JOYSOUND 響Ⅱ'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onToggleVisibility,
            child: const Text('好きな機種'),
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
                itemCount: 2,
                itemBuilder: (context, index) {
                  final machineType = index == 0 ? 'DAM' : 'JOYSOUND';
                  final isSelected = selectedMachine.startsWith(machineType);

                  return GestureDetector(
                    onTap: () {
                      if (machineType == 'DAM') {
                        onDamToggleVisibility();
                      } else {
                        onJoySoundToggleVisibility();
                      }
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
                          machineType,
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
              if (isDamVisible) _buildMachineList(_damMachines),
              if (isJoySoundVisible) _buildMachineList(_joySoundMachines),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onToggleVisibility,
                  child: const Text('機種を保存'),
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildMachineList(List<String> machines) {
    return Column(
      children: machines.map((machine) {
        final isSelected = selectedMachine == machine;
        return ListTile(
          title: Text(machine),
          leading: Checkbox(
            value: isSelected,
            onChanged: (bool? value) {
              if (value == true) {
                onMachineSelected(machine);
              }
            },
          ),
          selected: isSelected,
          onTap: () {
            onMachineSelected(machine);
          },
        );
      }).toList(),
    );
  }
}