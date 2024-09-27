
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late Map<DateTime, List<String>> _events; 
  late DateTime _selectedDay; 
  late DateTime _focusedDay; 
  CalendarFormat _calendarFormat = CalendarFormat.month; 

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
    _events = {
      DateTime.utc(2024, 9, 25): ['Họp nhóm lúc 10AM'],
      DateTime.utc(2024, 9, 26): ['Nộp báo cáo', 'Gặp khách hàng'],
      
    };
  }

  
  List<String> _getEventsForDay(DateTime date) {
    return _events[date] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lịch Công Việc'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color.fromARGB(255, 147, 215, 250)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2024, 1, 1),
              lastDay: DateTime.utc(2024, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              calendarFormat: _calendarFormat, 
              onFormatChanged: (format) {
                
                setState(() {
                  _calendarFormat = format;
                });
              },
              onDaySelected: (selectedDay, focusedDay) {
                
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarStyle: const CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.orange, 
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.blue, 
                  shape: BoxShape.circle,
                ),
              ),
              eventLoader: (date) {
                
                return _getEventsForDay(date);
              },
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ListView.separated(
                itemCount: _getEventsForDay(_selectedDay).length,
                itemBuilder: (context, index) {
                  final event = _getEventsForDay(_selectedDay)[index];
                  return ListTile(
                    title: Text(event),
                  );
                }, separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 1.5,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}