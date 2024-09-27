import 'package:flutter/material.dart';
import 'login_screen.dart'; // Import màn hình đăng nhập

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon.png', 
              width: 100, 
              height: 100, 
              fit: BoxFit.cover, 
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Daily Planner',
              style: TextStyle(
                fontSize: 32,
                fontStyle: FontStyle.italic,
                color: Colors.blue, 
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            ElevatedButton(
              onPressed: () {
                // Chuyển sang trang đăng nhập khi nhấn nút
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), 
                ),
              ),
              child: const Text(
                'Chuyển Đến Trang Đăng Nhập',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
