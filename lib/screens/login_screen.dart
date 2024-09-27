import 'package:flutter/material.dart';
import 'package:flutter_daily_planner/screens/home_screen.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController passController = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                'assets/icon.png', 
                width: 100, 
                height: 100, 
              ),
              const SizedBox(
                height: 20,
              ),
                const Text(
                  "Đăng nhập",
                  textAlign: TextAlign.center, 
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 32,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 50), 
                
                // TextFormField cho email
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress, 
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ), 
                    prefixIcon: Icon(Icons.email), 
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue, width: 2.0), // Màu viền khi ấn vào (màu xanh)
                      
                    ),
                  ),
                ),
                
                const SizedBox(height: 20), 
        
                // TextFormField cho mật khẩu
                TextFormField(
                  controller: passController,
                  obscureText: true, 
                  decoration: const InputDecoration(
                    labelText: "Mật khẩu",
                     border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),  
                    prefixIcon: Icon(Icons.lock), 
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue, width: 2.0), // Màu viền khi ấn vào (màu xanh)
                      
                    ),
                  ),
                ), 
                const SizedBox(height: 20), 
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context, 
                       MaterialPageRoute(builder: (context) =>  const HomeScreen()),
                      );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), 
                  ),
                  ),
                  child: const Text("Đăng nhập",
                  style: TextStyle(fontSize: 16,color: Colors.white),
                  ),
                  ),       
              ],
            ),
          ),
        ),
      ),
    );
  }
}
