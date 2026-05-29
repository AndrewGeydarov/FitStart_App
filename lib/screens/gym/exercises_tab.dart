import 'package:flutter/material.dart';
import 'package:fitstart_app/theme.dart';
import 'package:fitstart_app/screens/details/exercise_details.dart';

class ExercisesTab extends StatelessWidget {
  const ExercisesTab({super.key});

  static const List<Map<String, String>> exercises = [
    {'name': 'Жим лёжа', 'muscle': 'Грудь · Трицепс', 'diff': 'Средний'},
    {'name': 'Приседания', 'muscle': 'Ноги · Ягодицы', 'diff': 'Лёгкий'},
    {'name': 'Тяга верхнего блока', 'muscle': 'Спина · Бицепс', 'diff': 'Средний'},
    {'name': 'Армейский жим', 'muscle': 'Плечи · Трицепс', 'diff': 'Сложный'},
  ];

  Color _diffColor(String d) {
    switch (d) {
      case 'Лёгкий':
        return AppColors.green;
      case 'Средний':
        return AppColors.star;
      default:
        return AppColors.accent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Row(
            children: const [
              Icon(Icons.chevron_left, color: AppColors.textDark),
              SizedBox(width: 4),
              Text('Упражнения',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDark)),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: const [
                Icon(Icons.search, color: AppColors.textGray, size: 20),
                SizedBox(width: 10),
                Text('Поиск упражнения...',
                    style: TextStyle(color: AppColors.textGray, fontSize: 14)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 34,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: const [
              _Chip('Все', active: true),
              _Chip('Грудь'),
              _Chip('Спина'),
              _Chip('Ноги'),
              _Chip('Плечи'),
              _Chip('Пресс'),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.82,
            ),
            itemCount: exercises.length,
            itemBuilder: (context, i) => _card(context, exercises[i]),
          ),
        ),
      ],
    );
  }

  Widget _card(BuildContext context, Map<String, String> e) {
    final color = _diffColor(e['diff']!);
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => ExerciseDetailsSheet(exercise: e),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 88,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.lightGray,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Icon(Icons.sports_gymnastics,
                    color: AppColors.textGray, size: 28),
              ),
            ),
            const SizedBox(height: 10),
            Text(e['name']!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark)),
            const SizedBox(height: 4),
            Text(e['muscle']!,
                style:
                    const TextStyle(fontSize: 11, color: AppColors.textGray)),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Text(e['diff']!,
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: color)),
            ),
          ],
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final bool active;
  const _Chip(this.label, {this.active = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: active ? AppColors.primary : AppColors.lightGray,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(label,
          style: TextStyle(
              color: active ? Colors.white : AppColors.textGray,
              fontSize: 12,
              fontWeight: active ? FontWeight.w600 : FontWeight.normal)),
    );
  }
}
