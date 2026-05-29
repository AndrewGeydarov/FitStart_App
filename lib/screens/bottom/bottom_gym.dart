import 'package:flutter/material.dart';
import 'package:fitstart_app/theme.dart';
import 'package:fitstart_app/screens/gym/equipment_tab.dart';
import 'package:fitstart_app/screens/gym/exercises_tab.dart';

/// Вкладка "Зал" — объединяет Тренажёры (08) и Упражнения (10).
class BottomGymPage extends StatefulWidget {
  const BottomGymPage({super.key});

  @override
  State<BottomGymPage> createState() => _BottomGymPageState();
}

class _BottomGymPageState extends State<BottomGymPage> {
  int tab = 0; // 0 — тренажёры, 1 — упражнения

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        // Переключатель Тренажёры / Упражнения
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.lightGray,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                _segment('Тренажёры', 0),
                _segment('Упражнения', 1),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: tab == 0 ? const EquipmentTab() : const ExercisesTab(),
        ),
      ],
    );
  }

  Widget _segment(String label, int i) {
    final active = tab == i;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => tab = i),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: active ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(label,
                style: TextStyle(
                    color: active ? Colors.white : AppColors.textGray,
                    fontWeight: FontWeight.w600,
                    fontSize: 14)),
          ),
        ),
      ),
    );
  }
}
