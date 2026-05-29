import 'package:flutter/material.dart';
import 'package:fitstart_app/theme.dart';
import 'package:fitstart_app/widgets/placeholder_box.dart';
import 'package:fitstart_app/screens/details/trainer_details.dart';

class BottomTrainersPage extends StatelessWidget {
  const BottomTrainersPage({super.key});

  static const List<Map<String, String>> trainers = [
    {
      'name': 'Альберт Миргалимов',
      'role': 'Персональный тренер',
      'price': 'от 3 000 ₽',
      'exp': 'Стаж 14 лет',
      'rating': '5.0',
    },
    {
      'name': 'Юлия Павлюхина',
      'role': 'Персональный тренер',
      'price': 'от 2 500 ₽',
      'exp': 'Стаж 6 лет',
      'rating': '4.8',
    },
    {
      'name': 'Азат Мирзазянов',
      'role': 'Персональный тренер',
      'price': 'от 2 000 ₽',
      'exp': 'Стаж 6 лет',
      'rating': '5.0',
    },
    {
      'name': 'Алия Файзрахманова',
      'role': 'Персональный тренер',
      'price': 'от 2 300 ₽',
      'exp': 'Стаж 7 лет',
      'rating': '5.0',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: Row(
            children: const [
              Icon(Icons.chevron_left, color: AppColors.textDark),
              SizedBox(width: 4),
              Text('Персональные тренеры',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDark)),
              Spacer(),
              Icon(Icons.swap_vert, color: AppColors.textGray),
              SizedBox(width: 12),
              Icon(Icons.tune, color: AppColors.textGray),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Поиск
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
                Text('Поиск тренера...',
                    style: TextStyle(color: AppColors.textGray, fontSize: 14)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Сетка тренеров
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.66,
            ),
            itemCount: trainers.length,
            itemBuilder: (context, i) => _trainerCard(context, trainers[i]),
          ),
        ),
      ],
    );
  }

  Widget _trainerCard(BuildContext context, Map<String, String> t) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => TrainerDetailsSheet(trainer: t),
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
            const PlaceholderBox(height: 110, width: double.infinity),
            const SizedBox(height: 10),
            Text(t['name']!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark)),
            const SizedBox(height: 4),
            Text(t['role']!,
                style:
                    const TextStyle(fontSize: 11, color: AppColors.textGray)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(t['exp']!,
                  style: const TextStyle(
                      fontSize: 10, color: AppColors.primary)),
            ),
            const Spacer(),
            Row(
              children: [
                Text(t['price']!,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary)),
                const Spacer(),
                const Icon(Icons.star, color: AppColors.star, size: 14),
                const SizedBox(width: 2),
                Text(t['rating']!,
                    style: const TextStyle(
                        fontSize: 12, color: AppColors.textDark)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
