import 'package:flutter/material.dart';
import 'package:fitstart_app/theme.dart';
import 'package:fitstart_app/widgets/placeholder_box.dart';

class ActionPage extends StatelessWidget {
  const ActionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Тренировки',
            style: TextStyle(
                color: AppColors.textDark, fontWeight: FontWeight.w800)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('Тренировки',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDark)),
                const Spacer(),
                Text('Все ›',
                    style: TextStyle(
                        color: AppColors.accent,
                        fontWeight: FontWeight.w600,
                        fontSize: 13)),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 34,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _Chip('Пробные', active: true),
                  _Chip('Избранное'),
                  _Chip('Гибкость'),
                  _Chip('Кардио'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _workoutCard(
                      '5 минут на ягодицы', 'Аня', '5 мин', 'Функциональная'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _workoutCard(
                      'Вводная тренировка', 'Алина', '9 мин', 'Кардио'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                const Text('Стиль жизни',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDark)),
                const Spacer(),
                Text('Все ›',
                    style: TextStyle(
                        color: AppColors.accent,
                        fontWeight: FontWeight.w600,
                        fontSize: 13)),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 34,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _Chip('Избранное'),
                  _Chip('Питание'),
                  _Chip('Фейспластика'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _lifeCard(
                      'Тренировка для шеи и зоны декольте', 'Дарья'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _lifeCard('Короткая тренировка лифтинга лица', 'Алина'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _workoutCard(
      String title, String trainer, String dur, String type) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              const PlaceholderBox(
                  height: 100, width: double.infinity, label: ''),
              Positioned.fill(
                child: Center(
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.85),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.play_arrow_rounded,
                        color: AppColors.primary),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(title,
              maxLines: 2,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              _miniBadge(dur, AppColors.lightGray, AppColors.textGray),
              _miniBadge(type, AppColors.primary.withValues(alpha: 0.08),
                  AppColors.primary),
            ],
          ),
        ],
      ),
    );
  }

  Widget _lifeCard(String title, String trainer) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              const PlaceholderBox(
                  height: 100, width: double.infinity, label: ''),
              Positioned.fill(
                child: Center(
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.85),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.play_arrow_rounded,
                        color: AppColors.primary),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(title,
              maxLines: 2,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark)),
        ],
      ),
    );
  }

  Widget _miniBadge(String text, Color bg, Color fg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(11),
      ),
      child: Text(text, style: TextStyle(fontSize: 10, color: fg)),
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
        color: active ? AppColors.primary : Colors.white,
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
