import 'package:flutter/material.dart';
import 'package:fitstart_app/theme.dart';
import 'package:fitstart_app/widgets/placeholder_box.dart';

class ExerciseDetailsSheet extends StatelessWidget {
  final Map<String, String> exercise;
  const ExerciseDetailsSheet({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const PlaceholderBox(
                    height: 130,
                    width: double.infinity,
                    label: 'Анимация (GIF/Видео)',
                    icon: Icons.sports_gymnastics),
                const SizedBox(height: 16),
                Text(exercise['name']!,
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark)),
                const SizedBox(height: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Text(exercise['diff']!,
                      style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary)),
                ),
                const SizedBox(height: 18),
                const _SectionTitle('Целевые мышцы'),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: const [
                    _Tag('Большая грудная'),
                    _Tag('Трицепс'),
                    _Tag('Передние дельты'),
                  ],
                ),
                const SizedBox(height: 18),
                const _SectionTitle('Техника выполнения'),
                const SizedBox(height: 8),
                ...const [
                  '1. Лягте на скамью, возьмите гриф.',
                  '2. Опустите штангу к груди.',
                  '3. Выжмите штангу вверх.',
                  '4. Не отрывайте спину от скамьи.',
                ].map((s) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Text(s,
                          style: const TextStyle(
                              color: AppColors.textGray,
                              fontSize: 13,
                              height: 1.3)),
                    )),
                const SizedBox(height: 12),
                const _SectionTitle('Видео-разбор'),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 90,
                  decoration: BoxDecoration(
                    color: AppColors.lightGray,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.play_arrow_rounded,
                            color: AppColors.primary, size: 22),
                        SizedBox(width: 8),
                        Text('Смотреть видео',
                            style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                const _SectionTitle('Рекомендуемые параметры'),
                const SizedBox(height: 8),
                const Text('3–4 подхода · 8–12 повторений · 60 сек отдых',
                    style:
                        TextStyle(color: AppColors.textGray, fontSize: 13)),
                const SizedBox(height: 22),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26)),
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: const Text('Добавить в дневник',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark));
  }
}

class _Tag extends StatelessWidget {
  final String text;
  const _Tag(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Text(text,
          style: const TextStyle(fontSize: 11, color: AppColors.primary)),
    );
  }
}
