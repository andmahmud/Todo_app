import 'package:flutter/material.dart';

class todolistapp extends StatefulWidget {
  const todolistapp({super.key});

  @override
  State<todolistapp> createState() => todolistappState();
}

class todolistappState extends State<todolistapp> {
  final TextEditingController _controller = TextEditingController();

  final List<String> _tasks = [];

  void _addtask(String Task) {
    setState(() {
      _tasks.add(Task);
      _controller.clear();
    });
  }

  void _deletetask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void _toggoleTaskCompeletion(int index) {
    setState(() {
      _tasks[index] = "✅ ${_tasks[index]}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lightBlueAccent, Colors.pinkAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text("Today List"),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.lightBlueAccent, Colors.pinkAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Add a new task:",
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _controller,
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    _addtask(value);
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Task:",
                style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _tasks.length,
                  itemBuilder: (contex, index) {
                    return ListTile(
                      title: Text(_tasks[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.check),
                        onPressed: () {
                          _toggoleTaskCompeletion(index);
                        },
                      ),
                      onLongPress: () {
                        _deletetask(index);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
