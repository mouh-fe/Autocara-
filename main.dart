import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'theme_provider.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const AutoCarePlusApp());
}

class AutoCarePlusApp extends StatelessWidget {
  const AutoCarePlusApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'AutoCare+',
            themeMode: themeProvider.themeMode,
            theme: ThemeData(
              primaryColor: const Color(0xFF4A90E2),
              scaffoldBackgroundColor: Colors.white,
              brightness: Brightness.light,
              textTheme: const TextTheme(
                bodyText2: TextStyle(color: Color(0xFF333333)),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A90E2),
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            darkTheme: ThemeData(
              primaryColor: const Color(0xFF90CAF9),
              scaffoldBackgroundColor: const Color(0xFF121212),
              brightness: Brightness.dark,
              textTheme: const TextTheme(
                bodyText2: TextStyle(color: Colors.white),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF90CAF9),
                  foregroundColor: Colors.black,
                ),
              ),
            ),
            home: const LoginScreen(),
          );
        },
      ),
    );
  }
}
