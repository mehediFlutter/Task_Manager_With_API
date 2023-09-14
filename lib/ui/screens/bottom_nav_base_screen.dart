import 'package:flutter/material.dart';
import 'package:task_manager_project/ui/screens/cancel_task_screen%20.dart';
import 'package:task_manager_project/ui/screens/complete_task_screen%20.dart';
import 'package:task_manager_project/ui/screens/in_progress_task_screen.dart';
import 'package:task_manager_project/ui/screens/new_task_screen.dart';
import 'package:task_manager_project/ui/widgets/summary_card.dart';
import 'package:task_manager_project/ui/widgets/task_listTile.dart';
import 'package:task_manager_project/ui/widgets/user_profile_banner.dart';

class BottomNavBaseScreen extends StatefulWidget {
  const BottomNavBaseScreen({super.key});

  @override
  State<BottomNavBaseScreen> createState() => _BottomNavBaseScreenState();
}

class _BottomNavBaseScreenState extends State<BottomNavBaseScreen> {
  int _screenIndex = 0;
  final List<Widget> screens = [
    const NewTaskScreen(),
    const InProgressScreen(),
    const CancelTaskScreen(),
    const CompleteTaskScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_screenIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _screenIndex,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
          selectedItemColor: Colors.green,
          showUnselectedLabels: true,
          onTap: (int index) {
            _screenIndex = index;
            if (mounted) {
              setState(() {});
            }
          },
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.ac_unit), label: "New"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.account_tree), label: "In Progress"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.cancel_outlined), label: "Cancel"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.done_all), label: "Completed"),
          ]),
    );
  }
}
