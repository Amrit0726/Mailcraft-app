import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart'; // ADD THIS
import 'core/theme/app_theme.dart';
import 'providers/theme_provider.dart';
import 'screens/home_screen.dart';

void main() async { // CHANGE: Make main async
  WidgetsFlutterBinding.ensureInitialized(); // ADD THIS
  await SharedPreferences.getInstance(); // ADD THIS - Initialize SharedPreferences
  
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MailcraftApp(),
    ),
  );
}

class MailcraftApp extends StatelessWidget {
  const MailcraftApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Mailcraft',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}