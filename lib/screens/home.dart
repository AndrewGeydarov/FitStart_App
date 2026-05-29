import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:fitstart_app/theme.dart';
import 'package:fitstart_app/screens/bottom/bottom_home.dart';
import 'package:fitstart_app/screens/bottom/bottom_schedule.dart';
import 'package:fitstart_app/screens/bottom/bottom_trainers.dart';
import 'package:fitstart_app/screens/bottom/bottom_gym.dart';
import 'package:fitstart_app/screens/bottom/bottom_profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  final List<Widget> screens = const [
    BottomHomePage(),
    BottomSchedulePage(),
    BottomTrainersPage(),
    BottomGymPage(),
    BottomProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(bottom: false, child: screens.elementAt(index)),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: SalomonBottomBar(
              selectedItemColor: AppColors.primary,
              unselectedItemColor: AppColors.textGray,
              currentIndex: index,
              onTap: (i) => setState(() => index = i),
              items: [
                SalomonBottomBarItem(
                  icon: const Icon(Icons.home_rounded),
                  title: const Text('Главная'),
                  selectedColor: AppColors.primary,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.calendar_month_rounded),
                  title: const Text('Расписание'),
                  selectedColor: AppColors.primary,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.people_alt_rounded),
                  title: const Text('Тренеры'),
                  selectedColor: AppColors.primary,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.fitness_center_rounded),
                  title: const Text('Зал'),
                  selectedColor: AppColors.primary,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.person_rounded),
                  title: const Text('Профиль'),
                  selectedColor: AppColors.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
