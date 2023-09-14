import 'package:flutter/material.dart';
import 'package:task_manager_project/ui/widgets/task_listTile.dart';
import 'package:task_manager_project/ui/widgets/user_profile_banner.dart';

class InProgressScreen extends StatelessWidget {
  const InProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            user_profile_banner(),
            task_listTile(),
          ],
        ),
      ),
    );
  }
}
