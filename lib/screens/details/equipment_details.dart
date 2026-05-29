import 'package:flutter/material.dart';
import 'package:fitstart_app/theme.dart';
import 'package:fitstart_app/widgets/placeholder_box.dart';

class EquipmentDetailsSheet extends StatelessWidget {
  final Map<String, dynamic> equipment;
  const EquipmentDetailsSheet({super.key, required this.equipment});

  @override
  Widget build(BuildContext context) {
    final available = equipment['available'] as bool;
    return DraggableScrollableSheet(
      initialChildSize: 0.88,
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
                    label: 'Фото тренажёра',
                    icon: Icons.fitness_center),
                const SizedBox(height: 16),
                Text(equipment['name'] as String,
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark)),
                const SizedBox(height: 6),
                Text('${equipment['zone']} · Ряд A, место 3',
                    style: const TextStyle(
                        color: AppColors.textGray, fontSize: 13)),
                const SizedBox(height: 12),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: (available ? AppColors.green : AppColors.accent)
                        .withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(available ? '● Доступно' : '● Занято',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color:
                              available ? AppColors.green : AppColors.accent)),
                ),
                const SizedBox(height: 18),
                const _SectionTitle('Описание'),
                const SizedBox(height: 8),
                const Text(
                  'Профессиональная беговая дорожка с регулировкой скорости 1–20 км/ч и наклона.',
                  style: TextStyle(
                      color: AppColors.textGray, fontSize: 13, height: 1.4),
                ),
                const SizedBox(height: 18),
                const _SectionTitle('Инструкция по использованию'),
                const SizedBox(height: 8),
                ...const [
                  '1. Встаньте на боковые панели.',
                  '2. Нажмите кнопку Start.',
                  '3. Установите скорость и наклон.',
                  '4. После завершения нажмите Stop.',
                ].map((s) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Text(s,
                          style: const TextStyle(
                              color: AppColors.textGray,
                              fontSize: 13,
                              height: 1.3)),
                    )),
                const SizedBox(height: 12),
                const _SectionTitle('Видео-инструкция'),
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
                    child: const Text('Занять тренажёр',
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
