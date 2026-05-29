import 'package:flutter/material.dart';
import 'package:fitstart_app/theme.dart';
import 'package:fitstart_app/screens/subscription.dart';
import 'package:fitstart_app/screens/settings.dart';

class BottomProfilePage extends StatelessWidget {
  const BottomProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SettingsPage()),
                  );
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.lightGray,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.settings,
                      color: AppColors.textGray, size: 20),
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColors.lightGray,
                  child: Text('А',
                      style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 28,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 12),
                Text('Алексей Иванов',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark)),
              ],
            ),
          ),
          const SizedBox(height: 20),

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SubscriptionPage()),
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Flex 1 месяц',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 6),
                        Text('06.06.2026 · следующий платёж 1 900 ₽',
                            style: TextStyle(
                                color: Color(0xFFCAC4E8), fontSize: 12)),
                        SizedBox(height: 10),
                        Text('Подробнее →',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('29',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        Text('дней',
                            style: TextStyle(
                                color: Colors.white, fontSize: 10)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Баланс',
                        style: TextStyle(
                            color: AppColors.textGray, fontSize: 12)),
                    SizedBox(height: 4),
                    Text('0 ₽',
                        style: TextStyle(
                            color: AppColors.textDark,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    elevation: 0,
                  ),
                  onPressed: () {},
                  child: const Text('Пополнить'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          _menuItem(Icons.menu_book_outlined, 'Дневник тренировок'),
          const SizedBox(height: 12),
          _menuItem(Icons.bar_chart_rounded, 'Анализ состава тела'),
          const SizedBox(height: 12),
          _menuItem(Icons.description_outlined, 'Инструкции'),
          const SizedBox(height: 12),
          _menuItem(Icons.chat_bubble_outline_rounded, 'Помощник'),
        ],
      ),
    );
  }
  Widget _menuItem(IconData icon, String label) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 22),
          const SizedBox(width: 14),
          Text(label,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark)),
          const Spacer(),
          const Icon(Icons.chevron_right, color: AppColors.textGray),
        ],
      ),
    );
  }
}
