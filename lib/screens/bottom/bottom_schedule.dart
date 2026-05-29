import 'package:flutter/material.dart';
import 'package:fitstart_app/theme.dart';

class BottomSchedulePage extends StatefulWidget {
  const BottomSchedulePage({super.key});

  @override
  State<BottomSchedulePage> createState() => _BottomSchedulePageState();
}

class _BottomSchedulePageState extends State<BottomSchedulePage> {
  int selectedDay = 0;

  final List<List<String>> days = const [
    ['ПТ', '8'],
    ['СБ', '9'],
    ['ВС', '10'],
    ['ПН', '11'],
    ['ВТ', '12'],
    ['СР', '13'],
    ['ЧТ', '14'],
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.chevron_left, color: AppColors.textDark),
              SizedBox(width: 4),
              Text('РАСПИСАНИЕ',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDark)),
            ],
          ),
          const SizedBox(height: 16),

          // Выбор дня
          SizedBox(
            height: 58,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: days.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, i) {
                final active = i == selectedDay;
                return GestureDetector(
                  onTap: () => setState(() => selectedDay = i),
                  child: Container(
                    width: 46,
                    decoration: BoxDecoration(
                      color: active ? AppColors.primary : Colors.white,
                      borderRadius: BorderRadius.circular(23),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(days[i][0],
                            style: TextStyle(
                                color: active
                                    ? Colors.white
                                    : AppColors.textGray,
                                fontSize: 10,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(height: 2),
                        Text(days[i][1],
                            style: TextStyle(
                                color:
                                    active ? Colors.white : AppColors.textDark,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _filterChip('Клубы ▾', active: true),
              const SizedBox(width: 8),
              _filterChip('Время ▾'),
              const SizedBox(width: 8),
              _filterChip('Интенсив ▾'),
            ],
          ),
          const SizedBox(height: 18),
          _classCard(
            time: '08.05  10:00',
            duration: '30 мин',
            name: 'Smart Start Низ Тела',
            trainer: 'Кадырова Татьяна',
            free: 'Свободно 2 из 6 мест',
            full: false,
          ),
          const SizedBox(height: 14),
          _classCard(
            time: '08.05  10:00',
            duration: '45 мин',
            name: 'MAKE BODY 45',
            trainer: 'Захарова Карина',
            free: 'Свободных мест нет',
            full: true,
          ),
          const SizedBox(height: 14),
          _classCard(
            time: '08.05  11:00',
            duration: '45 мин',
            name: 'МФР 45',
            trainer: 'Петрова Ольга',
            free: 'Свободно 5 из 8 мест',
            full: false,
          ),
          const SizedBox(height: 14),
          _classCard(
            time: '08.05  12:00',
            duration: '60 мин',
            name: 'Йога для начинающих',
            trainer: 'Смирнова Лена',
            free: 'Свободно 3 из 10 мест',
            full: false,
          ),
        ],
      ),
    );
  }

  Widget _filterChip(String label, {bool active = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: active ? AppColors.primary : AppColors.lightGray,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(label,
          style: TextStyle(
              color: active ? Colors.white : AppColors.textGray,
              fontSize: 12,
              fontWeight: active ? FontWeight.w600 : FontWeight.normal)),
    );
  }

  Widget _classCard({
    required String time,
    required String duration,
    required String name,
    required String trainer,
    required String free,
    required bool full,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$time   $duration',
              style: const TextStyle(color: AppColors.textGray, fontSize: 12)),
          const SizedBox(height: 8),
          Text(name,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark)),
          const SizedBox(height: 8),
          Row(
            children: const [
              Icon(Icons.location_on_outlined,
                  size: 16, color: AppColors.textGray),
              SizedBox(width: 4),
              Text('FITStart Казань',
                  style: TextStyle(color: AppColors.textGray, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const CircleAvatar(
                  radius: 12, backgroundColor: AppColors.lightGray),
              const SizedBox(width: 8),
              Text(trainer,
                  style:
                      const TextStyle(color: AppColors.textGray, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(full ? Icons.cancel_outlined : Icons.check_circle_outline,
                  size: 16, color: full ? AppColors.accent : AppColors.green),
              const SizedBox(width: 6),
              Text(free,
                  style: TextStyle(
                      color: full ? AppColors.accent : AppColors.green,
                      fontSize: 12)),
              const Spacer(),
              if (!full)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    elevation: 0,
                  ),
                  onPressed: () {},
                  child: const Text('Записаться', style: TextStyle(fontSize: 12)),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
