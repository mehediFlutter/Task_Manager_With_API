import 'package:flutter/material.dart';
import 'package:task_manager_project/ui/screens/splash_screen.dart';

class TaskManagerApp extends StatefulWidget {
 static GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
   TaskManagerApp({super.key});

  @override
  State<TaskManagerApp> createState() => _TaskManagerAppState();
}

class _TaskManagerAppState extends State<TaskManagerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key:TaskManagerApp.globalKey ,
      debugShowCheckedModeBanner: false,
      title: "Task Manager",
      theme: ThemeData(
        primaryColor: Colors.green,
        primarySwatch: Colors.green,
        brightness: Brightness.light,
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 24),
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        textTheme: const TextTheme(
            titleLarge: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w500, letterSpacing: 0.65),
            titleMedium: TextStyle(fontSize: 15, color: Colors.black)),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light,
      home:  SafeArea(child: SplashScreen()),
    );
  }
}
