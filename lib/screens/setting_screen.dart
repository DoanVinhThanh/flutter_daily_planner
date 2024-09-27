import 'package:flutter/material.dart';
import 'package:flutter_daily_planner/main.dart';
import 'package:flutter_daily_planner/provider/provider.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cài đặt"),
      ),
      body: Consumer<UIProvider>(
        builder: (context, notifier, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.dark_mode),
                  title: const Text("Chế độ tối"),
                  trailing: Switch(
                    value: notifier.isDark,
                    onChanged: (value) => notifier.changeTheme(),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.color_lens),
                  title: const Text("Chọn màu chính"),
                  trailing: DropdownButton<Color>(
                    value: notifier.primaryColor,
                    onChanged: (Color? newValue) {
                      if (newValue != null) {
                        notifier.updatePrimaryColor(newValue);
                      }
                    },
                    items: <Color>[
                      Colors.blue,
                      Colors.green,
                      Colors.red,
                      Colors.orange,
                      Colors.purple,
                    ].map<DropdownMenuItem<Color>>((Color color) {
                      return DropdownMenuItem<Color>(
                        value: color,
                        child: Container(
                          width: 24,
                          height: 24,
                          color: color,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.font_download),
                  title: const Text("Chọn font chữ"),
                  trailing: DropdownButton<String>(
                    value: notifier.fontFamily,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        notifier.updateFontFamily(newValue);
                      }
                    },
                    items: <String>['Roboto', 'Arial', 'Times New Roman']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MainApp()),
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
                    "Đăng xuất",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}