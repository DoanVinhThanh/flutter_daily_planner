import 'package:flutter/material.dart';
import 'package:flutter_daily_planner/model/task.dart';


class EditTaskScreen extends StatefulWidget {
  final Task task; // Thêm tham số Task

  const EditTaskScreen({Key? key, required this.task}) : super(key: key);

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late TextEditingController titleTask;
  late TextEditingController noteTask;
  late TextEditingController datePickerController;
  
  String? selectedValuePeople;
  String? selectedValueTime;
  String? selectedValueDestination;

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
  @override
  void initState() {
    super.initState();

    // Initialize các controller và biến với giá trị từ task
    titleTask = TextEditingController(text: widget.task.title);
    noteTask = TextEditingController(text: widget.task.note);
    datePickerController = TextEditingController(text: widget.task.date);
    selectedValuePeople = widget.task.people;
    selectedValueTime = widget.task.time;
    selectedValueDestination = widget.task.destination;
  }

  // Hàm để mở DatePicker (giữ nguyên như ban đầu)
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        datePickerController.text =
            '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sửa công việc'),
        automaticallyImplyLeading: false,
        
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Công việc",
              style: TextStyle(color: Colors.blue, fontSize: 36),
            ),
            SizedBox(height: 30),
            // Các TextFormField và Dropdown như ban đầu
            TextFormField(
              controller: titleTask,
              decoration: const InputDecoration(
                labelText: "Nội dung công việc",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: datePickerController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Ngày thực hiện',
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(
                  width: 150,
                  child: DropdownButtonFormField(
                    value: selectedValuePeople,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValuePeople = newValue!;
                      });
                    },
                    items: dropdownItemsPeople,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                SizedBox(
                  width: 150,
                  child: DropdownButtonFormField(
                    value: selectedValueTime,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValueTime = newValue!;
                      });
                    },
                    items: dropdownItemsTime,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: noteTask,
              decoration: const InputDecoration(
                labelText: "Ghi chú",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField(
              value: selectedValueDestination,
              onChanged: (String? newValue) {
                setState(() {
                  selectedValueDestination = newValue!;
                });
              },
              items: dropdownItemsDestination,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Trả về null để xóa task
                    Navigator.pop(context, null);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text("Xóa công việc",
                  style: TextStyle(color: Colors.white),),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Cập nhật task
                    Task updatedTask = Task(
                      title: titleTask.text,
                      date: datePickerController.text,
                      people: selectedValuePeople!,
                      time: selectedValueTime!,
                      note: noteTask.text,
                      destination: selectedValueDestination!,
                    );
                    Navigator.pop(context, updatedTask); // Trả về task đã cập nhật
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text("Sửa công việc",
                  style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
