import 'package:flutter/material.dart';
import 'package:flutter_daily_planner/model/task.dart';



class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

final TextEditingController titleTask = TextEditingController();
final TextEditingController noteTask = TextEditingController();
final TextEditingController datePickerController = TextEditingController();

String? selectedValuePeople = null;
String? selectedValueTime = null;
String? selectedValueDestination = null;

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime? _selectedDate;

  List<DropdownMenuItem<String>> get dropdownItemsPeople {
    return [
      DropdownMenuItem(child: Text("Thanh Ngân"), value: "Thanh Ngân"),
      DropdownMenuItem(child: Text("Hữu Nghĩa"), value: "Hữu Nghĩa"),
    ];
  }

  List<DropdownMenuItem<String>> get dropdownItemsTime {
    return [
      DropdownMenuItem(child: Text("8h -> 11h"), value: "8h -> 11h"),
      DropdownMenuItem(child: Text("13h -> 16h"), value: "13h -> 16h"),
    ];
  }

  List<DropdownMenuItem<String>> get dropdownItemsDestination {
    return [
      DropdownMenuItem(child: Text("Online"), value: "Online"),
      DropdownMenuItem(child: Text("cơ sở 1"), value: "cơ sở 1"),
      DropdownMenuItem(child: Text("cơ sở 2"), value: "cơ sở 2"),
    ];
  }

  // Hàm để mở DatePicker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        datePickerController.text =
            '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thêm công việc"),
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              
              Text(
                "Công việc",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 36,
                ),
              ),
              SizedBox(height: 30),

              // TextFormField for Task Title
              TextFormField(
                controller: titleTask,
                decoration: const InputDecoration(
                  labelText: "Nội dung công việc",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // TextFormField with Date Picker
              TextFormField(
                controller: datePickerController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Ngày thực hiện',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Dropdowns for People and Time
              Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: "Chủ trì",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      dropdownColor: Colors.blue,
                      value: selectedValuePeople,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValuePeople = newValue!;
                        });
                      },
                      items: dropdownItemsPeople,
                    ),
                  ),
                  SizedBox(width: 70),
                  SizedBox(
                    width: 150,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: "Thời gian",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      dropdownColor: Colors.blue,
                      value: selectedValueTime,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValueTime = newValue!;
                        });
                      },
                      items: dropdownItemsTime,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // TextFormField for Notes
              TextFormField(
                controller: noteTask,
                decoration: const InputDecoration(
                  labelText: "Ghi chú",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Dropdown for Destination
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: "Địa điểm",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                dropdownColor: Colors.blue,
                value: selectedValueDestination,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValueDestination = newValue!;
                  });
                },
                items: dropdownItemsDestination,
              ),
              SizedBox(height: 20),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Gather all task details
                    String taskTitle = titleTask.text;
                    String taskDate = datePickerController.text;
                    String taskPeople = selectedValuePeople ?? '';
                    String taskTime = selectedValueTime ?? '';
                    String taskNote = noteTask.text;
                    String taskDestination = selectedValueDestination ?? '';

                    // Ensure the required fields are filled
                    if (taskTitle.isNotEmpty && taskDate.isNotEmpty) {
                      Task newTask = Task(
                        title: taskTitle,
                        date: taskDate,
                        people: taskPeople,
                        time: taskTime,
                        note: taskNote,
                        destination: taskDestination,
                      );

                      // Pass the Task object back to the HomeScreen
                      Navigator.pop(context, newTask);

                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "Thêm công việc",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

