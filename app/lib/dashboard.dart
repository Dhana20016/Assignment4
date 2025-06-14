import 'package:flutter/material.dart';
import 'service_api.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<String> lessons = [];
  final TextEditingController _controller = TextEditingController();
  String searchText = '';

  @override
  void initState() {
    super.initState();
    fetchLessons();
  }

  Future<void> fetchLessons() async {
    final data = await ApiService.getLessons();
    setState(() {
      lessons = data;
    });
  }

  Future<void> addLesson() async {
    if (_controller.text.isNotEmpty) {
      await ApiService.addLesson(_controller.text.trim());
      _controller.clear();
      fetchLessons();
    }
  }

  @override
  Widget build(BuildContext context) {
    final filtered = lessons
        .where((item) => item.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text("Lessons")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              onChanged: (val) => setState(() => searchText = val),
              decoration: InputDecoration(
                hintText: "Search lessons...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Add new lesson",
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: addLesson,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: filtered.map((title) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
