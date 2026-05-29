import 'package:flutter/material.dart';
import 'package:fitstart_app/theme.dart';
import 'package:fitstart_app/widgets/placeholder_box.dart';
import 'package:fitstart_app/screens/details/equipment_details.dart';

class EquipmentTab extends StatelessWidget {
  const EquipmentTab({super.key});

  static const List<Map<String, dynamic>> equipments = [
    {'name': 'Беговая дорожка', 'zone': 'Кардио зона', 'available': true},
    {'name': 'Баттерфляй (Pec Deck)', 'zone': 'Силовая зона', 'available': false},
    {'name': 'Велотренажёр', 'zone': 'Кардио зона', 'available': true},
    {'name': 'Блочная рама', 'zone': 'Силовая зона', 'available': true},
  ];

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
              Text('Тренажёры',
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
                Text('Поиск тренажёра...',
                    style: TextStyle(color: AppColors.textGray, fontSize: 14)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Чипы-фильтры
        SizedBox(
          height: 34,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: const [
              _Chip('Все', active: true),
              _Chip('Кардио'),
              _Chip('Силовые'),
              _Chip('Свободные'),
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
              childAspectRatio: 0.78,
            ),
            itemCount: equipments.length,
            itemBuilder: (context, i) => _card(context, equipments[i]),
          ),
        ),
      ],
    );
  }

  Widget _card(BuildContext context, Map<String, dynamic> e) {
    final available = e['available'] as bool;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => EquipmentDetailsSheet(equipment: e),
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
            const PlaceholderBox(
                height: 90, width: double.infinity, icon: Icons.fitness_center),
            const SizedBox(height: 10),
            Text(e['name'] as String,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark)),
            const SizedBox(height: 4),
            Text(e['zone'] as String,
                style:
                    const TextStyle(fontSize: 11, color: AppColors.textGray)),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: (available ? AppColors.green : AppColors.accent)
                    .withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Text(available ? '● Доступно' : '● Занято',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: available ? AppColors.green : AppColors.accent)),
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
