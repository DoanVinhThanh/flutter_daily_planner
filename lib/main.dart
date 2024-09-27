import 'package:flutter/material.dart';
import 'package:flutter_daily_planner/provider/provider.dart';
import 'package:flutter_daily_planner/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => UIProvider()..init(),
      child: Consumer<UIProvider>(
        builder: (context, UIProvider notifier, child) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: notifier.isDark? ThemeMode.dark : ThemeMode.light,
            darkTheme: notifier.isDark? notifier.darkTheme :notifier.lightTheme,
            
            home: const WelcomeScreen(),
          );
        }
      ),
    );
  }
}
