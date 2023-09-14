import 'package:flutter/material.dart';
import 'package:task_manager_project/ui/data/modiuls/login_model.dart';
import 'package:task_manager_project/ui/screens/login_screen.dart';
import 'package:task_manager_project/ui/screens/user_profile_screen.dart';
import 'package:task_manager_project/ui/data/modiuls/auth_utility.dart';

class user_profile_banner extends StatefulWidget {
  const user_profile_banner({
    super.key,
  });

  @override
  State<user_profile_banner> createState() => _user_profile_bannerState();
}

class _user_profile_bannerState extends State<user_profile_banner> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => UserProfile()));
      },
      leading: CircleAvatar(
        backgroundImage: NetworkImage(AuthUtility.userInfo.data?.photo ?? ''),
        onBackgroundImageError: (_, __) {
          const Icon(Icons.image);
        },
      ),
      title: Text(
        '${AuthUtility.userInfo.data?.firstName ?? ''} ${AuthUtility.userInfo.data?.lastName ?? ''}',
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        '${AuthUtility.userInfo.data?.email ?? 'Unknown'} ',
        style: TextStyle(color: Colors.white),
      ),
      tileColor: Colors.green,
      trailing: IconButton(
          onPressed: () async {
            await AuthUtility.clearUserInfo();
            if (mounted) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            }
          },
          icon: Icon(Icons.logout)),
    );
  }
}
